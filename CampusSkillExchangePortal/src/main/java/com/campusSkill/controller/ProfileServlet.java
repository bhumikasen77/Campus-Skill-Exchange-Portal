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

@WebServlet("/myProfile")
public class ProfileServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		int id = user.getId();
		
		UserDAO dao = new UserDAO(connectionProvider.getConnection());
		user = dao.getProfile(id);
		
		session.setAttribute("user", user);
		req.getRequestDispatcher("profile.jsp").forward(req, res);
	}

}
