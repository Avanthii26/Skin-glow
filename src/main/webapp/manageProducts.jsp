<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Products - Skin Glow</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('skin.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(3px);
            z-index: -1;
        }

        .container {
            margin: 100px auto;
            padding: 30px;
            background: rgba(255,255,255,0.1);
            border-radius: 15px;
            display: inline-block;
            min-width: 90%;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.5);
        }

        h2 {
            font-size: 32px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background: rgba(0,0,0,0.3);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background: rgba(0,0,0,0.6);
            font-size: 18px;
        }

        td {
            background: rgba(0,0,0,0.3);
        }

        tr:hover td {
            background: rgba(255,255,255,0.1);
        }

        a.action-btn {
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 20px;
            color: white;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            margin: 2px;
            display: inline-block;
            transition: 0.3s;
        }

        a.action-btn:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
            transform: scale(1.05);
        }

        a.add-btn {
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 30px;
            color: white;
            background: linear-gradient(to right, #ff6f61, #ff9472);
            font-size: 18px;
            font-weight: bold;
            transition: 0.3s;
        }

        a.add-btn:hover {
            background: linear-gradient(to right, #ff9472, #ff6f61);
            transform: scale(1.05);
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Products</h2>
        <table>
            <tr>
                <th>ID</th><th>Title</th><th>Description</th>
                <th>Price</th><th>Stock</th><th>Image</th><th>Action</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/skinglow", "root", "root");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM products");
                    while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getInt("stock") %></td>
                <td><%= rs.getString("image") %></td>
                <td>
                    <a href="EditProductServlet?id=<%= rs.getInt("id") %>" class="action-btn">Edit</a>
                    <a href="DeleteProductServlet?id=<%= rs.getInt("id") %>" class="action-btn" 
                       onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
            <%
                    }
                    con.close();
                } catch(Exception e){
                    out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
        <a href="addProduct.jsp" class="add-btn"> Add New Product</a>
    </div>
</body>
</html>
