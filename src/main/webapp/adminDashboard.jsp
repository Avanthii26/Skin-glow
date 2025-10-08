<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if admin is logged in
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect("adminlogin.jsp"); // redirect back if no session
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Skin Glow</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('skin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            text-align: center;
            color: white;
        }

        marquee {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            font-size: 18px;
            padding: 10px;
            z-index: 1000;
        }

        .container {
            margin-top: 150px;
        }

        h2 {
            font-size: 40px;
            text-shadow: 2px 2px 5px black;
            margin-bottom: 15px;
        }

        h3 {
            font-size: 25px;
            margin-bottom: 40px;
            text-shadow: 1px 1px 3px black;
        }

        .btn {
            display: inline-block;
            margin: 15px;
            padding: 15px 30px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            border-radius: 30px;
            transition: 0.3s;
        }

        .btn:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
            transform: scale(1.05);
        }

        p {
            margin-top: 40px;
            font-size: 18px;
            text-shadow: 1px 1px 3px black;
        }
    </style>
</head>
<body>
    <!-- Scrolling Marquee -->
    <marquee>✨ Admin Dashboard - Skin Glow Control Panel ✨</marquee>

    <!-- Main Container -->
    <div class="container">
        <h2>Welcome, <%= adminUser %> 🎉</h2>
        <h3>Admin Dashboard</h3>

        <!-- Buttons -->
        <a href="addProduct.jsp" class="btn">➕ Add Product</a>
        <a href="manageProducts.jsp" class="btn">📦 Manage Products</a>
        <a href="LogoutServlet" class="btn">🚪 Logout</a>
        <a href="viewFeedback.jsp" class="btn">📝 View Feedback</a>
		<a href="ViewUsersServlet" class="btn">👥 View All Users</a>

<div id="usersContainer" style="margin-top:30px;"></div>

<script>
    function loadUsers() {
        fetch("ViewUsersServlet")
            .then(response => response.text())
            .then(data => {
                document.getElementById("usersContainer").innerHTML = data;
            })
            .catch(err => {
                alert("Error fetching users: " + err);
            });
    }
</script>
        

        <p>You have successfully logged in to the Skin Glow Control Panel.</p>
    </div>
</body>
</html>
