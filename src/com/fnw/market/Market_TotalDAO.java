package com.fnw.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.util.DBConnector;
import com.fnw.util.MakeRow;

public class Market_TotalDAO {
	
	public int bookBuyWishReturn(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update market_total set wish = "
				+ "(select wish from market_total where num = ? ) - 1"
				+ "where num = ? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		st.setInt(2, num);

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int bookBuyWish(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update market_total set wish = "
				+ "(select wish from market_total where num = ? ) + 1"
				+ "where num = ? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		st.setInt(2, num);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
		
	public int insert(Market_OrderDTO market_OrderDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into market_total values((select nvl(max(num),0) from market_total)+1,?,?,?,?,?,?,?,0,2,1)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, market_OrderDTO.getTitle());
		st.setString(2, market_OrderDTO.getWriter());
		st.setString(3, market_OrderDTO.getCompany());
		st.setString(4, market_OrderDTO.getPublish_date());
		st.setInt(5, market_OrderDTO.getLibrary());
		st.setInt(6, market_OrderDTO.getPrice());
		st.setString(7, market_OrderDTO.getId());

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	public  int delete(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="delete market_total where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	public int getTotalCount() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num),0) from market_total";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public ArrayList<Market_TotalDTO> selectList() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from market_total";
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();

		ArrayList<Market_TotalDTO> ar = new ArrayList<>();
		Market_TotalDTO market_TotalDTO = null;
		while(rs.next()) {
			market_TotalDTO = new Market_TotalDTO();
			market_TotalDTO.setNum(rs.getInt("num"));
			market_TotalDTO.setTitle(rs.getString("title"));
			market_TotalDTO.setWriter(rs.getString("writer"));
			market_TotalDTO.setCompany(rs.getString("company"));
			market_TotalDTO.setPublish_date(rs.getString("publish_date"));
			market_TotalDTO.setLibrary(rs.getInt("library"));
			market_TotalDTO.setPrice(rs.getInt("price"));
			market_TotalDTO.setId(rs.getString("id"));
			market_TotalDTO.setWish(rs.getInt("wish"));
			market_TotalDTO.setApproval(rs.getInt("approval"));
			market_TotalDTO.setBook_state(rs.getInt("book_state"));
			ar.add(market_TotalDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}

	public ArrayList<Market_TotalDTO> selectList(MakeRow makeRow) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from "
				+ "(select rownum R, M.* from market_total M where approval=1 order by num asc) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, makeRow.getStartRow());
		st.setInt(2, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();

		ArrayList<Market_TotalDTO> ar = new ArrayList<>();
		Market_TotalDTO market_TotalDTO = null;
		while(rs.next()) {
			market_TotalDTO = new Market_TotalDTO();
			market_TotalDTO.setNum(rs.getInt("num"));
			market_TotalDTO.setTitle(rs.getString("title"));
			market_TotalDTO.setWriter(rs.getString("writer"));
			market_TotalDTO.setCompany(rs.getString("company"));
			market_TotalDTO.setPublish_date(rs.getString("publish_date"));
			market_TotalDTO.setLibrary(rs.getInt("library"));
			market_TotalDTO.setPrice(rs.getInt("price"));
			market_TotalDTO.setId(rs.getString("id"));
			market_TotalDTO.setWish(rs.getInt("wish"));
			market_TotalDTO.setApproval(rs.getInt("approval"));
			market_TotalDTO.setBook_state(rs.getInt("book_state"));
			ar.add(market_TotalDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	
	public Market_TotalDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from market_total where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		ResultSet rs = st.executeQuery();

		Market_TotalDTO market_TotalDTO = null;
		while(rs.next()) {
			market_TotalDTO = new Market_TotalDTO();
			market_TotalDTO.setNum(rs.getInt("num"));
			market_TotalDTO.setTitle(rs.getString("title"));
			market_TotalDTO.setWriter(rs.getString("writer"));
			market_TotalDTO.setCompany(rs.getString("company"));
			market_TotalDTO.setPublish_date(rs.getString("publish_date"));
			market_TotalDTO.setLibrary(rs.getInt("library"));
			market_TotalDTO.setPrice(rs.getInt("price"));
			market_TotalDTO.setId(rs.getString("id"));
			market_TotalDTO.setWish(rs.getInt("wish"));
			market_TotalDTO.setApproval(rs.getInt("approval"));
			market_TotalDTO.setBook_state(rs.getInt("book_state"));
		}
		DBConnector.disConnect(rs, st, con);
		return market_TotalDTO;
	}
	
	public int update(int num,Connection con) throws Exception{
		String sql="UPDATE market_total set approval=2 WHERE num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		st.close();
		return result;
	}
}
