package com.fnw.qnaReply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.qna.QnaDAO;
import com.fnw.qna.QnaDTO;

public class QnaReplyUpdateService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int pNum = 1;
		try {
			pNum = Integer.parseInt(request.getParameter("pNum"));
		}catch (Exception e) {
		}
		String pw = request.getParameter("pw");
		if(pw==null) {
			pw="";
		}
		
		int num = 1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		String contents = request.getParameter("contents");
		if(contents == null) {
			contents = "";
		}
		
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		Qna_ReplyDTO qna_ReplyDTO = new Qna_ReplyDTO();
		
		qna_ReplyDTO.setNum(num);
		qna_ReplyDTO.setContents(contents);
		
		int result = 0;
		try {
			result = qna_ReplyDAO.update(qna_ReplyDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0) {
			request.setAttribute("message", "reply 수정 완료");
		}else {
			request.setAttribute("message", "reply 수정 실패");
		}
		request.setAttribute("num", pNum);
		request.setAttribute("pw", pw);
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/resultQna.jsp");
		return actionFoward;
	}
}