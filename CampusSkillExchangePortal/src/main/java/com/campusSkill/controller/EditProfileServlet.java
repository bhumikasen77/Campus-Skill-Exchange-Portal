package com.campusSkill.controller;

import java.io.IOException;

import com.campusSkill.dao.UserDAO;
import com.campusSkill.model.User;
import com.campusSkill.util.connectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String department  = req.getParameter("department");
		String year = req.getParameter("year");
		String bio = req.getParameter("bio");
		String status = req.getParameter("status");
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		
		user.setName(name);
		user.setEmail(email);
		user.setDepartment(department);
		user.setBio(bio);
		user.setYear(year);
		user.setStatus(status);
		
		UserDAO obj = new UserDAO(connectionProvider.getConnection());
		boolean f = obj.updateProfile(user);
		if(f) {
			session.setAttribute("user", user);
			session.setAttribute("succMsg", "Profile update");
			res.sendRedirect("myProfile");
		}else {
			session.setAttribute("failedMsg", "Something Went Wrong");
			res.sendRedirect("editProfile.jsp");
		}
	}
}
