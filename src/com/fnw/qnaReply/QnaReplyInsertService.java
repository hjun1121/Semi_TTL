package com.fnw.qnaReply;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.qna.QnaDAO;
import com.fnw.qna.QnaDTO;
public class QnaReplyInsertService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String contents = request.getParameter("contents");
		int pNum =0;
		try {
			pNum = Integer.parseInt(request.getParameter("pNum"));
		}catch (Exception e) {
		}
		
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		Qna_ReplyDTO qna_ReplyDTO = null;
		
		QnaDAO qnaDAO = new QnaDAO();
		QnaDTO qnaDTO = null;
		try {
			qnaDTO = qnaDAO.selectOne(pNum);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		int result = 0;
		ArrayList<Qna_ReplyDTO> rlist = new ArrayList<>();
		try {
			qna_ReplyDTO = new Qna_ReplyDTO();
			qna_ReplyDTO.setpNum(pNum);
			qna_ReplyDTO.setNum(qnaDTO.getNum());
			qna_ReplyDTO.setWriter(qnaDTO.getWriter());
			qna_ReplyDTO.setContents(contents);
			qna_ReplyDTO.setRef(qnaDTO.getNum());
			qna_ReplyDTO.setStep(0);
			qna_ReplyDTO.setDepth(0);
			result = qna_ReplyDAO.insert(qna_ReplyDTO);
			try {
				rlist = qna_ReplyDAO.selectList(pNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(result>0) {
				request.setAttribute("message", "댓글 성공");
				request.setAttribute("qnaDTO", qnaDTO);
				request.setAttribute("rDTO", rlist);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/qna/qnaDetails.jsp");
			}else {
				request.setAttribute("message", "댓글 실패");
				request.setAttribute("path", "../qna/qnaList.qna");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return actionFoward;
	}
}