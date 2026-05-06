package com.campusSkill.controller;

import java.io.IOException;

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

@WebServlet("/addSkill")
public class AddSkillServlet extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		String skillName = req.getParameter("skillName");
		String level = req.getParameter("level");
		String description = req.getParameter("description");
		String avail = req.getParameter("availability");
		String status = req.getParameter("status");
		
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("user");
		int owner = us.getId();
		
		Skills  skill = new Skills();
		skill.setSkillName(skillName);
		skill.setLevel(level);
		skill.setDescription(description);
		skill.setAvailability(avail);
		skill.setStatus(status);
		skill.setOwner_user(owner);
		
		
		AddSkillDAO addskilldao = new AddSkillDAO(connectionProvider.getConnection());
		boolean f = addskilldao.addSkill(skill);
		
		if(f) {
			session.setAttribute("succMsg", "Skill Added Successfully");
			res.sendRedirect("addSkill.jsp");
			
		}else {
			session.setAttribute("failedMsg", "Skill not added");
			res.sendRedirect("dashboard.jsp");
		}
		
	}
}
