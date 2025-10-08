package skindemo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // simple hardcoded check (replace with DB later)
        if ("admin".equals(username) && "admin123".equals(password)) {
            // ✅ Create session and store admin user
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);

            // ✅ Redirect to dashboard
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // back to login page if invalid
            response.sendRedirect("adminlogin.jsp?error=1");
        }
    }
}
