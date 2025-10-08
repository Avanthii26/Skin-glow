<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registered Users - Skin Glow</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('skin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
            text-align: center;
        }
        h2 {
            margin-top: 120px;
            font-size: 36px;
            text-shadow: 2px 2px 5px black;
        }
        table {
            margin: 30px auto;
            border-collapse: collapse;
            width: 70%;
            background: rgba(0,0,0,0.6);
            box-shadow: 0px 4px 10px rgba(0,0,0,0.3);
        }
        th, td {
            border: 1px solid white;
            padding: 12px;
            font-size: 18px;
        }
        th {
            background-color: rgba(255,255,255,0.2);
        }
        tr:hover {
            background-color: rgba(255,255,255,0.1);
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: black;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        a:hover {
            background: gray;
        }
    </style>
</head>
<body>
    <h2>Registered Users</h2>
    <table>
        <tr><th>ID</th><th>Name</th><th>Email</th></tr>
        <%
            java.util.List<String[]> users = (java.util.List<String[]>) request.getAttribute("users");
            for (String[] u : users) {
        %>
            <tr>
                <td><%= u[0] %></td>
                <td><%= u[1] %></td>
                <td><%= u[2] %></td>
            </tr>
        <% } %>
    </table>
    <a href="adminDashboard.jsp">⬅ Back to Dashboard</a>
</body>
</html>
