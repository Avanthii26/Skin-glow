<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Skin Glow</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%; 
            font-family: Arial, sans-serif;
        }

        body {
            padding-top: 80px;
            background-image: url('skin.jpg');  
            background-size: cover;        
            background-position: center;   
            background-repeat: no-repeat;   
            background-attachment: fixed;  
            text-align: center;
        }

        marquee {
            position: fixed;
            top: 0;
            left: 0;            
            width: 100%;
            background-color: black;
            color: white;
            font-size: 20px;
            padding: 10px;
            z-index: 1000;
        }

        .form-wrapper {
            width: 90%;
            max-width: 400px;
            margin: 120px auto 0;   
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin: 10px 0 5px;
            color: #444;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #000;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 6px;
            transition: 0.3s ease;
        }

        button:hover {
            background-color: #444;
        }

        .back-home {
            margin-top: 15px;
            display: inline-block;
            padding: 10px 20px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.3s;
        }

        .back-home:hover {
            background: #555;
        }
    </style>
</head>
<body>
    <marquee> Admin Access – Skin Glow Control Panel </marquee>

    <div class="form-wrapper">
        <h2>Admin Login</h2>
       <form method="post" action="AdminLoginServlet">
    <input type="text" name="username" placeholder="Enter Username"/>
    <input type="password" name="password" placeholder="Enter Password"/>
    <input type="submit" value="Login"/>
</form>

        <a href="index.jsp" class="back-home">Back to Home</a>
    </div>
</body>
</html>
