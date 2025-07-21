<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String main = (String) request.getAttribute("mainCategory");
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= main %> Subcategories</title>
    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap" rel="stylesheet">
   
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f4f4;
            padding: 40px;
            margin: 0;
            text-align: center;
        }
        h2 {
            color: #222;
            font-size: 36px;
            margin-bottom: 40px;
        }
        .subcategory-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 40px;
        }
        .subcategory {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 20px;
            width: 260px;
            transition: transform 0.3s;
        }
        .subcategory:hover {
            transform: scale(1.07);
        }
        .subcategory img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
        }
        .subcategory a {
            text-decoration: none;
            color: #007BFF;
            font-weight: 600;
            font-size: 18px;
            display: block;
            margin-top: 15px;
        }
        .back-button {
            display: inline-block;
            margin-top: 40px;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: 600;
            color: white;
            background-color: #007bff;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
 
</head>
<body>
    <h2><%= main %> </h2>
    <div class="subcategory-container">
        <% if ("Fashion".equals(main)) { %>
            <div class="subcategory">
                <img src="https://daraz.in/wp-content/uploads/2023/07/1659960179561_xl-pan95black46blue39white29-stylo-deeksha-3pc-original-imaf99yqefxdghyw-originnm80prcnt.jpg" alt="Men">
                <a href="products?main=Fashion&sub=Men">Men</a>
            </div>
            <div class="subcategory">
                <img src="https://img.freepik.com/free-photo/two-women-choose-clothes-store_78492-3896.jpg" alt="Women">
                <a href="products?main=Fashion&sub=Women">Women</a>
            </div>
            <div class="subcategory">
                <img src="https://assets.childrens.com/transform/32cbd34e-8ada-4ade-9b5a-57986e9676d8/shutterstock_284570147_525x315" alt="Children">
                <a href="products?main=Fashion&sub=Children">Children</a>
            </div>
        <% } else if ("Electronics".equals(main)) { %>
            <div class="subcategory">
                <img src="https://th.bing.com/th/id/R.32374c11d11279e59a5267b624275606?rik=4H%2b%2b%2bA3Rmtu20A&riu=http%3a%2f%2feblogfa.com%2fwp-content%2fuploads%2f2014%2f03%2fphone-android-smartphone.jpg&ehk=F6ewY%2flAunyVkaAFxOwdumdFIbnV%2bR9KSfN%2bW6Vedpc%3d&risl=&pid=ImgRaw&r=0" alt="Mobile">
                <a href="products?main=Electronics&sub=Mobile">Mobile</a>
            </div>
            <div class="subcategory">
                <img src="https://th.bing.com/th/id/OIP.WCCq2nZelTZuFIRbJF7AuAHaEK?cb=iwp2&rs=1&pid=ImgDetMain" alt="Laptop">
                <a href="products?main=Electronics&sub=Laptop">Laptop</a>
            </div>
            <div class="subcategory">
                <img src="https://m.media-amazon.com/images/I/71DMc+0D8jL._SL1500_.jpg" alt="Earphones">
                <a href="products?main=Electronics&sub=Earphones">Earphones</a>
            </div>
        <% } else if ("Household".equals(main)) { %>
            <div class="subcategory">
                <img src="https://m.media-amazon.com/images/I/815NIEtBGnL._SL1500_.jpg" alt="Kitchen">
                <a href="products?main=Household&sub=Kitchen">Kitchen</a>
            </div>
            <div class="subcategory">
                <img src="https://www.ikea.com/in/en/images/products/annons-5-piece-cookware-set-glass-stainless-steel__43510_pe139263_s5.jpg?f=xl" alt="Cleaning">
                <a href="products?main=Household&sub=Cleaning">Cleaning</a>
            </div>
            <div class="subcategory">
                <img src="https://th.bing.com/th/id/OIP.Sd_EFeE02mgaDn-q6tw0egHaE8?cb=iwp2&rs=1&pid=ImgDetMain" alt="Laundry">
                <a href="products?main=Household&sub=Laundry">Laundry</a>
            </div>
        <% } else if ("Furniture".equals(main)) { %>
            <div class="subcategory">
                <img src="https://ik.imagekit.io/2xkwa8s1i/img/bedside-tables/New/WBDSTTAURUS/1.jpg?tr=w-1200" alt="Bedroom">
                <a href="products?main=Furniture&sub=Bedroom">Bedroom</a>
            </div>
            <div class="subcategory">
                <img src="https://ik.imagekit.io/2xkwa8s1i/img/npl_modified_images/WSSFAMANILA1/sofa_WSSFAMNLAN1FHCY/sofa_WSSFAMNLAN1FHCY_1.jpg?tr=w-1200" alt="Living Room">
                <a href="products?main=Furniture&sub=LivingRoom">Living Room</a>
            </div>
            <div class="subcategory">
                <img src="https://ik.imagekit.io/2xkwa8s1i/img/chairs/Images13/WSCHRGRAVIHBNBWYWEGYML_LS_1.jpg?tr=w-1200" alt="Office">
                <a href="products?main=Furniture&sub=Office">Office</a>
            </div>
        <% } %>
    </div>
     <a href="categories.jsp" class="back-button">Back</a>
    
</body>
</html>
