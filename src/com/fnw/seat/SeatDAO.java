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
		String sql="UPDATE seat SET state=0, id=?,reserve_time=sysdate  where seat_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, seatDTO.getId());
		st.setInt(2, seatDTO.getSeat_num());
		
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
		 String sql = "select * from seat where library=? ";
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
}
