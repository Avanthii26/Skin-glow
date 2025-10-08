package skindemo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String image = request.getParameter("image");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/skinglow", "root", "root");

            String sql = "INSERT INTO products(title, description, price, stock, image, created_at) VALUES (?, ?, ?, ?, ?, NOW())";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setInt(4, Integer.parseInt(stock));
            ps.setString(5, image);

            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<html><body style='font-family:Arial; text-align:center;'>");
                out.println("<h2 style='color:green;'>✅ Product Added Successfully!</h2>");
                out.println("<p><b>Title:</b> " + title + "</p>");
                out.println("<p><b>Price:</b> " + price + "</p>");
                out.println("<p><b>Stock:</b> " + stock + "</p>");
                out.println("<br><form action='adminDashboard.jsp'>");
                out.println("<button type='submit'>⬅ Back to Dashboard</button>");
                out.println("</form>");
                out.println("</body></html>");
            } else {
                out.println("<h3 style='color:red;'>❌ Failed to Add Product</h3>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward GET requests to POST
        doPost(request, response);
    }
}
