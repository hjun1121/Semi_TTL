package com.fnw.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.util.DBConnector;
import com.fnw.util.MakeRow;

public class Book_Rent_WishDAO {
	
	public int bookRentWishReturn(int num, String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete from book_rent_wish where num = ? and id = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		st.setString(2, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	public int bookRentWish(Book_TotalDTO book_TotalDTO, String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into book_rent_wish values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, book_TotalDTO.getNum());
		st.setString(2, book_TotalDTO.getTitle());
		st.setString(3, book_TotalDTO.getWriter());
		st.setString(4, book_TotalDTO.getCompany());
		st.setString(5, book_TotalDTO.getPublish_date());
		st.setString(6, book_TotalDTO.getSection());
		st.setInt(7, book_TotalDTO.getLibrary());
		st.setString(8, id);
		st.setInt(9, book_TotalDTO.getState());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	public ArrayList<Book_Rent_WishDTO> selectList(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from book_rent_wish where id = ?";

		ArrayList<Book_Rent_WishDTO> list = new ArrayList<>();
		Book_Rent_WishDTO book_Rent_WishDTO = null;
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);

		ResultSet rs = st.executeQuery();

		while(rs.next()) {
			book_Rent_WishDTO = new Book_Rent_WishDTO();
			book_Rent_WishDTO.setNum(rs.getInt("num"));
			book_Rent_WishDTO.setTitle(rs.getString("title"));
			book_Rent_WishDTO.setWriter(rs.getString("writer"));
			book_Rent_WishDTO.setCompany(rs.getString("company"));
			book_Rent_WishDTO.setPublish_date(rs.getString("publish_date"));
			book_Rent_WishDTO.setSection(rs.getString("section"));
			book_Rent_WishDTO.setLibrary(rs.getInt("library"));
			book_Rent_WishDTO.setId(rs.getString("id"));
			book_Rent_WishDTO.setState(rs.getInt("state"));

			list.add(book_Rent_WishDTO);
		}

		DBConnector.disConnect(rs, st, con);
		return list;
	}
	
	
	public ArrayList<Book_Rent_WishDTO> selectList(String id, MakeRow makeRow, String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from" + 
				"(select rownum R, N.* from" + 
				"(select * from book_rent_wish where "+kind+" like ? and id=? order by num asc) N)" + 
				"where R between ? and ?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setString(2, id);
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());

		ResultSet rs = st.executeQuery();
		ArrayList<Book_Rent_WishDTO> list = new ArrayList<>();
		Book_Rent_WishDTO book_Rent_WishDTO = null;
		
		while(rs.next()) {
			book_Rent_WishDTO = new Book_Rent_WishDTO();
			book_Rent_WishDTO.setNum(rs.getInt("num"));
			book_Rent_WishDTO.setTitle(rs.getString("title"));
			book_Rent_WishDTO.setWriter(rs.getString("writer"));
			book_Rent_WishDTO.setCompany(rs.getString("company"));
			book_Rent_WishDTO.setPublish_date(rs.getString("publish_date"));
			book_Rent_WishDTO.setSection(rs.getString("section"));
			book_Rent_WishDTO.setLibrary(rs.getInt("library"));
			book_Rent_WishDTO.setId(rs.getString("id"));
			book_Rent_WishDTO.setState(rs.getInt("state"));
			
			list.add(book_Rent_WishDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return list;
	}

	public int getTotalCount(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from book_rent_wish where "+ kind +" like ?" ;

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete from book_rent_wish where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		return result;
	}
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete from book_rent_wish where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		int result = st.executeUpdate();
		
		return result;
	}
	
	public int stateUpdate(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="UPDATE book_rent_wish SET state=1 WHERE num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	public int updateReturn(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update book_rent_wish set state=0 where num = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
}
