package com.fnw.qnaReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
public class QnaReplyInsertService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String contents = request.getParameter("contents");
		int ln = 0;
		try {
			ln = Integer.parseInt(request.getParameter("ln"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int pNum =0;
		try {
			pNum = Integer.parseInt(request.getParameter("pNum"));
		}catch (Exception e) {
		}
		String pw = request.getParameter("pw");
		if(pw == null) {
			pw="";
		}
		
		
		
		HttpSession session = request.getSession();
		String id = ((MemberDTO)session.getAttribute("member")).getId();
		
		
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		Qna_ReplyDTO qna_ReplyDTO = null;
		qna_ReplyDTO = new Qna_ReplyDTO();
		qna_ReplyDTO.setpNum(pNum);
		qna_ReplyDTO.setWriter(id);
		qna_ReplyDTO.setContents(contents);
			
		int result = 0;
		try {
			result = qna_ReplyDAO.insert(qna_ReplyDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		if(result>0) {
			request.setAttribute("message", "댓글 등록 완료");
				
		}else {
			request.setAttribute("message", "댓글 실패");
		}
		request.setAttribute("num", pNum);
		request.setAttribute("pw", pw);
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/resultQna.jsp");

		request.setAttribute("ln", ln);
		return actionFoward;
	}
}