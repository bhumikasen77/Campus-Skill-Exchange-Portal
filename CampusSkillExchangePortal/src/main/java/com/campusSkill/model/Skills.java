package com.campusSkill.model;

public class Skills {

	private int skill_id;
	private String skillName;
	private String level;
	private String description;
	private String availability;
	private String status;
	private int owner_user;
	private int uid;
	private String uname;
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Skills() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getSkill_id() {
		return skill_id;
	}

	public void setSkill_id(int skill_id) {
		this.skill_id = skill_id;
	}

	public String getSkillName() {
		return skillName;
	}
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getOwner_user() {
		return owner_user;
	}
	public void setOwner_user(int owner_user) {
		this.owner_user = owner_user;
	}
	
	
}
