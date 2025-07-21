
#  Adaptnxt ShopEase API - E-Commerce Backend with JWT & Role-Based Access

A Java-based e-commerce backend developed for the Backend Developer Internship assignment at Adaptnxt. This REST-style API supports user authentication, role-based access, product listing, cart management, and order creation using Servlets, MySQL, and JWT.

---

##  Features Implemented

###  Core Functionalities

- **User Authentication (JWT-based)**
  - Secure login and token generation
  - Role identification (`admin` or `customer`)

- **Role-based Access**
  - `Customer`: View products, manage cart, and place orders
  - `Admin`: Full product management (add, update, delete)

- **Product Listing**
  - All users can view available products
  - (Admin can manage products via secure endpoints)

- **Cart Management**
  - Add items to cart
  - Update or remove items
  - View cart items

- **Order Creation**
  - Convert cart to order (only for customers)

- **Basic Frontend**
  - JSP-based pages (optional, minimal UI)

---

##  Technologies Used

| Layer        | Tech Stack                |
|--------------|----------------------------|
| Backend      | Java, Servlets, JSP         |
| Security     | JWT (JSON Web Tokens)       |
| Database     | MySQL                       |
| Build Tool   | Maven                       |
| Server       | Apache Tomcat 9             |

---

##  Folder Structure
```
Adaptnxt_ShopEase_API/
├── src/
│ └── main/
│ └── java/
│ └── com/adaptnxt/shopease/
│ ├── servlets/
│ ├── dao/
│ ├── model/
│ └── utils/
├── WebContent/
│ ├── index.jsp
│ ├── adminDashboard.jsp
│ └── login.jsp
├── pom.xml
└── README.md
```

---

##  API Endpoints Overview

| Endpoint                      | Method | Role       | Description                      |
|------------------------------|--------|------------|----------------------------------|
| `/login`                     | POST   | All        | Authenticate & return JWT token |
| `/products`                  | GET    | All        | View available products          |
| `/products`                  | POST   | Admin      | Add a new product                |
| `/products/{id}`             | PUT    | Admin      | Update product                   |
| `/products/{id}`             | DELETE | Admin      | Delete product                   |
| `/cart`                      | GET    | Customer   | View cart                        |
| `/cart`                      | POST   | Customer   | Add product to cart              |
| `/cart/{id}`                 | DELETE | Customer   | Remove product from cart         |
| `/orders`                    | POST   | Customer   | Place order from cart            |

---

---

##  JWT Usage

- JWT is sent in `Authorization` header:  
Authorization: Bearer <your-token>

- Backend validates token and parses user claims (email, role).

---

##  How to Test

You can use **Postman** to test the endpoints:

1. Register or Login → get JWT token  
2. Pass token in header to access secured routes  
3. Perform role-specific actions (admin/customer)

---

##  How to Run

1. Clone the repo
2. Import as Maven Project into IDE (e.g., Eclipse or IntelliJ)
3. Configure MySQL DB (`DBConnection.java`)
4. Run on Apache Tomcat 9
5. Access via browser or Postman

---

##  Assignment Requirements: 

- ✔ Product listing  
- ✔ Cart management  
- ✔ Order creation  
- ✔ JWT authentication  
- ✔ Role-based authorization  
- ✔ Admin product control  
- ✔ Basic frontend (JSP)  
- ✔ Pagination/search (can be added)

---

##  GitHub Repository

> Upload the full code and update this line with your GitHub link:

** [GitHub Repo](https://github.com/your-username/Adaptnxt_ShopEase_API)**

---

##  Author

**Udaya Kumar Shetty**  
Java Developer | B.E. Computer Science  
[LinkedIn](https://www.linkedin.com/in/udayakumarshetty) 

---

##  Contact

For queries, contact via email or LinkedIn.

---
