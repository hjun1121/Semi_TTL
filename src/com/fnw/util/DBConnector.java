package com.fnw.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnector {
	
	
	public static Connection getConnect() throws Exception {
		//1로그인정보
		String user="library";
		String password="library";

<<<<<<< HEAD
		String url="jdbc:oracle:thin:@172.20.10.5:1521:xe";
//		String url="jdbc:oracle:thin:@192.168.20.46:1521:xe";
=======

		/*String url="jdbc:oracle:thin:@192.168.20.46:1521:xe";*/
		String url="jdbc:oracle:thin:@192.168.20.46:1521:xe"; //희성
		//String url="jdbc:oracle:thin:@192.168.0.8:1521:xe"; //희성

>>>>>>> 7fa3095920d2d17298be8dcbc3895059d9ed3917
		String driver="oracle.jdbc.driver.OracleDriver";
		
		//driver
		Class.forName(driver);
		
		//con
		Connection con = DriverManager.getConnection(url, user, password);
		
		return con;
	}
	
	public static void disConnect(ResultSet rs, PreparedStatement st, Connection con) throws Exception {
		rs.close();
		st.close();
		con.close();
	}
	
	public static void disConnect(PreparedStatement st, Connection con) throws Exception {
		st.close();
		con.close();
	}
	
}
