package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.dao.AddSkillDAO;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		HttpSession session = req.getSession();
		User us = (User)session.getAttribute("user");
		int uid = us.getId();
		int sid = Integer.parseInt(req.getParameter("sid"));
		
		AddSkillDAO dltSkill = new AddSkillDAO(connectionProvider.getConnection());
		boolean f  = dltSkill.deleteSkill(uid,sid);
		//System.out.print("uid="+uid+" sid="+sid);
		if(f) {
			session.setAttribute("succMsg", "Skill has deleted");
			res.sendRedirect("viewSkill");
		}else {
			session.setAttribute("failedMsg", "Skill has not deleted");
			res.sendRedirect("viewSkill");
		}
	}
	
}
