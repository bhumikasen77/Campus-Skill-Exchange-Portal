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

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException {
		HttpSession session = req.getSession();
		Admin ad = (Admin) session.getAttribute("admin");
		AdminDAO obj = new AdminDAO(connectionProvider.getConnection());
		int uid = Integer.parseInt(req.getParameter("id"));
		boolean f = obj.deleteUser(uid);
		if(f) {
			session.setAttribute("succMsg", "Skill has deleted");
			res.sendRedirect("adminSkills");
		}else {
			session.setAttribute("failedMsg", "Skill has not deleted");
			res.sendRedirect("adminSkills");
		}
	}
}
