package com.fnw.qnaReply;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
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
		HttpSession session = request.getSession();
		String id = ((MemberDTO)session.getAttribute("member")).getId();
				
		int result = 0;
		ArrayList<Qna_ReplyDTO> ar = new ArrayList<>();
		try {
			qna_ReplyDTO = new Qna_ReplyDTO();
			qna_ReplyDTO.setpNum(pNum);
			qna_ReplyDTO.setWriter(id);
			qna_ReplyDTO.setContents(contents);
			
			result = qna_ReplyDAO.insert(qna_ReplyDTO);
			try {
				ar = qna_ReplyDAO.selectList(pNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(result>0) {
				request.setAttribute("message", "댓글 성공");
				request.setAttribute("replyList", ar);
				actionFoward.setCheck(false);
				actionFoward.setPath("../qna/qnaList.qna");
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