package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.dao.AdminDAO;
import com.campusSkill.model.Admin;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		String email = req.getParameter("email");
		String pwd = req.getParameter("password");
		
		AdminDAO obj = new AdminDAO(connectionProvider.getConnection());
		Admin ad = obj.adminLogin(email, pwd);
		HttpSession session = req.getSession();
		if(ad!=null) {
			session.setAttribute("admin", ad);
			res.sendRedirect("adminDashboard");
		}else {
			session.setAttribute("failedMsg", "email & password are invalid");
			res.sendRedirect("adminLogin.jsp");
		}
	}

}
