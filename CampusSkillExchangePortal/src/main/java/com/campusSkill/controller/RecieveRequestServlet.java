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

@WebServlet("/request")
public class RecieveRequestServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("user");
		int rid = us.getId();
		RequestDAO rdao = new RequestDAO(connectionProvider.getConnection());
		List<Request> requestList= rdao.getRequestByRecieverId(rid);
		
		session.setAttribute("requestList", requestList);
		req.getRequestDispatcher("viewRequest.jsp").forward(req, res);
	}

}
