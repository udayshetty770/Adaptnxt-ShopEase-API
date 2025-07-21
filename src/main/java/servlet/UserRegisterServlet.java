package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserService;

public class UserRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (UserService.register(username, password)) {
            out.println("<h3>Registration successful!</h3>");
            out.println("<a href='login.html'>Go to Login</a>");
        } else {
            out.println("<h3>User already exists!</h3>");
            out.println("<a href='register.html'>Try Again</a>");
        }
    }
}
