package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import io.jsonwebtoken.Jwts;
import model.ProductAdmin;
import util.DBUtil;

@WebServlet("/product")
public class ProductAdminServlet extends HttpServlet {

    private static final String SECRET_KEY = "my-super-secret-key-1234567890"; // Must match AdminLoginServlet

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Authentication Check with JWT
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null || session.getAttribute("jwt") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        // Validate JWT
        String jwt = (String) session.getAttribute("jwt");
        try {
            Jwts.parser().setSigningKey(SECRET_KEY).parseClaimsJws(jwt);
        } catch (Exception e) {
            session.invalidate(); // Invalidate session if token is invalid
            response.sendRedirect("admin-login.jsp");
            return;
        }

        String action = request.getParameter("action");

        try {
            switch (action == null ? "list" : action) {
                case "new":
                    showForm(request, response);
                    break;
                case "insert":
                    insertProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<ProductAdmin> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM products");

        while (rs.next()) {
            ProductAdmin p = new ProductAdmin();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setManufacturer(rs.getString("manufacturer"));
            p.setPrice(rs.getDouble("price"));
            p.setDescription(rs.getString("description"));
            p.setMainCategory(rs.getString("main_category"));
            p.setSubCategory(rs.getString("sub_category"));
            list.add(p);
        }

        request.setAttribute("productList", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String mainCategory = request.getParameter("main_category");
        String subCategory = request.getParameter("sub_category");

        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO products (name, manufacturer, price, description, main_category, sub_category) VALUES (?, ?, ?, ?, ?, ?)");
        stmt.setString(1, name);
        stmt.setString(2, manufacturer);
        stmt.setDouble(3, price);
        stmt.setString(4, description);
        stmt.setString(5, mainCategory);
        stmt.setString(6, subCategory);
        stmt.executeUpdate();

        response.sendRedirect("product");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement("DELETE FROM products WHERE id = ?");
        stmt.setInt(1, id);
        stmt.executeUpdate();

        response.sendRedirect("product");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM products WHERE id = ?");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            ProductAdmin p = new ProductAdmin();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setManufacturer(rs.getString("manufacturer"));
            p.setPrice(rs.getDouble("price"));
            p.setDescription(rs.getString("description"));
            p.setMainCategory(rs.getString("main_category"));
            p.setSubCategory(rs.getString("sub_category"));

            request.setAttribute("product", p);
            RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String mainCategory = request.getParameter("main_category");
        String subCategory = request.getParameter("sub_category");

        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(
                "UPDATE products SET name = ?, manufacturer = ?, price = ?, description = ?, main_category = ?, sub_category = ? WHERE id = ?");
        stmt.setString(1, name);
        stmt.setString(2, manufacturer);
        stmt.setDouble(3, price);
        stmt.setString(4, description);
        stmt.setString(5, mainCategory);
        stmt.setString(6, subCategory);
        stmt.setInt(7, id);
        stmt.executeUpdate();

        response.sendRedirect("product");
    }
}