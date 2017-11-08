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
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		Qna_ReplyDTO qna_ReplyDTO = new Qna_ReplyDTO();
		qna_ReplyDTO.setContents(request.getParameter("rcontents"));
		qna_ReplyDTO.setNum(Integer.parseInt(request.getParameter("rnum")));
		int pNum = Integer.parseInt(request.getParameter("pnum"));
		
		int result = 0;
		try {
			result = qna_ReplyDAO.update(qna_ReplyDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		QnaDTO qnaDTO = new QnaDTO();
		QnaDAO qnaDAO = new QnaDAO();
		try {
			qnaDTO = qnaDAO.selectOne(pNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<Qna_ReplyDTO> rlist = new ArrayList<>();
		try {
			rlist = qna_ReplyDAO.selectList(pNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0) {
			request.setAttribute("message", "수정 완료");
			request.setAttribute("qnaDTO", qnaDTO);
			request.setAttribute("rDTO", rlist);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/qna/qnaDetails.jsp");
		}else {
			request.setAttribute("message", "수정 실패");
			actionFoward.setPath("../WEB-INF/view/qna/qnaDetails.jsp");
		}
		/*actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");*/
		return actionFoward;
	}
}