package com.campusSkill.controller;

import java.io.IOException;
import java.util.List;

import com.campusSkill.dao.AdminDAO;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/searchUser")
public class SearchUserServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		String searchName = req.getParameter("keyword");
		AdminDAO dao = new AdminDAO(connectionProvider.getConnection());
		List<User> list = dao.searchUser(searchName);
		
		req.setAttribute("userList",list);
		req.getRequestDispatcher("viewUsers.jsp").forward(req, res);
	}
}
