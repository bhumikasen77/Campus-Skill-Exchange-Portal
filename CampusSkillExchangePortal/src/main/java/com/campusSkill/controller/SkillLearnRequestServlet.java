package com.campusSkill.controller;

import java.io.IOException;
import java.util.List;

import com.campusSkill.dao.RequestDAO;
import com.campusSkill.model.Request;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/mysentrequest")
public class SkillLearnRequestServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		HttpSession session = req.getSession();
		User us =(User) session.getAttribute("user");
		int id = us.getId();
		
		RequestDAO obj = new RequestDAO(connectionProvider.getConnection());
		List<Request> list = obj.getRequestBySenderId(id);
		
		session.setAttribute("MySendRequestlist", list);
		req.getRequestDispatcher("mySendRequest.jsp").forward(req, res);
	}

}
