package com.campusSkill.controller;

import java.io.IOException;
import java.util.List;

import com.campusSkill.dao.AdminDAO;
import com.campusSkill.model.Admin;
import com.campusSkill.model.Skills;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminSkills")
public class AdminSkillsServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException {
		HttpSession session = req.getSession();
		Admin ad = (Admin) session.getAttribute("admin");
		AdminDAO obj = new AdminDAO(connectionProvider.getConnection());
		List<Skills> list = obj.getAllSkills();
		req.setAttribute("skillList", list);
		req.getRequestDispatcher("adminViewSkills.jsp").forward(req, res);
	}

}
