<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%
    List<Product> cart = (List<Product>) request.getAttribute("cart");
    double total = (Double) request.getAttribute("total");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Uday.co</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
        }
        h2 {
            color: #28a745;
        }
        table {
            width: 60%;
            margin: auto;
            background-color: white;
            border-collapse: collapse;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .total-row {
            font-weight: bold;
            background-color: #ffc107;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <h2>Final Bill - Uday.co Shopping</h2>
    <table>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
        </tr>
        <%
            for (Product p : cart) {
        %>
        <tr>
            <td><%= p.getName() %></td>
            <td>Rs.<%= p.getPrice() %></td>
        </tr>
        <%
            }
        %>
        <tr class="total-row">
            <td>Total</td>
            <td>Rs.<%= total %></td>
        </tr>
    </table>
    <p class="message">Thank you for shopping with <b>Uday.co</b>!</p>
</body>
</html>