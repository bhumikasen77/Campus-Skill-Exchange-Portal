package com.campusSkill.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionProvider {

	public static Connection conn;
	
	public static Connection getConnection() {
		try {
			if(conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campus_skill_db","root","bhumi@01");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;	
	}
	
}
