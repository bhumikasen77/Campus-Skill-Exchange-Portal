package com.campusSkill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusSkill.model.Skills;
import com.campusSkill.model.User;

public class AddSkillDAO {

	private Connection conn;
	public AddSkillDAO(Connection conn) {
		this.conn = conn;
	}
	public boolean addSkill(Skills skill) {
		
		boolean f = false;
		try {
			String sql = "insert into skills(skillname,level,description,availability,status,owner_user) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, skill.getSkillName());
			ps.setString(2, skill.getLevel());
			ps.setString(3, skill.getDescription());
			ps.setString(4, skill.getAvailability());
			ps.setString(5, skill.getStatus());
			ps.setInt(6, skill.getOwner_user());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public List<Skills> viewSkill(int id) {
		
		List<Skills> list = new ArrayList<>();
		try {
			String sql = "select * from skills where owner_user = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Skills s = new Skills();
				s.setSkill_id(rs.getInt("skill_id"));
				s.setSkillName(rs.getString("skillname"));
			    s.setLevel(rs.getString("level"));
			    s.setDescription(rs.getString("description"));
			    s.setAvailability(rs.getString("availability"));
			    s.setStatus(rs.getString("status"));
			    s.setOwner_user(rs.getInt("owner_user"));
				
				list.add(s);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean deleteSkill(int uid,int sid) {
		try {
			String sql = "delete from skills where skill_id=? and owner_user=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, sid);
			ps.setInt(2, uid);
			int i = ps.executeUpdate();
			if(i==1) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Skills getSkillById(int uid,int sid){
		Skills s= null;
		try {
			String sql = "select * from skills where owner_user=? and skill_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, sid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				s= new Skills();
				s.setSkill_id(rs.getInt("skill_id"));
				s.setSkillName(rs.getString("skillname"));
				s.setLevel(rs.getString("level"));
				s.setDescription(rs.getString("description"));
				s.setAvailability(rs.getString("availability"));
				s.setStatus(rs.getString("status"));
				s.setOwner_user(rs.getInt("owner_user"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public boolean updateSkill(Skills s) {
		
		try {
			String sql = "update skills set skillname=?,level=?,description=?,availability=?,status=? where skill_id=? and owner_user=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,s.getSkillName());
		    ps.setString(2, s.getLevel());
			ps.setString(3, s.getDescription());
			ps.setString(4, s.getAvailability());
			ps.setString(5, s.getStatus());
			ps.setInt(6, s.getSkill_id());
			ps.setInt(7, s.getOwner_user());
			int i = ps.executeUpdate();
			if(i==1) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Skills> searchSkills(String key) {
		List<Skills> list = new ArrayList<>();
		Skills s = null;
		try {
			String sql = "select * from skills where lower(skillname) like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+key.toLowerCase()+"%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s= new Skills();
				s.setSkill_id(rs.getInt("skill_id"));
				s.setSkillName(rs.getString("skillname"));
				s.setLevel(rs.getString("level"));
				s.setDescription(rs.getString("description"));
				s.setAvailability(rs.getString("availability"));
				s.setStatus(rs.getString("status"));
				s.setOwner_user(rs.getInt("owner_user"));
				list.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
