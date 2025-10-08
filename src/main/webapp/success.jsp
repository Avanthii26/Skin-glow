<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Skin Glow</title>
    <meta charset="UTF-8">
    
    <!-- Optional: Auto redirect to home after 5 seconds -->
    <meta http-equiv="refresh" content="5;url=index.html" />

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffe6f0;
            text-align: center;
            padding-top: 50px;
        }

        .msg {
            background: #fff;
            border-radius: 10px;
            padding: 40px;
            margin: auto;
            width: 60%;
            box-shadow: 0 0 10px pink;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ff66b3;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #e60073;
        }
    </style>
</head>
<body>
    <div class="msg">
        <h1>🌟 Welcome, ${userName}! 🌟</h1>
        <p>Thank you for registering with <strong>Skin Glow</strong>.</p>
        <p>Your Registration Code is: <strong>${regCode}</strong></p>

        <a href="index.html" class="btn">← Go back to Home</a>
    </div>
</body>
</html>
