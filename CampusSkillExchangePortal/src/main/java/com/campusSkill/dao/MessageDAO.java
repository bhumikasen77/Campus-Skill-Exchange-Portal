package com.campusSkill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusSkill.model.Message;

public class MessageDAO {

	private Connection conn = null;
	public MessageDAO(Connection conn){
		this.conn = conn;
	}
	
	public List<Message> getMessageByRequestId(int rid){
		List<Message> list = new ArrayList<>();
		try {
			String sql = "select senderId, recieverId,requestId, messages, sent_at from message where requestId = ? order by sent_at asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Message mes = new Message();
				mes.setSenderId(rs.getInt("senderId"));
				mes.setRecieverId(rs.getInt("recieverId"));
				mes.setRequestId(rs.getInt("requestId"));
				mes.setMessages(rs.getString("messages"));
				mes.setSent_at(rs.getTimestamp("sent_at"));
				list.add(mes);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	// send messages
	public boolean sendMessage(int uid,int reqId, int rid, String text) {
		try {
			String sql = "insert into message(senderId,recieverId,requestId,messages) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, rid);
			ps.setInt(3, reqId);
			ps.setString(4, text);
			
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
