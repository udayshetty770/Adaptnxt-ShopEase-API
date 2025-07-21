package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckAccessServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");
		String target = request.getParameter("target");

		if (user != null) {
			response.sendRedirect(target);
		} else {
			session.setAttribute("redirectAfterLogin", target);
			response.sendRedirect("login.html");
		}
	}
}
