package com.campusSkill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusSkill.model.Request;

public class RequestDAO {

	private Connection conn;
	public RequestDAO(Connection conn) {
		this.conn = conn;
	}
	
	public boolean sendRequest(int senderid, int rid, int sid) {
		try {
			String sql = "insert into requests(senderId,recieverId,skill_id,status) values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, senderid);
			ps.setInt(2, rid);
			ps.setInt(3, sid);
			ps.setString(4, "pending");
			
			int i = ps.executeUpdate();
			if(i==1) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	public List<Request> getRequestByRecieverId(int rid) {
		List<Request> list = new ArrayList<>();
		try {
			String sql = "select requests.request_id, users.name, skills.skillname, requests.status from requests join users on requests.senderId = users.user_id join skills on requests.skill_id = skills.skill_id where requests.recieverId=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Request reqObj = new Request();
				reqObj.setReq_id(rs.getInt("request_id"));
				reqObj.setSenderName(rs.getString("name"));
				reqObj.setStatus(rs.getString("status"));
				reqObj.setSkillName(rs.getString("skillname"));
				list.add(reqObj);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;	
	}
	
	//Accept reject method
	public boolean updateRequestStatus(int rid, String status) {
		try {
			String sql = "update requests set status = ? where request_id=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ps.setInt(2, rid);
			ps.setString(3, "pending");
			
			int i = ps.executeUpdate();
			if(i==1) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Request> getRequestBySenderId(int senderId){
		List<Request> list = new ArrayList<>();
		try {
			String sql = "select requests.request_id, users.name, skills.skillname, requests.status from requests join users on requests.recieverId = users.user_id join skills on requests.skill_id = skills.skill_id where requests.senderId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,senderId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Request robj = new Request();
				robj.setReq_id(rs.getInt("request_id"));
				
				robj.setRecieverName(rs.getString("name"));
				robj.setSkillName(rs.getString("skillname"));
				robj.setStatus(rs.getString("status"));
				list.add(robj);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Check if request has already sent 
	
	public boolean checkDuplicateRequest(int senderid, int recieverid, int skillid) {
		
		try {
			String sql = "select * from requests where senderId=? and recieverId=? and skill_id=? and (status='pending' OR status='accepted')";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, senderid);
			ps.setInt(2, recieverid);
			ps.setInt(3, skillid);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Request getRequestById(int req_id) {
		Request obj = new Request();
		try {
			String sql = "select senderId,recieverId from requests where request_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, req_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				obj.setSenderId(rs.getInt("senderId"));
				obj.setRecieverId(rs.getInt("recieverId"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
}
