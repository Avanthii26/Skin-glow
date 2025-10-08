package skindemo;

import java.io.*;
import javax.servlet.http.*;
import java.sql.*;

public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if (session == null) { 
            resp.sendRedirect("login.jsp"); 
            return; 
        }

        int userId = (int) session.getAttribute("userId");
        int pid = Integer.parseInt(req.getParameter("pid"));
        String action = req.getParameter("action"); // new parameter
        int qty = 1; // default qty

        if(action == null) action = "add"; // default action is add
        if(req.getParameter("qty") != null) {
            qty = Integer.parseInt(req.getParameter("qty"));
        }

        try (Connection con = DBUtil.getConnection()) {
            if(action.equals("add")) {
                // Check if product already in cart
                PreparedStatement check = con.prepareStatement(
                    "SELECT qty FROM cart WHERE user_id=? AND product_id=?");
                check.setInt(1, userId);
                check.setInt(2, pid);
                ResultSet rs = check.executeQuery();
                if(rs.next()) {
                    // Update quantity
                    int existingQty = rs.getInt("qty");
                    PreparedStatement ps = con.prepareStatement(
                        "UPDATE cart SET qty=? WHERE user_id=? AND product_id=?");
                    ps.setInt(1, existingQty + qty);
                    ps.setInt(2, userId);
                    ps.setInt(3, pid);
                    ps.executeUpdate();
                    ps.close();
                } else {
                    // Insert new
                    PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO cart(user_id, product_id, qty) VALUES(?,?,?)");
                    ps.setInt(1, userId);
                    ps.setInt(2, pid);
                    ps.setInt(3, qty);
                    ps.executeUpdate();
                    ps.close();
                }
                rs.close();
                check.close();
            } else if(action.equals("remove")) {
                // Remove item from cart
                PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM cart WHERE user_id=? AND product_id=?");
                ps.setInt(1, userId);
                ps.setInt(2, pid);
                ps.executeUpdate();
                ps.close();
            }

            resp.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
