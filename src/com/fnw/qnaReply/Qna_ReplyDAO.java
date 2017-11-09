package com.fnw.qnaReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fnw.qna.QnaDTO;
import com.fnw.util.DBConnector;

public class Qna_ReplyDAO {
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
		String sql = "select * from qna_reply where pNum=? order by ref asc";
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
	public QnaDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		ResultSet rs = st.executeQuery();

		QnaDTO qnaDTO = null;
		while(rs.next()) {
			qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setType(rs.getInt("type"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setPw(rs.getString("pw"));
			qnaDTO.setLibrary(rs.getInt("library"));
		}
		DBConnector.disConnect(rs, st, con);
		return qnaDTO;
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
}
