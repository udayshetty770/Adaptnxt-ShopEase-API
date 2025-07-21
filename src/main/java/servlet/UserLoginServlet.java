package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserService;

public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        HttpSession session = request.getSession();

        if (UserService.login(username, password)) {
            // User exists and password is correct
            session.setAttribute("user", username);

            String redirectTo = (String) session.getAttribute("redirectAfterLogin");
            if (redirectTo == null) redirectTo = "index.jsp";

            session.removeAttribute("redirectAfterLogin");
            response.sendRedirect(redirectTo);
        } else {
            // Check if the user exists with any password (used to suggest registration)
            if (!UserService.userExists(username)) {
                // User not registered: suggest registration
                response.sendRedirect("register.html");
            } else {
                // User exists but wrong password
                PrintWriter out = response.getWriter();
                out.println("<h3>Incorrect password.</h3>");
                out.println("<a href='login.html'>Try Again</a>");
            }
        }
    }
}
