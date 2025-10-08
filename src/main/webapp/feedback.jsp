<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Feedback - Skin Glow</title>
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

        .form-box {
            background: rgba(255,255,255,0.1);
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.5);
            width: 400px;
        }

        h2 {
            font-size: 32px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px black;
        }

        label {
            display: block;
            margin-top: 15px;
            text-align: left;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 10px;
            border: none;
            outline: none;
            font-size: 16px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 25px;
            border: none;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
            transform: scale(1.05);
        }

        a.back-btn {
            display:inline-block; 
            margin-top: 20px; 
            padding: 10px 20px;
            border-radius: 20px;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
    <script>
        function submitFeedback(event) {
            event.preventDefault(); 

            let username = document.querySelector("input[name='username']").value.trim();
            let rating = document.querySelector("input[name='rating']").value.trim();
            let comment = document.querySelector("textarea[name='comment']").value.trim();

            if (username === "" || rating === "") {
                alert("Please fill in all required fields!");
                return;
            }
            if (rating < 1 || rating > 5) {
                alert("Rating must be between 1 and 5!");
                return;
            }

            let xhr = new XMLHttpRequest();
            xhr.open("POST", "SaveFeedbackServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onload = function() {
                if (xhr.status === 200) {
                    alert("✅ Feedback submitted successfully!");
                    document.querySelector("form").reset();
                } else {
                    alert("❌ Error submitting feedback. Try again.");
                }
            };

            xhr.send("username=" + encodeURIComponent(username) +
                     "&rating=" + encodeURIComponent(rating) +
                     "&comment=" + encodeURIComponent(comment));
        }
    </script>
</head>
<body>
    <div class="form-box">
        <h2>Submit Your Feedback</h2>
        <form onsubmit="submitFeedback(event)">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Rating (1–5):</label>
            <input type="number" name="rating" min="1" max="5" required>

            <label>Comment:</label>
            <textarea name="comment" rows="4"></textarea>

            <input type="submit" value="Submit Feedback">
        </form>
        <a href="order_success.jsp" class="back-btn">Back</a>
    </div>
</body>
</html>
