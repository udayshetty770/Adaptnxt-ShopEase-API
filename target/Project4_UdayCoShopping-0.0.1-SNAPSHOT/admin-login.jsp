<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body { font-family: Arial; background-color: #f4f4f4; padding: 40px; }
        form {
            max-width: 400px; margin: auto; background: white;
            padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input { width: 100%; padding: 10px; margin: 10px 0; }
        button { width: 100%; padding: 10px; background: #0077cc; color: white; border: none; }
    </style>
</head>
<body>

<form action="admin-login" method="post">
    <h2>Admin Login</h2>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
    <% } %>
    <% if (request.getParameter("logout") != null) { %>
        <p style="color:green;">You have been logged out.</p>
    <% } %>
    <input type="text" name="username" placeholder="Username" required />
    <input type="password" name="password" placeholder="Password" required />
    <button type="submit">Login</button>
</form>

</body>
</html>