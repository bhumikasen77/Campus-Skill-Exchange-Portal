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
@WebServlet("/updateSkill")
public class UpdateSkillServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("user");
		int sid = Integer.parseInt(req.getParameter("sid"));
		int uid = us.getId();
		
		String name = req.getParameter("skillName");
        String desc = req.getParameter("description");
        String level = req.getParameter("level");
        String avail = req.getParameter("availability");
        String status = req.getParameter("status");
        
        Skills s = new Skills();
        s.setSkill_id(sid);
        s.setSkillName(name);
        s.setDescription(desc);
        s.setLevel(level);
        s.setAvailability(avail);
        s.setStatus(status);
        s.setOwner_user(uid);
		AddSkillDAO dao = new AddSkillDAO(connectionProvider.getConnection());
		boolean f = dao.updateSkill(s);
		if(f) {
			session.setAttribute("succMsg", "Skill updated");
			res.sendRedirect("viewSkill");
		}
		else {
			session.setAttribute("failedMsg", "Something went wrong");
			res.sendRedirect("editSkill?sid="+sid);
		}
	}

}
