package com.fnw.qnaReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class QnaReplyUpdateService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		Qna_ReplyDTO qna_ReplyDTO = new Qna_ReplyDTO();
		qna_ReplyDTO.setContents(request.getParameter("rcontents"));
		qna_ReplyDTO.setNum(Integer.parseInt(request.getParameter("rnum")));
		
		
		int result = 0;
		try {
			result = qna_ReplyDAO.update(qna_ReplyDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0) {
			request.setAttribute("message", "수정 완료");
			request.setAttribute("path", "../qna/qnaDetails.qna");
		}else {
			request.setAttribute("message", "수정 실패");
			request.setAttribute("path", "../qna/qnaList.qna");
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		return actionFoward;
	}
}