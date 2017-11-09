package com.fnw.qnaReply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.market.Market_Deal_DetailsDAO;
import com.fnw.member.MemberDTO;
import com.fnw.qna.QnaDAO;
import com.fnw.qna.QnaDTO;

public class QnaReplyDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		
		int result = 0;
		try {
			result = qna_ReplyDAO.delete(Integer.parseInt(request.getParameter("num")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		QnaDTO qnaDTO = new QnaDTO();
		QnaDAO qnaDAO = new QnaDAO();
		try {
			qnaDTO = qnaDAO.selectOne(Integer.parseInt(request.getParameter("ref")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<Qna_ReplyDTO> rlist = new ArrayList<>();
		try {
			rlist = qna_ReplyDAO.selectList(Integer.parseInt(request.getParameter("ref")));
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
			request.setAttribute("message", "수정 완료");
			request.setAttribute("qnaDTO", qnaDTO);
			request.setAttribute("rDTO", rlist);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/qna/qnaDetails.jsp");
		}
		/*actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");*/

		return actionFoward;
	}
}