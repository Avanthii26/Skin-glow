<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Placed - Skin Glow</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: url('skin.jpg') no-repeat center center fixed;
        background-size: cover;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        text-align: center;
    }

    body::before {
        content: "";
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.6);
        backdrop-filter: blur(3px);
        z-index: -1;
    }

    .message-box {
        background: rgba(255,255,255,0.1);
        padding: 40px 60px;
        border-radius: 20px;
        box-shadow: 0px 4px 20px rgba(0,0,0,0.5);
    }

    h2 {
        font-size: 36px;
        margin-bottom: 30px;
        text-shadow: 2px 2px 5px black;
    }

    a {
        display: inline-block;
        padding: 12px 30px;
        font-size: 18px;
        font-weight: bold;
        text-decoration: none;
        color: white;
        border-radius: 25px;
        background: linear-gradient(to right, #36d1dc, #5b86e5);
        transition: 0.3s;
    }

    a:hover {
        background: linear-gradient(to right, #5b86e5, #36d1dc);
        transform: scale(1.05);
    }
</style>
</head>
<body>
<div class="message-box">
    <h2>Order Placed Successfully 🎉</h2>
    
    <a href="products.jsp">Continue Shopping</a>
    <!-- New Feedback Button -->
    <a href="feedback.jsp" style="margin-left: 20px; background: linear-gradient(to right, #ff7e5f, #feb47b);">
    Submit Feedback
</a>
</div>

</body>
</html>
