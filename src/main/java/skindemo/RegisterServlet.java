package skindemo;

import java.io.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/plain"); // important for AJAX
        PrintWriter out = resp.getWriter();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String phone = req.getParameter("phone");

        try (Connection con = DBUtil.getConnection()) {

            // Check if email already exists
            PreparedStatement check = con.prepareStatement("SELECT * FROM users WHERE email=?");
            check.setString(1, email);
            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                out.println("Email already registered!");
                return;
            }

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,email,password_hash,phone,role) VALUES(?,?,?,?, 'USER')"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, phone);

            int i = ps.executeUpdate();
            if (i > 0) out.println("Registration successful!");
            else out.println("Error during registration!");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}
