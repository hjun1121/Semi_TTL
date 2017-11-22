package com.fnw.qnaReply;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.DBConnector;
public class ReQnaReplyInsertService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String contents = request.getParameter("contents");
		
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int pNum =0; //qna 글 번호
		try {
			pNum = Integer.parseInt(request.getParameter("pNum"));
		}catch (Exception e) {
		}
		
		int num =0; //부모댓글 번호
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		String pw = request.getParameter("pw");
		if(pw == null) {
			pw="";
		}

		HttpSession session = request.getSession();
		String id = ((MemberDTO)session.getAttribute("member")).getId();
		
		
		
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		Qna_ReplyDTO old= new Qna_ReplyDTO();
		try {
			old = qna_ReplyDAO.selectOne(num);
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		
		Qna_ReplyDTO qna_ReplyDTO = new Qna_ReplyDTO();
		qna_ReplyDTO.setpNum(pNum);
		qna_ReplyDTO.setWriter(id);
		qna_ReplyDTO.setContents(contents);
		qna_ReplyDTO.setRef(old.getRef());
		qna_ReplyDTO.setStep(old.getStep());
		qna_ReplyDTO.setDepth(old.getDepth());
		int result=0;
			
		Connection con;
		try {
			con = DBConnector.getConnect();
			con.setAutoCommit(false);
			
			try {
				result = qna_ReplyDAO.replyUpdate(qna_ReplyDTO, con);
				result = qna_ReplyDAO.insertRelpy(qna_ReplyDTO, con);
				
				con.commit();
				
			}catch (Exception e) {
				con.rollback();
				e.printStackTrace();
			}finally {
				con.setAutoCommit(true);
				con.close();
			}
			
			
			
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		if(result>0) {
			request.setAttribute("message", "대댓글 등록 완료");
				
		}else {
			request.setAttribute("message", "대댓글 실패");
		}
		request.setAttribute("num", pNum);
		request.setAttribute("pw", pw);
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/resultQna.jsp");
		
		return actionFoward;
	}
}