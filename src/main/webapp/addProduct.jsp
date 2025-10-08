<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product - Skin Glow</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('skin.jpg') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            color: white;
        }

        /* Gradient overlay for readability */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* dark blur effect */
            backdrop-filter: blur(3px); /* blur effect */
            z-index: -1;
        }

        .container {
            margin-top: 100px;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            display: inline-block;
            text-align: left;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.5);
        }

        h2 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px black;
        }

        label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
        }

        input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-bottom: 20px;
            font-size: 16px;
        }

        button {
            display: block;
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
        <h2>Add New Product</h2>
        <form action="AddProductServlet" method="post">
            <label>Title:</label>
            <input type="text" name="title" required>

            <label>Description:</label>
            <input type="text" name="description" required>

            <label>Price:</label>
            <input type="number" step="0.01" name="price" required>

            <label>Stock:</label>
            <input type="number" name="stock" required>

            <label>Image URL:</label>
            <input type="text" name="image" required>

            <button type="submit">➕ Add Product</button>
        </form>
    </div>
</body>
</html>
