package com.fnw.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.util.DBConnector;
import com.fnw.util.MakeRow;

public class Market_Deal_DetailsDAO {
	public int insert(Market_Deal_DetailsDTO market_Deal_DetailsDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into market_deal_details values(14,?,?,?,?,?,sysdate,?,?,?,0,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, market_Deal_DetailsDTO.getTitle());
		st.setString(2, market_Deal_DetailsDTO.getWriter());
		st.setString(3, market_Deal_DetailsDTO.getCompany());
		st.setString(4, market_Deal_DetailsDTO.getPublish_date());
		st.setString(5, market_Deal_DetailsDTO.getId());
		st.setInt(6, market_Deal_DetailsDTO.getPrice());
		st.setInt(7, market_Deal_DetailsDTO.getLibrary());
		st.setInt(8, market_Deal_DetailsDTO.getKind());
		st.setInt(9, market_Deal_DetailsDTO.getDelivery());

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	public ArrayList<Market_Deal_DetailsDTO> selectList(String id, MakeRow makeRow, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from market_deal_details where T_date<=? and id=? order by num asc) N)"
				+ "where R between ? and ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		st.setString(2, id);
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());
		ResultSet rs = st.executeQuery();

		ArrayList<Market_Deal_DetailsDTO> ar = new ArrayList<>();
		Market_Deal_DetailsDTO book_Deal_DetailsDTO = null;
		while(rs.next()) {
			book_Deal_DetailsDTO = new Market_Deal_DetailsDTO();
			book_Deal_DetailsDTO.setId(rs.getString("id"));
			book_Deal_DetailsDTO.setNum(rs.getInt("num"));
			book_Deal_DetailsDTO.setTitle(rs.getString("title"));
			book_Deal_DetailsDTO.setWriter(rs.getString("writer"));
			book_Deal_DetailsDTO.setCompany(rs.getString("company"));
			book_Deal_DetailsDTO.setPublish_date(rs.getString("publish_date"));
			book_Deal_DetailsDTO.setId(rs.getString("id"));
			book_Deal_DetailsDTO.setT_date(rs.getDate("t_date"));
			book_Deal_DetailsDTO.setPrice(rs.getInt("price"));
			book_Deal_DetailsDTO.setLibrary(rs.getInt("library"));
			book_Deal_DetailsDTO.setKind(rs.getInt("kind"));
			book_Deal_DetailsDTO.setState(rs.getInt("state"));
			book_Deal_DetailsDTO.setDelivery(rs.getInt("delivery"));
			ar.add(book_Deal_DetailsDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	public Market_Deal_DetailsDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from market_deal_details where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		ResultSet rs = st.executeQuery();

		Market_Deal_DetailsDTO book_Deal_DetailsDTO = null;
		while(rs.next()) {
			book_Deal_DetailsDTO = new Market_Deal_DetailsDTO();
			book_Deal_DetailsDTO.setNum(rs.getInt("num"));
			book_Deal_DetailsDTO.setTitle(rs.getString("title"));
			book_Deal_DetailsDTO.setWriter(rs.getString("writer"));
			book_Deal_DetailsDTO.setCompany(rs.getString("company"));
			book_Deal_DetailsDTO.setPublish_date(rs.getString("publish_date"));
			book_Deal_DetailsDTO.setId(rs.getString("id"));
			book_Deal_DetailsDTO.setT_date(rs.getDate("t_date"));
			book_Deal_DetailsDTO.setPrice(rs.getInt("price"));
			book_Deal_DetailsDTO.setLibrary(rs.getInt("library"));
			book_Deal_DetailsDTO.setKind(rs.getInt("kind"));
			book_Deal_DetailsDTO.setState(rs.getInt("state"));
			book_Deal_DetailsDTO.setDelivery(rs.getInt("delivery"));
		}
		DBConnector.disConnect(rs, st, con);
		return book_Deal_DetailsDTO;
	}
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete from market_deal_details where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		return result;
	}
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete from market_deal_details where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		int result = st.executeUpdate();
		
		return result;
	}
	public int getTotalCount(String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from market_deal_details where t_date < ?" ;
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}
}
