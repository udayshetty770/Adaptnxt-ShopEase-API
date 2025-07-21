package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward to categories.jsp
        RequestDispatcher rd = req.getRequestDispatcher("categories.jsp");
        rd.forward(req, resp);
    }
}
