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

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		
		UserDAO obj = new UserDAO(connectionProvider.getConnection());
		User us = obj.loginUser(email,password);
		HttpSession session = req.getSession();
		if(us!=null) {
			session.setAttribute("user", us);
			res.sendRedirect("dashboard.jsp");
		}else {
			session.setAttribute("failedMsg", "Email & Password are invalid");
			res.sendRedirect("login.jsp");
		}
		
	}
}
