<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    String main = (String) request.getAttribute("mainCategory");
    String sub = (String) request.getAttribute("subCategory");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Products - <%= sub %></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f8fa;
            margin: 0;
            padding: 30px;
            color: #333;
        }
        h2 {
            color: #0077cc;
            text-align: center;
            margin-bottom: 40px;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            padding: 0;
            list-style-type: none;
        }
        .product-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
            width: 280px;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        .product-name {
            font-size: 1.4em;
            color: #005b99;
            margin: 0 0 5px 0;
        }
        .manufacturer {
            font-style: italic;
            color: #666;
            margin-bottom: 15px;
        }
        .price {
            font-weight: bold;
            font-size: 1.2em;
            margin-bottom: 15px;
            color: #e65100;
        }
        .description {
            font-size: 0.9em;
            color: #555;
            margin-bottom: 20px;
            flex-grow: 1;
        }
        form {
            text-align: center;
        }
        input[type="submit"] {
            background-color: #0288d1;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.25s ease;
        }
        input[type="submit"]:hover {
            background-color: #0277bd;
        }
        hr {
            margin-top: 20px;
            border: 0;
            border-top: 1px solid #eee;
        }
        @media (max-width: 600px) {
            .product-list {
                flex-direction: column;
                align-items: center;
            }
            .product-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <h2>Products in <%= sub %> (<%= main %>)</h2>
    <ul class="product-list">
        <%
            for (Product p : productList) {
        %>
        <li class="product-card">
            <div>
                <h3 class="product-name"><%= p.getName() %></h3>
                <div class="manufacturer">by <%= p.getManufacturer() %></div>
                <div class="price">Rs.<%= p.getPrice() %></div>
                <p class="description"><%= p.getDescription() %></p>
            </div>
            <form action="cart" method="post">
                <input type="hidden" name="id" value="<%= p.getId() %>" />
                <input type="hidden" name="name" value="<%= p.getName() %>" />
                <input type="hidden" name="price" value="<%= p.getPrice() %>" />
                <input type="submit" name="action" value="Add to Cart" />
            </form>
        </li>
        <% } %>
    </ul>
</body>
</html>
