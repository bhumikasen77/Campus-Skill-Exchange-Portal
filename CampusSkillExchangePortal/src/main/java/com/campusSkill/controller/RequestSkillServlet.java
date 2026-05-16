package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.dao.RequestDAO;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/requestSkill")
public class RequestSkillServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		int sid = Integer.parseInt(req.getParameter("sid"));
		int rid = Integer.parseInt(req.getParameter("rid"));
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("user");
		int senderid = us.getId();
		
		RequestDAO reqdao = new RequestDAO(connectionProvider.getConnection());
		
		if(reqdao.checkDuplicateRequest(senderid, rid, sid)) {
			session.setAttribute("checkReq", "Request already sent");
			res.sendRedirect("viewSkill");
		}else {
			boolean f = reqdao.sendRequest(senderid, rid, sid);
			
			if(f) {
				session.setAttribute("succMsg", "Request has sent");
				res.sendRedirect("viewSkill");
			}else {
				session.setAttribute("failedMsg", "Request has failed");
				res.sendRedirect("viewSkill");
			}
		}
		
		
		
	}

}
