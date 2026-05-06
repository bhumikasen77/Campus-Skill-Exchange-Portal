package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.dao.UserDAO;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String confirmPass = req.getParameter("confirmPassword");
			String department = req.getParameter("department");
			String year = req.getParameter("year");
			String bio = req.getParameter("bio");

			User user = new User();

			UserDAO userdao = new UserDAO(connectionProvider.getConnection());
			HttpSession session = req.getSession();
			if (password.equals(confirmPass)) {

				user.setName(name);
				user.setEmail(email);
				user.setPassword(password);
				user.setDepartment(department);
				user.setBio(bio);
				user.setYear(year);

				boolean f = userdao.registerUser(user);

				if (f) {
					session.setAttribute("succMsg", "Registered Successfully. Please login");
					res.sendRedirect("login.jsp");
				} else {
					session.setAttribute("failedMsg", "Something went wrong");
					res.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Password doesn't match");
				res.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
