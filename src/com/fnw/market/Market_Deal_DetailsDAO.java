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
		String sql = "insert into market_deal_details values(?,?,?,?,?,?,to_char(sysdate,'YYYY-mm-DD'),?,?,?,0,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, market_Deal_DetailsDTO.getNum());
		st.setString(2, market_Deal_DetailsDTO.getTitle());
		st.setString(3, market_Deal_DetailsDTO.getWriter());
		st.setString(4, market_Deal_DetailsDTO.getCompany());
		st.setString(5, market_Deal_DetailsDTO.getPublish_date());
		st.setString(6, market_Deal_DetailsDTO.getId());
		st.setInt(7, market_Deal_DetailsDTO.getPrice());
		st.setInt(8, market_Deal_DetailsDTO.getLibrary());
		st.setInt(9, market_Deal_DetailsDTO.getKind());
		st.setInt(10, market_Deal_DetailsDTO.getDelivery());
		st.setString(11, market_Deal_DetailsDTO.getPostCode());
		st.setString(12, market_Deal_DetailsDTO.getAddr());
		st.setString(13, market_Deal_DetailsDTO.getAddr2());

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	public int insert(Market_OrderDTO market_OrderDTO,int state,double price,Connection con) throws Exception{
		String sql = "insert into market_deal_details values(marketdeals_seq.nextval,?,?,?,?,?,to_char(sysdate,'YYYY-mm-DD'),?,?,1,?,null,null,null,null)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, market_OrderDTO.getTitle());
		st.setString(2, market_OrderDTO.getWriter());
		st.setString(3, market_OrderDTO.getCompany());
		st.setString(4, market_OrderDTO.getPublish_date());
		st.setString(5, market_OrderDTO.getId());
		st.setDouble(6, price);
		st.setInt(7, market_OrderDTO.getLibrary());
		st.setInt(8, state);

		int result = st.executeUpdate();
		st.close();
		return result;
	}
	public int insert(Market_Deal_DetailsDTO market_Deal_DetailsDTO,Connection con) throws Exception{
		con = DBConnector.getConnect();
		String sql = "insert into market_deal_details values(?,?,?,?,?,?,to_char(sysdate,'YYYY-mm-DD'),?,?,?,0,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, market_Deal_DetailsDTO.getNum());
		st.setString(2, market_Deal_DetailsDTO.getTitle());
		st.setString(3, market_Deal_DetailsDTO.getWriter());
		st.setString(4, market_Deal_DetailsDTO.getCompany());
		st.setString(5, market_Deal_DetailsDTO.getPublish_date());
		st.setString(6, market_Deal_DetailsDTO.getId());
		st.setInt(7, market_Deal_DetailsDTO.getPrice());
		st.setInt(8, market_Deal_DetailsDTO.getLibrary());
		st.setInt(9, market_Deal_DetailsDTO.getKind());
		st.setInt(10, market_Deal_DetailsDTO.getDelivery());
		st.setString(11, market_Deal_DetailsDTO.getPostCode());
		st.setString(12, market_Deal_DetailsDTO.getAddr());
		st.setString(13, market_Deal_DetailsDTO.getAddr2());

		int result = st.executeUpdate();
		
		st.close();
		return result;
	}
	public Market_Deal_DetailsDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from market_deal_details where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		ResultSet rs = st.executeQuery();

		Market_Deal_DetailsDTO market_Deal_DetailsDTO = null;
		while(rs.next()) {
			market_Deal_DetailsDTO = new Market_Deal_DetailsDTO();
			market_Deal_DetailsDTO.setNum(rs.getInt("num"));
			market_Deal_DetailsDTO.setTitle(rs.getString("title"));
			market_Deal_DetailsDTO.setWriter(rs.getString("writer"));
			market_Deal_DetailsDTO.setCompany(rs.getString("company"));
			market_Deal_DetailsDTO.setPublish_date(rs.getString("publish_date"));
			market_Deal_DetailsDTO.setId(rs.getString("id"));
			market_Deal_DetailsDTO.setT_date(rs.getDate("t_date"));
			market_Deal_DetailsDTO.setPrice(rs.getInt("price"));
			market_Deal_DetailsDTO.setLibrary(rs.getInt("library"));
			market_Deal_DetailsDTO.setKind(rs.getInt("kind"));
			market_Deal_DetailsDTO.setState(rs.getInt("state"));
			market_Deal_DetailsDTO.setDelivery(rs.getInt("delivery"));
			market_Deal_DetailsDTO.setPostCode(rs.getString("postCode"));
			market_Deal_DetailsDTO.setAddr(rs.getString("addr"));
			market_Deal_DetailsDTO.setAddr2(rs.getString("addr2"));
		}
		DBConnector.disConnect(rs, st, con);
		return market_Deal_DetailsDTO;
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
		String sql = "select nvl(count(num), 0) from market_deal_details where t_date <= ?" ;
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}
	public int getTotalCount(String search,int kind) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from market_deal_details where t_date <= ? and kind=?" ;
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		st.setInt(2, kind);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public ArrayList<Market_Deal_DetailsDTO> selectList(String id, MakeRow makeRow, String p_date) throws Exception {
		Connection con = DBConnector.getConnect();
		/*String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from market_deal_details where to_char(T_date, 'YYYY-mm-DD') in (?) and id=? order by num asc) N)"
				+ "where R between ? and ?";*/
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from market_deal_details where to_char(T_date, 'YY/MM/DD') <= ? and id=? order by num asc) N)"
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p_date);
		st.setString(2, id);
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());
		ResultSet rs = st.executeQuery();
		
		ArrayList<Market_Deal_DetailsDTO> ar = new ArrayList<>();
		Market_Deal_DetailsDTO market_Deal_DetailsDTO = null;
		while(rs.next()) {
			market_Deal_DetailsDTO = new Market_Deal_DetailsDTO();
			market_Deal_DetailsDTO.setId(rs.getString("id"));
			market_Deal_DetailsDTO.setNum(rs.getInt("num"));
			market_Deal_DetailsDTO.setTitle(rs.getString("title"));
			market_Deal_DetailsDTO.setWriter(rs.getString("writer"));
			market_Deal_DetailsDTO.setCompany(rs.getString("company"));
			market_Deal_DetailsDTO.setPublish_date(rs.getString("publish_date"));
			market_Deal_DetailsDTO.setId(rs.getString("id"));
			market_Deal_DetailsDTO.setT_date(rs.getDate("t_date"));
			market_Deal_DetailsDTO.setPrice(rs.getInt("price"));
			market_Deal_DetailsDTO.setLibrary(rs.getInt("library"));
			market_Deal_DetailsDTO.setKind(rs.getInt("kind"));
			market_Deal_DetailsDTO.setState(rs.getInt("state"));
			market_Deal_DetailsDTO.setDelivery(rs.getInt("delivery"));
			market_Deal_DetailsDTO.setPostCode(rs.getString("postCode"));
			market_Deal_DetailsDTO.setAddr(rs.getString("addr"));
			market_Deal_DetailsDTO.setAddr2(rs.getString("addr2"));
			ar.add(market_Deal_DetailsDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	public ArrayList<Market_Deal_DetailsDTO> selectList(String id, MakeRow makeRow, String p_date ,int kind) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from market_deal_details where to_char(T_date, 'YY/MM/DD') <= ? and id=? and kind=? order by num asc) N)"
				+ "where R between ? and ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p_date);
		st.setString(2, id);
		st.setInt(3, kind);
		st.setInt(4, makeRow.getStartRow());
		st.setInt(5, makeRow.getLastRow());
		ResultSet rs = st.executeQuery();

		ArrayList<Market_Deal_DetailsDTO> ar = new ArrayList<>();
		Market_Deal_DetailsDTO market_Deal_DetailsDTO = null;
		while(rs.next()) {
			market_Deal_DetailsDTO = new Market_Deal_DetailsDTO();
			market_Deal_DetailsDTO.setId(rs.getString("id"));
			market_Deal_DetailsDTO.setNum(rs.getInt("num"));
			market_Deal_DetailsDTO.setTitle(rs.getString("title"));
			market_Deal_DetailsDTO.setWriter(rs.getString("writer"));
			market_Deal_DetailsDTO.setCompany(rs.getString("company"));
			market_Deal_DetailsDTO.setPublish_date(rs.getString("publish_date"));
			market_Deal_DetailsDTO.setId(rs.getString("id"));
			market_Deal_DetailsDTO.setT_date(rs.getDate("t_date"));
			market_Deal_DetailsDTO.setPrice(rs.getInt("price"));
			market_Deal_DetailsDTO.setLibrary(rs.getInt("library"));
			market_Deal_DetailsDTO.setKind(rs.getInt("kind"));
			market_Deal_DetailsDTO.setState(rs.getInt("state"));
			market_Deal_DetailsDTO.setDelivery(rs.getInt("delivery"));
			market_Deal_DetailsDTO.setPostCode(rs.getString("postCode"));
			market_Deal_DetailsDTO.setAddr(rs.getString("addr"));
			market_Deal_DetailsDTO.setAddr2(rs.getString("addr2"));
			ar.add(market_Deal_DetailsDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
}
