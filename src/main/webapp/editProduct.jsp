<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/skinglow", "root", "root");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product - Skin Glow</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('skin.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(3px);
            z-index: -1;
        }

        .container {
            margin: 80px auto;
            background: rgba(255,255,255,0.1);
            padding: 40px;
            border-radius: 15px;
            width: 450px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.5);
        }

        h2 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px black;
        }

        form {
            text-align: left;
        }

        label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
        }

        img {
            margin-top: 5px;
            border-radius: 8px;
        }

        button {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            color: white;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            transition: 0.3s;
        }

        button:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Product</h2>
        <form action="UpdateProductServlet" method="post">
            <input type="hidden" name="id" value="<%=rs.getInt("id")%>">

            <label>Product:</label>
            <p><%= rs.getString("title") %></p>

            <label>Description:</label>
            <p><%= rs.getString("description") %></p>

            <label>Current Image:</label>
            <img src="<%= rs.getString("image") %>" width="120">

            <label>Price:</label>
            <input type="number" step="0.01" name="price" value="<%= rs.getDouble("price") %>" required>

            <label>Stock:</label>
            <input type="number" name="stock" value="<%= rs.getInt("stock") %>" required>

            <button type="submit">Update Product</button>
        </form>
    </div>
</body>
</html>
