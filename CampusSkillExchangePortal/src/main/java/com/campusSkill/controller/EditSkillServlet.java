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
@WebServlet("/editSkill")
public class EditSkillServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("user");
		int uid = us.getId();
		int sid = Integer.parseInt(req.getParameter("sid"));
		AddSkillDAO obj = new AddSkillDAO(connectionProvider.getConnection());
		Skills skill_obj = obj.getSkillById(uid,sid);
		
		req.setAttribute("skillObj", skill_obj);
		req.getRequestDispatcher("editSkill.jsp").forward(req, res);
	}

}
