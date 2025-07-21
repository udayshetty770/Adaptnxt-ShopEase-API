package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/subcategories")
public class SubCategoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainCategory = req.getParameter("main");
        req.setAttribute("mainCategory", mainCategory);
        RequestDispatcher rd = req.getRequestDispatcher("subcategories.jsp");
        rd.forward(req, resp);
    }
}
