package com.campusSkill.controller;

import java.io.IOException;
import java.util.List;

import com.campusSkill.dao.AddSkillDAO;
import com.campusSkill.model.Skills;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewSkill")
public class ViewSkillServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("user");
		
		int id = us.getId();
		AddSkillDAO obj = new AddSkillDAO(connectionProvider.getConnection());
		List<Skills> list =  obj.viewSkill(id);
		
		session.setAttribute("skillList", list);
		req.getRequestDispatcher("viewSkill.jsp").forward(req, res);
		 
	}
}
