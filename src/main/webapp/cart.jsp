<%@ page import="java.sql.*,skindemo.DBUtil" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Your Cart - Skin Glow</title>
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
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(3px);
            z-index: -1;
        }

        .container {
            margin: 80px auto;
            padding: 30px;
            background: rgba(255,255,255,0.1);
            border-radius: 15px;
            display: inline-block;
            width: 90%;
            max-width: 900px;
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
            margin-bottom: 20px;
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

        .total {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            margin-right: 20px;
        }

        .empty {
            font-size: 18px;
            font-weight: bold;
            color: #ff4d4d;
        }

        button {
            padding: 8px 15px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            color: white;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            transition: 0.3s;
            margin: 2px;
        }

        button:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
            transform: scale(1.05);
        }

        .actions {
            display: flex;
            justify-content: center;
        }

        .back-btn {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Cart</h2>
        <table>
            <tr>
                <th>Product</th>
                <th>Qty</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
            <%
                double total = 0;
                boolean hasItems = false;
                try(Connection con = DBUtil.getConnection()) {
                    PreparedStatement ps = con.prepareStatement(
                        "SELECT c.product_id, p.title, c.qty, (p.price * c.qty) AS subtotal " +
                        "FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id=?");
                    ps.setInt(1, userId);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                        hasItems = true;
                        int productId = rs.getInt("product_id");
                        total += rs.getDouble("subtotal");
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getInt("qty") %></td>
<td>&#8377;<%= String.format("%.2f", rs.getDouble("subtotal")) %></td>
                <td>
                    <form action="CartServlet" method="post">
                        <input type="hidden" name="pid" value="<%= productId %>">
                        <input type="hidden" name="action" value="remove">
                        <button type="submit">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    if(!hasItems){
            %>
            <tr><td colspan="4" class="empty">Your cart is empty.</td></tr>
            <%
                    }
                } catch(Exception e) {
                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>

        <% if(hasItems){ %>
<div class="total">Total = &#8377;<%= String.format("%.2f", total) %></div>
            <div class="actions">
                <form action="<%= request.getContextPath() %>/OrderServlet" method="post">
                    <button type="submit">Place Order</button>
                </form>
            </div>
        <% } %>

        <div class="back-btn">
            <form action="products.jsp" method="get">
                <button type="submit">Back to Products</button>
            </form>
        </div>
    </div>
</body>
</html>
