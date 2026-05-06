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

@WebServlet("/searchSkill")
public class SearchServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		String key = req.getParameter("key");
		//handling empty input or avoididng extra spaces
		if(key == null || key.trim().isEmpty()){
            res.sendRedirect("viewSkill");
            return;
        }

        key = key.trim();
		AddSkillDAO obj = new AddSkillDAO(connectionProvider.getConnection());
		List<Skills> list = obj.searchSkills(key);
	
		req.setAttribute("skillList", list);
		req.getRequestDispatcher("viewSkill.jsp").forward(req, res);
		
		
	}
}
