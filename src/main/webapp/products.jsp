<%@ page import="java.sql.*,skindemo.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products - Skin Glow</title>
<style>
    body {margin:0;font-family:Arial,sans-serif;background:url('skin.jpg') no-repeat center center fixed;background-size:cover;color:white;text-align:center;}
    body::before{content:"";position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.5);backdrop-filter:blur(3px);z-index:-1;}
    .container{margin:80px auto;padding:30px;background:rgba(255,255,255,0.1);border-radius:15px;display:inline-block;width:90%;max-width:900px;box-shadow:0px 4px 15px rgba(0,0,0,0.5);}
    h2{font-size:32px;margin-bottom:30px;text-shadow:2px 2px 5px black;}
    table{width:100%;border-collapse:collapse;margin-bottom:30px;background:rgba(0,0,0,0.3);border-radius:10px;overflow:hidden;}
    th,td{padding:12px 15px;text-align:center;}
    th{background:rgba(0,0,0,0.6);font-size:18px;}
    td{background:rgba(0,0,0,0.3);}
    tr:hover td{background:rgba(255,255,255,0.1);}
    input[type=number]{width:60px;padding:5px;border-radius:5px;border:none;text-align:center;margin-right:5px;}
    button{padding:8px 15px;font-size:16px;font-weight:bold;border:none;border-radius:25px;cursor:pointer;color:white;background:linear-gradient(to right,#36d1dc,#5b86e5);transition:0.3s;}
    button:hover{background:linear-gradient(to right,#5b86e5,#36d1dc);transform:scale(1.05);}
    form{display:flex;justify-content:center;align-items:center;}
    .out-of-stock{color:#ff4d4d;font-weight:bold;}
</style>
</head>
<body>
<div class="container">
<h2>Products</h2>
<table>
<tr>
    <th>Title</th>
    <th>Price</th>
    <th>Action</th>
</tr>
<%
    try(Connection con = DBUtil.getConnection()) {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM products");
        while(rs.next()) {
            int stock = rs.getInt("stock");
%>
<tr>
    <td><%= rs.getString("title") %></td>
    <td>Price: <%= String.format("%.2f", rs.getDouble("price")) %></td>
    <td>
        <% if(stock > 0) { %>
            <form action="CartServlet" method="post">
                <input type="hidden" name="pid" value="<%= rs.getInt("id") %>">
                <input type="number" name="qty" value="1" min="1" max="<%= stock %>">
                <button type="submit">Add to Cart</button>
            </form>
        <% } else { %>
            <span class="out-of-stock">Out of Stock</span>
        <% } %>
    </td>
</tr>
<%
        }
    } catch(Exception e) { 
        out.println("<tr><td colspan='3'>Error: "+e+"</td></tr>"); 
    }
%>
</table>
 <form action="login.jsp" method="get">
                <button type="submit">Back</button>
            </form>
</div>
</body>
</html>
