package skindemo;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("products.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if(userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            con.setAutoCommit(false); // Start transaction

            // 1. Fetch cart items
            ps = con.prepareStatement(
                "SELECT c.product_id, c.qty, p.price FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id=?");
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            double totalAmount = 0;
            boolean hasItems = false;

            while(rs.next()) {
                hasItems = true;
                int productId = rs.getInt("product_id");
                int qty = rs.getInt("qty");
                double price = rs.getDouble("price");

                // 2. Check stock and update products table
                PreparedStatement updateStock = con.prepareStatement(
                    "UPDATE products SET stock = stock - ? WHERE id=? AND stock >= ?");
                updateStock.setInt(1, qty);
                updateStock.setInt(2, productId);
                updateStock.setInt(3, qty);
                int updated = updateStock.executeUpdate();
                updateStock.close();

                if(updated == 0) {
                    con.rollback();
                    response.getWriter().println("Not enough stock for product ID: " + productId);
                    return;
                }

                totalAmount += price * qty;
            }

            if(!hasItems) {
                response.getWriter().println("Your cart is empty.");
                return;
            }

            // 3. Insert into orders table
            ps = con.prepareStatement(
            	    "INSERT INTO orders(user_id, total, status, placed_at) VALUES(?, ?, 'PLACED', NOW())",
            	    Statement.RETURN_GENERATED_KEYS);
            	ps.setInt(1, userId);
            	ps.setDouble(2, totalAmount);

            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            int orderId = 0;
            if(rs.next()) {
                orderId = rs.getInt(1);
            }

            // 4. Insert into order_items table
            ps = con.prepareStatement(
                "INSERT INTO order_items(order_id, product_id, qty, price) VALUES(?, ?, ?, ?)");
            PreparedStatement psCart = con.prepareStatement(
                "SELECT c.product_id, c.qty, p.price FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id=?");
            psCart.setInt(1, userId);
            ResultSet cartRs = psCart.executeQuery();

            while(cartRs.next()) {
                ps.setInt(1, orderId);
                ps.setInt(2, cartRs.getInt("product_id"));
                ps.setInt(3, cartRs.getInt("qty"));
                ps.setDouble(4, cartRs.getDouble("price"));
                ps.executeUpdate();
            }

            psCart.close();
            ps.close();

            // 5. Clear cart
            ps = con.prepareStatement("DELETE FROM cart WHERE user_id=?");
            ps.setInt(1, userId);
            ps.executeUpdate();

            con.commit(); // Commit transaction
            response.sendRedirect("order_success.jsp");

        } catch(Exception e) {
            try { if(con != null) con.rollback(); } catch(Exception ex) {}
            e.printStackTrace();
            response.getWriter().println("Error placing order: " + e.getMessage());
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    }
}
