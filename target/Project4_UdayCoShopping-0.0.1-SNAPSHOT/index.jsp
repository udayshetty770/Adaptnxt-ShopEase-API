<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to Uday.co Shopping</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #2c3e50;
            text-align: center;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 40px;
        }

        .btn, button {
            display: inline-block;
            margin: 10px;
            padding: 14px 28px;
            background-color: #2c3e50;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: background-color 0.3s ease, transform 0.2s ease;
            cursor: pointer;
        }

        .btn:hover, button:hover {
            background-color: #1a242f;
            transform: scale(1.05);
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
    </style>
</head>
<body>
    <h1>Welcome to Uday.co Shopping 🛍️</h1>
    <p>Your one-stop shop for Fashion, Electronics, Household, and Furniture.</p>

    <div class="action-buttons">
        <form action="CheckAccessServlet" method="get">
            <input type="hidden" name="target" value="categories.jsp" />
            <button type="submit">Browse Categories</button>
        </form>

       <a href="admin-product.html" class="btn">Manage Products (Admin)</a>

    </div>
</body>
</html>
