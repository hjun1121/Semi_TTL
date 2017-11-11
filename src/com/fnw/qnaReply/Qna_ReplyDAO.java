package com.fnw.qnaReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.util.DBConnector;

public class Qna_ReplyDAO {


	public int replyUpdate(Qna_ReplyDTO qna_ReplyDTO, Connection con) throws Exception{
		String sql ="update qna_reply set step=step+1 where ref=? and step>?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, qna_ReplyDTO.getRef());
		st.setInt(2, qna_ReplyDTO.getStep());
		
		int result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	public int insertRelpy(Qna_ReplyDTO qna_ReplyDTO, Connection con) throws Exception{
		String sql = "insert into qna_reply values(?,reply_seq.nextval,?,?,sysdate,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, qna_ReplyDTO.getpNum());
		st.setString(2, qna_ReplyDTO.getWriter());
		st.setString(3, qna_ReplyDTO.getContents());
		st.setInt(4, qna_ReplyDTO.getRef());
		st.setInt(5, qna_ReplyDTO.getStep()+1);
		st.setInt(6, qna_ReplyDTO.getDepth()+1);
		int result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	
	public int insert(Qna_ReplyDTO qna_ReplyDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into qna_reply values(?,reply_seq.nextval,?,?,sysdate,reply_seq.currval,0,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, qna_ReplyDTO.getpNum());
		st.setString(2, qna_ReplyDTO.getWriter());
		st.setString(3, qna_ReplyDTO.getContents());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public ArrayList<Qna_ReplyDTO> selectList(int pNum) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from qna_reply where pNum=? order by ref desc, step asc";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, pNum);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Qna_ReplyDTO> ar = new ArrayList<>();
		Qna_ReplyDTO qna_ReplyDTO = null;
		while(rs.next()) {
			qna_ReplyDTO = new Qna_ReplyDTO();
			qna_ReplyDTO.setpNum(pNum);
			qna_ReplyDTO.setNum(rs.getInt("num"));
			qna_ReplyDTO.setWriter(rs.getString("writer"));
			qna_ReplyDTO.setContents(rs.getString("contents"));
			qna_ReplyDTO.setReg_date(rs.getDate("reg_date"));
			qna_ReplyDTO.setRef(rs.getInt("ref"));
			qna_ReplyDTO.setStep(rs.getInt("step"));
			qna_ReplyDTO.setDepth(rs.getInt("depth"));
			ar.add(qna_ReplyDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete from qna_reply where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		return result;
	}
	public Qna_ReplyDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from qna_reply where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		ResultSet rs = st.executeQuery();

		Qna_ReplyDTO qna_ReplyDTO = null;
		if(rs.next()) {
			qna_ReplyDTO = new Qna_ReplyDTO();
			qna_ReplyDTO.setpNum(rs.getInt("pnum"));
			qna_ReplyDTO.setNum(rs.getInt("num"));
			qna_ReplyDTO.setWriter(rs.getString("writer"));
			qna_ReplyDTO.setContents(rs.getString("contents"));
			qna_ReplyDTO.setReg_date(rs.getDate("reg_date"));
			qna_ReplyDTO.setRef(rs.getInt("ref"));
			qna_ReplyDTO.setStep(rs.getInt("step"));
			qna_ReplyDTO.setDepth(rs.getInt("depth"));
		}
		DBConnector.disConnect(rs, st, con);
		return qna_ReplyDTO;
	}
	
	public int update(Qna_ReplyDTO qna_ReplyDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="UPDATE qna_reply SET contents=? WHERE num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, qna_ReplyDTO.getContents());
		st.setInt(2, qna_ReplyDTO.getNum());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	public int update(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="UPDATE qna_reply SET writer=? WHERE writer=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, "알수 없는 사용자");
		st.setString(2, id);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
}
