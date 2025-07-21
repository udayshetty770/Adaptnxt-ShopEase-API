package servlet;

import  model.Product;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        double total = 0.0;
        if (cart != null) {
            for (Product p : cart) {
                total += p.getPrice();
            }
        }

        req.setAttribute("cart", cart);
        req.setAttribute("total", total);

        RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
        rd.forward(req, resp);
    }
}
