package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest req,HttpServletResponse res ) throws ServletException, IOException{
		HttpSession session = req.getSession();
		session.invalidate();
		
//		HttpSession session2 = req.getSession();
//		session2.setAttribute("LogoutMsg", "Logout Successfully");
//		res.sendRedirect("login.jsp");
		res.sendRedirect("index.jsp");
	
	}
}
