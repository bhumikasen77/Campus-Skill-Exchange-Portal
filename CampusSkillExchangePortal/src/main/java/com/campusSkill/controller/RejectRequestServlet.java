package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.dao.RequestDAO;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/reject")
public class RejectRequestServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		HttpSession session = req.getSession();
		int rid = Integer.parseInt(req.getParameter("rid"));
		String status = req.getParameter("status");
		
		RequestDAO obj = new RequestDAO(connectionProvider.getConnection());
		boolean f = obj.updateRequestStatus(rid, status);
		session.setAttribute("failedMsg", "Rejected Successfully");
		res.sendRedirect("viewRequest.jsp");
	}
}
