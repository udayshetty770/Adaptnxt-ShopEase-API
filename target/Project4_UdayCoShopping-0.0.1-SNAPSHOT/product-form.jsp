<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    model.ProductAdmin product = (model.ProductAdmin) request.getAttribute("product");
    boolean isEdit = product != null;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Edit Product" : "Add Product" %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            padding: 30px;
        }
        form {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px 20px;
            background-color: #0077cc;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #005fa3;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;"><%= isEdit ? "Edit Product" : "Add New Product" %></h2>

<form action="product" method="get">
    <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>" />
    <% if (isEdit) { %>
        <input type="hidden" name="id" value="<%= product.getId() %>" />
    <% } %>

    <label>Name</label>
    <input type="text" name="name" value="<%= isEdit ? product.getName() : "" %>" required />

    <label>Manufacturer</label>
    <input type="text" name="manufacturer" value="<%= isEdit ? product.getManufacturer() : "" %>" required />

    <label>Price</label>
    <input type="number" step="0.01" name="price" value="<%= isEdit ? product.getPrice() : "" %>" required />

    <label>Description</label>
    <textarea name="description" rows="4"><%= isEdit ? product.getDescription() : "" %></textarea>

    <label>Main Category</label>
    <input type="text" name="main_category" value="<%= isEdit ? product.getMainCategory() : "" %>" />

    <label>Sub Category</label>
    <input type="text" name="sub_category" value="<%= isEdit ? product.getSubCategory() : "" %>" />

    <button type="submit"><%= isEdit ? "Update Product" : "Add Product" %></button>
</form>

</body>
</html>