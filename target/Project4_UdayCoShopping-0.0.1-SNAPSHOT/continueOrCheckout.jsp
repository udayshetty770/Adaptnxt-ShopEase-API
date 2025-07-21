<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Action</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
            background-color: #f8f9fa;
        }
        h2 {
            color: #28a745;
        }
        .container {
            padding: 20px;
            border-radius: 10px;
            background: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }
        .shop-btn {
            background-color: #007bff;
            color: white;
        }
        .shop-btn:hover {
            background-color: #0056b3;
        }
        .checkout-btn {
            background-color: #dc3545;
            color: white;
        }
        .checkout-btn:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Product added to cart!</h2>
        <form action="categories" method="get">
            <button type="submit" class="shop-btn">Continue Shopping</button>
        </form>
        <form action="checkout" method="get">
            <button type="submit" class="checkout-btn">Checkout</button>
        </form>
    </div>
</body>
</html>