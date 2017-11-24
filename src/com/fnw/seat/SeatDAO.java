package com.fnw.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.member.MemberDTO;
import com.fnw.util.DBConnector;

public class SeatDAO {
	
	public void updateReturn() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="UPDATE seat SET state=?, id=?";
	}
	
	
	public int updateRent(SeatDTO seatDTO,Connection con) throws Exception {
		String sql="UPDATE seat SET state=0, id=?, reserve_time=sysdate  where seat_num=? and library=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, seatDTO.getId());
		st.setInt(2, seatDTO.getSeat_num());
		st.setInt(3, seatDTO.getLibrary());
		int result = st.executeUpdate();
		st.close();
		
		return result;
	}
	

	
	public SeatDTO selectOne (int library, int seat_num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from seat where library=? and seat_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, library);
		st.setInt(2, seat_num);
		ResultSet rs = st.executeQuery();
		SeatDTO seatDTO = null;
		
		if(rs.next()) {
			seatDTO = new SeatDTO();
			seatDTO.setSeat_num(rs.getInt("seat_num"));
			seatDTO.setLibrary(rs.getInt("library"));
			seatDTO.setState(rs.getInt("state"));
			seatDTO.setId(rs.getString("id"));
			seatDTO.setReserve_time(rs.getDate("reserve_time"));
		}
		return seatDTO;
	};
	
	public ArrayList<SeatDTO> selectList(int library) throws Exception{
		 Connection con = DBConnector.getConnect();
		 String sql = "select * from seat where library=? order by seat_num";
		 PreparedStatement st = con.prepareStatement(sql);
		 st.setInt(1, library);
		 
		 ResultSet rs = st.executeQuery();
		 
		 ArrayList<SeatDTO> ar = new ArrayList<>();
		 
		 while(rs.next()) {
			 SeatDTO seatDTO = new SeatDTO();
			 seatDTO.setSeat_num(rs.getInt("seat_num"));
			 seatDTO.setLibrary(rs.getInt("library"));
			 seatDTO.setState(rs.getInt("state"));
			 seatDTO.setId(rs.getString("id"));
			 seatDTO.setReserve_time(rs.getDate("reserve_time"));
			 ar.add(seatDTO);
		 }
		 
		 DBConnector.disConnect(rs, st, con);
		 
		 return ar;
				 
	}
	
	public int count(int f, int library) throws Exception{
		 Connection con = DBConnector.getConnect();
		 String sql = "select count(*) from seat where seat_num like ? and library=? and state=1";
		 PreparedStatement st = con.prepareStatement(sql);
		 
		 st.setString(1, f+"%");
		 st.setInt(2, library);
		 ResultSet rs = st.executeQuery();
		 
		 int result=0;
		 if(rs.next()) {
			 result=rs.getInt(1);
		 }
		 DBConnector.disConnect(rs, st, con);
		 return result;
	}

	public int countAll(int f, int library) throws Exception{
		 Connection con = DBConnector.getConnect();
		 String sql = "select count(*) from seat where seat_num like ? and library=?";
		 PreparedStatement st = con.prepareStatement(sql);
		 
		 st.setString(1, f+"%");
		 st.setInt(2, library);
		 ResultSet rs = st.executeQuery();
		 
		 int result=0;
		 if(rs.next()) {
			 result=rs.getInt(1);
		 }
		 DBConnector.disConnect(rs, st, con);
		 return result;
	}
	
	
	
	public int update(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="UPDATE seat SET id=?  where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, null);
		st.setString(2, id);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	public int updateOut(int seat_num,Connection con) throws Exception {
		String sql="UPDATE seat SET state=1, id=null, reserve_time=null where seat_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, seat_num);
		
		int result = st.executeUpdate();
		st.close();
		
		return result;
	}
	public int selectOne (String id,int state) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from seat where id= ? and state=?" ;
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.setInt(2, state);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}
}
