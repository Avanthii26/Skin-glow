package skindemo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ViewUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String[]> users = new ArrayList<>();

        try (Connection con = DBUtil.getConnection()) {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT id, name, email FROM users");

            while (rs.next()) {
                users.add(new String[] {
                    String.valueOf(rs.getInt("id")),
                    rs.getString("name"),
                    rs.getString("email")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("users", users);
        RequestDispatcher rd = req.getRequestDispatcher("viewUsers.jsp");
        rd.forward(req, resp);
    }
}
