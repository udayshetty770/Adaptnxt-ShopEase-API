<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session validation
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Categories - Uday.co</title>
    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 30px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 40px;
            font-size: 36px;
            font-weight: 700;
        }
        .categories-container {
            display: flex;
            justify-content: center;
            gap: 35px;
            flex-wrap: wrap;
        }
        .category-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.12);
            width: 260px;
            transition: transform 0.3s ease;
            text-decoration: none;
            color: inherit;
        }
        .category-card:hover {
            transform: scale(1.07);
        }
        .category-card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        .category-card h3 {
            margin: 0;
            padding: 18px;
            font-size: 22px;
            background-color: #0288d1;
            color: white;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            font-weight: 600;
        }
        .back-button {
            display: block;
            margin: 40px auto 0;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: 600;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s;
            width: 150px;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Welcome <%= user %>! Here are the categories:</h2>

    <div class="categories-container">
        <a class="category-card" href="subcategories?main=Fashion">
            <img src="https://i.pinimg.com/originals/12/a3/21/12a321953d8a30259513cd58b3f73022.jpg" alt="Fashion">
            <h3>Fashion</h3>
        </a>
        <a class="category-card" href="subcategories?main=Electronics">
            <img src="https://www.siliconindia.com/news/newsimages/Webp.net-resizeimage%20(18).jpg" alt="Electronics">
            <h3>Electronics</h3>
        </a>
        <a class="category-card" href="subcategories?main=Household">
            <img src="https://thumbs.dreamstime.com/b/house-cleaning-products-pile-white-background-household-chore-concept-39104697.jpg" alt="Household">
            <h3>Household</h3>
        </a>
        <a class="category-card" href="subcategories?main=Furniture">
            <img src="https://t4.ftcdn.net/jpg/03/71/92/67/360_F_371926762_MdmDMtJbXt7DoaDrxFP0dp9Nq1tSFCnR.jpg" alt="Furniture">
            <h3>Furniture</h3>
        </a>
    </div>

    <a href="index.jsp" class="back-button">Back</a>
</body>
</html>