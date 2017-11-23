package com.fnw.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.util.DBConnector;
import com.fnw.util.MakeRow;

public class Seat_DetailsDAO {
	public ArrayList<Seat_DetailsDTO> selectList(String id, MakeRow makeRow, String p_date) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from seat_details where TO_CHAR(reserve_time,'YY/MM/DD') <= ? and id=? order by num asc) N)"
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, p_date);
		st.setString(2, id);
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();

		ArrayList<Seat_DetailsDTO> ar = new ArrayList<>();
		Seat_DetailsDTO seat_DetailsDTO = null;
		while(rs.next()) {
			seat_DetailsDTO = new Seat_DetailsDTO();
			seat_DetailsDTO.setNum(rs.getInt("num"));
			seat_DetailsDTO.setSeat_num(rs.getInt("seat_num"));
			seat_DetailsDTO.setLibrary(rs.getInt("library"));
			seat_DetailsDTO.setId(rs.getString("id"));
			seat_DetailsDTO.setIn_time(rs.getDate("in_time"));
			seat_DetailsDTO.setOut_time(rs.getDate("out_time"));
			seat_DetailsDTO.setState(rs.getInt("state"));
			seat_DetailsDTO.setReserve_time(rs.getDate("reserve_time"));
			
			ar.add(seat_DetailsDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	public int getTotalCount(String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from seat_details where reserve_time <= ?" ;
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}
	public  int delete(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="delete from seat_details where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	public int seatUpdate(int num, Connection con) throws Exception {
		String sql="UPDATE seat_details SET out_time=sysdate, state=2  where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		st.close();
		return result;
	}
	public int seatCancel(int seat_num,Connection con) throws Exception {
		String sql="UPDATE seat_details SET state=3  where seat_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, seat_num);
		
		int result = st.executeUpdate();
		st.close();
		
		return result;
	}
	public int insert(Seat_DetailsDTO seat_DetailsDTO,Connection con) throws Exception{
		String sql="insert into seat_details values(seat_seq.nextval,?,?,?,null,null,0,sysdate)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, seat_DetailsDTO.getSeat_num());
		st.setInt(2, seat_DetailsDTO.getLibrary());
		st.setString(3, seat_DetailsDTO.getId());
		
		int result = st.executeUpdate();
		st.close();
		return result;
	}
	public int seatIn(int num, Connection con) throws Exception {
		String sql="UPDATE seat_details SET in_time=sysdate, state=1  where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		st.close();
		return result;
	}
	
	public int selectOne (String id,int state) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from seat_details where id= ? and state=?" ;
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.setInt(2, state);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	};
}
