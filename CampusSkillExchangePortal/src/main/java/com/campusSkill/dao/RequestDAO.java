package com.campusSkill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
