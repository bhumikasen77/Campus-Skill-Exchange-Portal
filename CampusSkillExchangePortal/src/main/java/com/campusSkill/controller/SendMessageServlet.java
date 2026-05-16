package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.dao.MessageDAO;
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
@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		String message = req.getParameter("message");
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("user");
		int uid = us.getId();
		
		int reqId = Integer.parseInt(req.getParameter("req_id"));
		
		RequestDAO rdao = new RequestDAO(connectionProvider.getConnection());
		Request robj = rdao.getRequestById(reqId);
		int reciverId = robj.getRecieverId();
		int senderId = robj.getSenderId();
		// condition to check valid reciever
		int finalReceiverId = 0;

		if(uid == senderId){
			finalReceiverId = reciverId;
		}else{
			finalReceiverId = senderId;
		}
//		System.out.println(senderId);
//		System.out.println(reciverId);
//		System.out.println(uid);
//		System.out.println(finalReceiverId);
		MessageDAO obj = new MessageDAO(connectionProvider.getConnection());
		boolean f = obj.sendMessage(uid, reqId, finalReceiverId, message);
		
		if(f){
			session.setAttribute("succMsg", "Message sent");
			res.sendRedirect("openChat?rid=" + reqId);
		}else{
			session.setAttribute("failedMsg", "Message not sent");
			res.sendRedirect("openChat?rid=" + reqId);
		}
	}

}
