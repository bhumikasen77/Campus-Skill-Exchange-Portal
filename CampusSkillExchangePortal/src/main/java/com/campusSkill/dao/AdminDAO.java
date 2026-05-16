package com.campusSkill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusSkill.model.Admin;
import com.campusSkill.model.Request;
import com.campusSkill.model.Skills;
import com.campusSkill.model.User;

public class AdminDAO {

	private Connection conn = null;

	public AdminDAO(Connection conn) {
		this.conn = conn;
	}

	public Admin adminLogin(String email, String pwd) {
		Admin ad = null;
		try {
			String sql = "select * from admins where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pwd);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ad = new Admin();
				ad.setEmail(rs.getString("email"));
				ad.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ad;
	}

	public int countUsers() {
		int ans = 0;
		try {
			String sql = "select count(*) from users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				ans = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ans;

	}

	public int countSkills() {

		int ans = 0;
		try {
			String sql = "select count(*) from skills";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				ans = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ans;

	}

	public int countRequest() {

		int ans = 0;
		try {
			String sql = "select count(*) from requests";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				ans = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ans;

	}

	public int countMessage() {

		int ans = 0;
		try {
			String sql = "select count(*) from message";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				ans = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ans;

	}

	public List<User> getAllUsers() {

		List<User> list = new ArrayList<>();

		try {
			String sql = "select * from users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User us = new User();
				us.setId(rs.getInt("user_id"));
				us.setName(rs.getString("name"));
				us.setEmail(rs.getString("email"));
				us.setDepartment(rs.getString("department"));
				us.setYear(rs.getString("years"));
				us.setBio(rs.getString("bio"));
				;
				us.setStatus(rs.getString("user_status"));

				list.add(us);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Skills> getAllSkills() {

		List<Skills> list = new ArrayList<>();
		try {
			String sql = "select users.name, skills.skillname,skills.skill_id, skills.owner_user,skills.description,skills.status from skills join users on users.user_id = skills.owner_user";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Skills skill = new Skills();
				skill.setSkill_id(rs.getInt("skill_id"));
				skill.setSkillName(rs.getString("skillname"));
				skill.setUname(rs.getString("name"));
				skill.setDescription(rs.getString("description"));
				skill.setStatus(rs.getString("status"));
				list.add(skill);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Request> getAllRequest() {
		List<Request> list = new ArrayList<>();
		try {
			String sql = "select requests.request_id,requests.senderId,requests.recieverId,requests.skill_id,requests.status,s.name as sender_name,r.name as receiver_name,skills.skillname from requests join skills on requests.skill_id = skills.skill_id join users s on s.user_id = requests.senderId join users r on r.user_id = requests.recieverId";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Request r = new Request();
				r.setReq_id(rs.getInt("request_id"));
				r.setSenderName(rs.getString("sender_name"));
				r.setRecieverName(rs.getString("receiver_name"));
				r.setSkillName(rs.getString("skillname"));
				r.setStatus(rs.getString("status"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public boolean deleteUser(int uid) {

		try {

			// Delete requests
			String reqSql = "delete from requests where senderId=? or recieverId=?";
			PreparedStatement ps1 = conn.prepareStatement(reqSql);
			ps1.setInt(1, uid);
			ps1.setInt(2, uid);
			ps1.executeUpdate();

			// Delete skills
			String skillSql = "delete from skills where owner_user=?";
			PreparedStatement ps2 = conn.prepareStatement(skillSql);
			ps2.setInt(1, uid);
			ps2.executeUpdate();

			// Delete messages
			String msgSql = "delete from message where senderId=? or recieverId=?";
			PreparedStatement ps3 = conn.prepareStatement(msgSql);
			ps3.setInt(1, uid);
			ps3.setInt(2, uid);
			ps3.executeUpdate();

			// Delete user
			String userSql = "delete from users where user_id=?";
			PreparedStatement ps4 = conn.prepareStatement(userSql);
			ps4.setInt(1, uid);

			int i = ps4.executeUpdate();

			if(i == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
	
	// search user by their name
	
	public List<User> searchUser(String name){
		List<User> list = new ArrayList<>();
		try {
			String sql = "select * from users where name like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				User u = new User();
				u.setId(rs.getInt("user_id"));
				u.setEmail(rs.getString("email"));
				u.setName(rs.getString("name"));
				u.setDepartment(rs.getString("department"));
				u.setBio(rs.getString("bio"));
				u.setStatus(rs.getString("user_status"));
				list.add(u);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
