package com.fnw.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;

import com.fnw.util.DBConnector;
import com.fnw.util.MakeRow;

public class Book_Rent_DetailsDAO {
	public ArrayList<Book_Rent_DetailsDTO> selectList(String id, MakeRow makeRow, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from book_rent_details where TO_CHAR(in_time,'YY/MM/DD') <= ? and id=? order by bnum asc) N)"
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		st.setString(2, id);
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());
		
		ArrayList<Book_Rent_DetailsDTO> list = new ArrayList<>();
		ResultSet rs = st.executeQuery();
		
		Book_Rent_DetailsDTO book_Rent_DetailsDTO = null;
		while(rs.next()) {
			book_Rent_DetailsDTO = new Book_Rent_DetailsDTO();
			book_Rent_DetailsDTO.setNum(rs.getInt("num"));
			book_Rent_DetailsDTO.setTitle(rs.getString("title"));
			book_Rent_DetailsDTO.setSection(rs.getString("section"));
			book_Rent_DetailsDTO.setWriter(rs.getString("writer"));
			book_Rent_DetailsDTO.setCompany(rs.getString("company"));
			book_Rent_DetailsDTO.setPublish_date(rs.getString("publish_date"));
			book_Rent_DetailsDTO.setId(rs.getString("id"));
			book_Rent_DetailsDTO.setLibrary(rs.getInt("library"));
			book_Rent_DetailsDTO.setIn_time(rs.getDate("in_time"));
			book_Rent_DetailsDTO.setOut_time(rs.getDate("out_time"));
			book_Rent_DetailsDTO.setLate_date(rs.getInt("late_date"));
			book_Rent_DetailsDTO.setBnum(rs.getInt("bnum"));
			
			list.add(book_Rent_DetailsDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return list;
	}
	public Book_Rent_DetailsDTO selectOne(int bnum) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from book_rent_details where bnum=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, bnum);
		System.out.println("DAObNum"+bnum);
		ResultSet rs = st.executeQuery();
		
		Book_Rent_DetailsDTO book_Rent_DetailsDTO = null;
		while(rs.next()) {
			book_Rent_DetailsDTO = new Book_Rent_DetailsDTO();
			book_Rent_DetailsDTO.setNum(rs.getInt("num"));
			book_Rent_DetailsDTO.setTitle(rs.getString("title"));
			book_Rent_DetailsDTO.setSection(rs.getString("section"));
			book_Rent_DetailsDTO.setWriter(rs.getString("writer"));
			book_Rent_DetailsDTO.setCompany(rs.getString("company"));
			book_Rent_DetailsDTO.setPublish_date(rs.getString("publish_date"));
			book_Rent_DetailsDTO.setId(rs.getString("id"));
			book_Rent_DetailsDTO.setLibrary(rs.getInt("library"));
			book_Rent_DetailsDTO.setIn_time(rs.getDate("in_time"));
			book_Rent_DetailsDTO.setOut_time(rs.getDate("out_time"));
			book_Rent_DetailsDTO.setLate_date(rs.getInt("late_date"));
			book_Rent_DetailsDTO.setBnum(bnum);
		}
		return book_Rent_DetailsDTO;
	}
	public int memDelOne(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from book_rent_details where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	public int delete(int bnum) throws Exception{//
		Connection con = DBConnector.getConnect();
		String sql = "delete from book_rent_details where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, bnum);
		
		int result = st.executeUpdate();
		
		return result;
	}
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete from book_rent_details where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		int result = st.executeUpdate();
		
		return result;
	}
	public int getTotalCount(String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from book_rent_details where to_char(in_time,'YY/mm/DD') <= ?" ;
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public int bookReturn(int num,long lateDate,Connection con) throws Exception {
		String sql = "update book_rent_details set out_time=sysdate, late_date=? where bnum = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setLong(1, lateDate);
		st.setInt(2, num);

		int result = st.executeUpdate();
		st.close();
		return result;
	}
	
	public Book_Rent_DetailsDTO selectTime(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select in_time from book_rent_details where bnum=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		Book_Rent_DetailsDTO book_Rent_DetailsDTO = null;
		while(rs.next()) {
			book_Rent_DetailsDTO = new Book_Rent_DetailsDTO();
			book_Rent_DetailsDTO.setIn_time(rs.getDate("in_time"));
		}
		
		return book_Rent_DetailsDTO;
	}
	public int insert(Book_TotalDTO book_TotalDTO,String rent_id, Connection con)throws Exception{
		String sql = "insert into book_rent_details values(?,?,?,?,?,?,?,?,sysdate,null,0,bookdetails_seq.nextval)";
		PreparedStatement st = con.prepareStatement(sql);
		st = con.prepareStatement(sql);
		st.setInt(1, book_TotalDTO.getNum());
		st.setString(2, book_TotalDTO.getTitle());
		st.setString(3, book_TotalDTO.getSection());
		st.setString(4, book_TotalDTO.getWriter());
		st.setString(5, book_TotalDTO.getCompany());
		st.setString(6, book_TotalDTO.getPublish_date());
		st.setString(7, rent_id);
		st.setInt(8, book_TotalDTO.getLibrary());
		int result = st.executeUpdate();
		st.close();
		
		return result;
	}
	public int insert(Book_TotalDTO book_TotalDTO,String rent_id)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into book_rent_details values(bookdetails_seq.nextval,?,?,?,?,?,?,?,sysdate,null,0,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st = con.prepareStatement(sql);
		
		st.setString(1, book_TotalDTO.getTitle());
		st.setString(2, book_TotalDTO.getSection());
		st.setString(3, book_TotalDTO.getWriter());
		st.setString(4, book_TotalDTO.getCompany());
		st.setString(5, book_TotalDTO.getPublish_date());
		st.setString(6, rent_id);
		st.setInt(7, book_TotalDTO.getLibrary());
		st.setInt(8, book_TotalDTO.getNum());
		int result = st.executeUpdate();
		st.close();
		
		return result;
	}
}
