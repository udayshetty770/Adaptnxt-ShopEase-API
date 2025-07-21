package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import util.DBUtil;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainCategory = req.getParameter("main");
        String subCategory = req.getParameter("sub");

        List<Product> productList = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String query = "SELECT * FROM products WHERE main_category=? AND sub_category=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, mainCategory);
            stmt.setString(2, subCategory);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("manufacturer"),
                    rs.getDouble("price"),
                    rs.getString("description")
                );
                productList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("productList", productList);
        req.setAttribute("mainCategory", mainCategory);
        req.setAttribute("subCategory", subCategory);
        RequestDispatcher rd = req.getRequestDispatcher("products.jsp");
        rd.forward(req, resp);
    }
}