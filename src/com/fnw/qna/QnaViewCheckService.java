package com.fnw.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.qnaReply.Qna_ReplyDAO;
import com.fnw.qnaReply.Qna_ReplyDTO;

public class QnaViewCheckService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
		}
		String pw = request.getParameter("pw");
		if(pw == null) {
			pw="";
		}
		
		
		if(method.equals("GET")) {
			request.setAttribute("num", num);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/qna/qnaViewCheck.jsp");
			
		}else {
			QnaDAO qnaDAO = new QnaDAO();
			int result=0;
			try {
				result = qnaDAO.pwCheck(num, pw);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(result>0) {
				QnaDTO qnaDTO = new QnaDTO();
				Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
				ArrayList<Qna_ReplyDTO> list = new ArrayList<>();
				try {
					qnaDAO.hitUpdate(num);
					qnaDTO = qnaDAO.selectOne(num);
					list = qna_ReplyDAO.selectList(num);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.setAttribute("replyList", list);
				request.setAttribute("qnaDTO", qnaDTO);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/qna/qnaView.jsp");
			}else {
				request.setAttribute("message", "비밀번호 다시 입력하세요.");
				request.setAttribute("path", "../qna/qnaViewCheck.qna?num="+num);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}
		request.setAttribute("library", library);
		return actionFoward;
	}
	
}