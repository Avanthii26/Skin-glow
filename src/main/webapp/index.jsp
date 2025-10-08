<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Skin Glow - Home</title>
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

        h1 {
            font-size: 50px;
            text-shadow: 2px 2px 5px black;
            margin-bottom: 40px;
        }

        .btn {
            display: inline-block;
            margin: 15px;
            padding: 15px 30px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            background: linear-gradient(to right, #ff6f61, #ff9472);
            border-radius: 30px;
            transition: 0.3s;
        }

        .btn:hover {
            background: linear-gradient(to right, #ff9472, #ff6f61);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <!-- Scrolling Marquee -->
    <marquee>✨ Welcome to Skin Glow - Your Beauty, Our Passion ✨</marquee>

    <!-- Main Container -->
    <div class="container">
        <h1>Welcome to Skin Glow</h1>
        
        <!-- Buttons -->
        <a href="register.jsp" class="btn">Register</a>
        <a href="login.jsp" class="btn">Customer Login</a>
        <a href="adminlogin.jsp" class="btn">Admin Login</a>
    </div>
</body>
</html>
