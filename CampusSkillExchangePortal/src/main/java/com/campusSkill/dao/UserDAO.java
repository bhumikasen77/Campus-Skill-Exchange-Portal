package com.campusSkill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.campusSkill.model.User;

public class UserDAO {

	private Connection conn;
	public UserDAO(Connection conn) {
		this.conn = conn;
	}
	public boolean registerUser(User user) {
		boolean f= false;
		try {
			String sql = "insert into users(name,email,password,department,years,bio,user_status) values(?,?,?,?,?,?,?);";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getDepartment());
			ps.setString(5, user.getYear());
			ps.setString(6, user.getBio());
			ps.setString(7, user.getStatus());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User loginUser(String email, String password) {
		
		User us = null;
		try {
			String sql = "select * from users where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
//			us = new User();
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				us = new User();
				us.setId(rs.getInt("user_id"));
				us.setName(rs.getString("name"));
				us.setEmail(rs.getString("email"));
				us.setPassword(rs.getString("password"));
				us.setDepartment(rs.getString("department"));
				us.setYear(rs.getString("years"));
				us.setBio(rs.getString("bio"));
				us.setStatus(rs.getString("user_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return us;
		
	}
	
	public User getProfile(int id) {
		User us= new User();
		try {
			String sql = "select * from users where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				us.setId(rs.getInt("user_id"));
				us.setName(rs.getString("name"));
				us.setEmail(rs.getString("email"));
				us.setPassword(rs.getString("password"));
				us.setDepartment(rs.getString("department"));
				us.setBio(rs.getString("bio"));
				us.setYear(rs.getString("years"));
				us.setStatus(rs.getString("user_status"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}
	
	public boolean updateProfile(User user) {
		boolean f= false;
		try {
			String sql = "update users set name=?,email=?,department=?,bio=?,years=?,user_status=? where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getDepartment());
			ps.setString(4, user.getBio());
			ps.setString(5, user.getYear());
			ps.setString(6,user.getStatus());
			ps.setInt(7, user.getId());
			
			int i  = ps.executeUpdate();
			if(i==1) {
				f= true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
