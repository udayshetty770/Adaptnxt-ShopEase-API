<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.ProductAdmin" %>
<%
    List<ProductAdmin> list = (List<ProductAdmin>) request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f8f9fa;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #0077cc;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a.button {
            display: inline-block;
            padding: 8px 12px;
            background-color: #0077cc;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px 0;
        }
        a.button:hover {
            background-color: #005fa3;
        }
    </style>
</head>
<body>

<h2>Product Inventory</h2>

<a class="button" href="product?action=new">Add New Product</a>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Manufacturer</th>
        <th>Price</th>
        <th>Description</th>
        <th>Main Category</th>
        <th>Sub Category</th>
        <th>Actions</th>
    </tr>
    <% for (ProductAdmin p : list) { %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getManufacturer() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getDescription() %></td>
            <td><%= p.getMainCategory() %></td>
            <td><%= p.getSubCategory() %></td>
            <td>
                <a href="product?action=edit&id=<%= p.getId() %>">Edit</a> |
                <a href="product?action=delete&id=<%= p.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    <% } %>
</table>

</body>
</html>