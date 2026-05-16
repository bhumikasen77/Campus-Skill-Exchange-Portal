package com.campusSkill.model;

//import com.google.protobuf.Timestamp;
import java.sql.Timestamp;
public class Message {

	private int msgId;
	private int senderId;
	private int recieverId;
	private int requestId;
	private String messages;
	private Timestamp sent_at;
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}
	public int getRecieverId() {
		return recieverId;
	}
	public void setRecieverId(int recieverId) {
		this.recieverId = recieverId;
	}
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	public String getMessages() {
		return messages;
	}
	public void setMessages(String messages) {
		this.messages = messages;
	}
	public Timestamp getSent_at() {
		return sent_at;
	}
	public void setSent_at(Timestamp sent_at) {
		this.sent_at = sent_at;
	}
	
}
