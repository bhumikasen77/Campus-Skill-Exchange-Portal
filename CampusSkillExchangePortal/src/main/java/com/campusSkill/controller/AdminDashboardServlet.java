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

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		Admin ad = (Admin) session.getAttribute("admin");

		// 🔴 IMPORTANT: security check (admin login required)
		if (ad == null) {
			res.sendRedirect("adminLogin.jsp");
			return;
		}

		AdminDAO obj = new AdminDAO(connectionProvider.getConnection());

		int totalUser = obj.countUsers();

		int totalSkills = obj.countSkills();
		int totalRequests = obj.countRequest();
		int totalMessage = obj.countMessage();
		req.setAttribute("totalUsers", totalUser);
        req.setAttribute("totalSkills", totalSkills);
        req.setAttribute("totalmessages", totalMessage);
        req.setAttribute("totalRequests",totalRequests);
		req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);
	}
}