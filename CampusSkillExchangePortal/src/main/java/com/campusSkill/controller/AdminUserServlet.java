package com.campusSkill.controller;

import java.io.IOException;
import java.util.List;

import com.campusSkill.dao.AdminDAO;
import com.campusSkill.model.Admin;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/adminUsers")
public class AdminUserServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		HttpSession session = req.getSession();
		Admin ad = (Admin) session.getAttribute("admin");
		AdminDAO dao = new AdminDAO(connectionProvider.getConnection());
		List<User> list = dao.getAllUsers();
		
		req.setAttribute("userList", list);
		req.getRequestDispatcher("viewUsers.jsp").forward(req, res);
	}
}
