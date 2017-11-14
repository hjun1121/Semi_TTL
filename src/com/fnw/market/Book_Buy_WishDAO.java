package com.fnw.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.util.DBConnector;
import com.fnw.util.MakeRow;

public class Book_Buy_WishDAO {
	
	public int bookBuyWishReturn(Market_TotalDTO market_TotalDTO, String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete from book_buy_wish where num = ? and id = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, market_TotalDTO.getNum());
		st.setString(2, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int bookBuyWish(Market_TotalDTO market_TotalDTO, String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into book_buy_wish values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, market_TotalDTO.getNum());
		st.setString(2, market_TotalDTO.getTitle());
		st.setString(3, market_TotalDTO.getWriter());
		st.setString(4, market_TotalDTO.getPublish_date());
		st.setInt(5, market_TotalDTO.getLibrary());
		st.setString(6, id);
		st.setInt(7, market_TotalDTO.getPrice());
		st.setInt(8, market_TotalDTO.getApproval());
		st.setString(9, market_TotalDTO.getCompany());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public ArrayList<Book_Buy_WishDTO> selectList(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from book_buy_wish where id = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ArrayList<Book_Buy_WishDTO> ar = new ArrayList<>();
		Book_Buy_WishDTO book_Buy_WishDTO = null;
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			book_Buy_WishDTO = new Book_Buy_WishDTO();
			book_Buy_WishDTO.setNum(rs.getInt("num"));
			book_Buy_WishDTO.setTitle(rs.getString("title"));
			book_Buy_WishDTO.setWriter(rs.getString("writer"));
			book_Buy_WishDTO.setPublish_date(rs.getString("publish_date"));
			book_Buy_WishDTO.setLibrary(rs.getInt("library"));
			book_Buy_WishDTO.setId(rs.getString("id"));
			book_Buy_WishDTO.setPrice(rs.getInt("price"));
			book_Buy_WishDTO.setState(rs.getInt("state"));
			book_Buy_WishDTO.setCompany(rs.getString("company"));
			ar.add(book_Buy_WishDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	public ArrayList<Book_Buy_WishDTO> selectList(String id, MakeRow makeRow, String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from" + 
				"(select rownum R, N.* from" + 
				"(select * from book_buy_wish where "+kind+" like ? and id=? order by num asc) N)" + 
				"where R between ? and ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setString(2, id);
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		ArrayList<Book_Buy_WishDTO> list = new ArrayList<>();
		Book_Buy_WishDTO book_Buy_WishDTO = null;
		
		while(rs.next()) {
			book_Buy_WishDTO = new Book_Buy_WishDTO();
			book_Buy_WishDTO.setNum(rs.getInt("num"));
			book_Buy_WishDTO.setTitle(rs.getString("title"));
			book_Buy_WishDTO.setWriter(rs.getString("writer"));
			book_Buy_WishDTO.setPublish_date(rs.getString("publish_date"));
			book_Buy_WishDTO.setLibrary(rs.getInt("library"));
			book_Buy_WishDTO.setId(rs.getString("id"));
			book_Buy_WishDTO.setPrice(rs.getInt("price"));
			book_Buy_WishDTO.setState(rs.getInt("state"));
			book_Buy_WishDTO.setCompany(rs.getString("company"));
			
			list.add(book_Buy_WishDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return list;
	}
	
	public int getTotalCount(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from book_buy_wish where "+ kind +" like ?" ;

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
		String sql = "delete from book_buy_wish where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		return result;
	}
	
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete from book_buy_wish where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		int result = st.executeUpdate();
		
		return result;
	}
	
	public Book_Buy_WishDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from book_buy_wish where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		Book_Buy_WishDTO book_Buy_WishDTO = null;
		while(rs.next()) {
			book_Buy_WishDTO = new Book_Buy_WishDTO();
			book_Buy_WishDTO.setNum(rs.getInt("num"));
			book_Buy_WishDTO.setTitle(rs.getString("title"));
			book_Buy_WishDTO.setWriter(rs.getString("writer"));
			book_Buy_WishDTO.setPublish_date(rs.getString("publish_date"));
			book_Buy_WishDTO.setLibrary(rs.getInt("library"));
			book_Buy_WishDTO.setId(rs.getString("id"));
			book_Buy_WishDTO.setPrice(rs.getInt("price"));
			book_Buy_WishDTO.setState(rs.getInt("state"));
			book_Buy_WishDTO.setCompany(rs.getString("company"));
		}
		return book_Buy_WishDTO;
	}

	public int update(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="UPDATE book_buy_wish SET state=10 WHERE num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	public int update(int num,Connection con) throws Exception{
		String sql="UPDATE book_buy_wish SET state=10 WHERE num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		st.close();
		return result;
	}
}
