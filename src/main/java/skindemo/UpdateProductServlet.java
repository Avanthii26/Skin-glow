package skindemo;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/skinglow", "root", "root");

            // Update query -> only price & stock
            String sql = "UPDATE products SET price=?, stock=? WHERE id=?";
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, Double.parseDouble(price));
            ps.setInt(2, Integer.parseInt(stock));
            ps.setInt(3, Integer.parseInt(id));

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // redirect back to product list
                response.sendRedirect("manageProducts.jsp");
            } else {
                out.println("<h3>❌ Product update failed!</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
