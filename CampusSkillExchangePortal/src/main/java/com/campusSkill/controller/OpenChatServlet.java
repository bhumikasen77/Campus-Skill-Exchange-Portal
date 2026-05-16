package com.campusSkill.controller;

import java.io.IOException;
import java.util.List;

import com.campusSkill.dao.MessageDAO;
import com.campusSkill.model.Message;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/openChat")
public class OpenChatServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		HttpSession session = req.getSession();
		int rid = Integer.parseInt(req.getParameter("rid"));
		
		MessageDAO obj = new MessageDAO(connectionProvider.getConnection());
		List<Message> list = obj.getMessageByRequestId(rid);
		//System.out.println(list.size());
		req.setAttribute("messageList", list);
		req.setAttribute("rid", rid);
		req.getRequestDispatcher("chat.jsp").forward(req, res);
	}
}
