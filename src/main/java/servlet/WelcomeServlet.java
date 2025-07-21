package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/welcome")
public class WelcomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Welcome - Uday.co Shopping</title>");
        out.println("<style>");
        out.println("body {");
        out.println("  font-family: Arial, sans-serif;");
        out.println("  background: linear-gradient(to right, #e0f7fa, #80deea);");
        out.println("  display: flex;");
        out.println("  flex-direction: column;");
        out.println("  align-items: center;");
        out.println("  justify-content: center;");
        out.println("  height: 100vh;");
        out.println("  margin: 0;");
        out.println("}");
        out.println("h1 { color: #01579b; font-size: 3em; margin-bottom: 30px; }");
        out.println("a {");
        out.println("  padding: 12px 25px;");
        out.println("  background-color: #0288d1;");
        out.println("  color: white;");
        out.println("  text-decoration: none;");
        out.println("  font-size: 18px;");
        out.println("  border-radius: 8px;");
        out.println("  transition: background-color 0.3s ease;");
        out.println("}");
        out.println("a:hover { background-color: #0277bd; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Welcome to Uday.co Shopping!</h1>");
        out.println("<a href='categories'>Start Shopping 🛍️</a>");
        out.println("</body>");
        out.println("</html>");
    }
}
