<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Skin Glow</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('skin.jpg') no-repeat center center fixed;
            background-size: cover;
            padding-top: 80px;
            text-align: center;
        }
        marquee {
            position: fixed;
            top: 0; left: 0;
            width: 100%;
            background: black;
            color: white;
            padding: 10px;
            font-size: 20px;
        }
        .form-wrapper {
            width: 350px;
            margin: 120px auto;
            background: rgba(255,255,255,0.9);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            background: black;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #444;
        }
    </style>
</head>
<body>
    <marquee> Welcome Back to Skin Glow – Login to Shine! </marquee>

    <div class="form-wrapper">
        <h2>Login</h2>
        <form id="loginForm">
<input type="email" id="email" name="email" placeholder="Enter your email">
<input type="password" id="password" name="password" placeholder="Enter your password">


            <button type="submit">Login</button>
        </form>
    </div>

    <script>
        // ✅ Validation function (like your feedback example)
        function validate() {
            var email = document.getElementById("email").value.trim();
            var password = document.getElementById("password").value.trim();

            if (email === "") {
                alert("Email should not be empty");
                return false;
            }
            if (password === "") {
                alert("Password should not be empty");
                return false;
            }
            return true; // passed validation
        }

        // ✅ AJAX + Validation
        document.getElementById("loginForm").addEventListener("submit", function(e) {
            e.preventDefault();

            if (!validate()) {
                return; // stop if validation fails
            }

            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;

            fetch("LoginServlet", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "email=" + encodeURIComponent(email) + "&password=" + encodeURIComponent(password)
            })
            .then(response => response.text())
            .then(data => {
                if (data.trim() === "success") {
                    alert("Login successful!");
                    window.location.href = "products.jsp"; // redirect
                } else {
                    alert(data); // show error
                }
            })
            .catch(err => {
                alert("Error: " + err);
            });
        });
    </script>
</body>
</html>
