package com.fnw.qna;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class QnaUpdateService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
		}
		int num =0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		int type =1;
		try {
			type = Integer.parseInt(request.getParameter("type"));
		}catch (Exception e) {
		}
		String pw = request.getParameter("pw");
		if(pw == null) {
			pw="";
		}
		
		if(method.equals("GET")) {
			QnaDAO qnaDAO = new QnaDAO();
			QnaDTO qnaDTO = null;
			try {
				qnaDTO = qnaDAO.selectOne(num);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("qnaDTO", qnaDTO);
			request.setAttribute("library", library);
			request.setAttribute("type", type);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/qna/qnaUpdate.jsp");
		}else {
			int result = 0;
			QnaDAO qnaDAO = new QnaDAO();
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setNum(num);
			qnaDTO.setType(type);
			qnaDTO.setTitle(request.getParameter("title"));
			qnaDTO.setContents(request.getParameter("contents"));
			qnaDTO.setLibrary(library);
			qnaDTO.setPw(pw);
			request.setAttribute("library", library);
			try {
				result = qnaDAO.update(qnaDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
			if(result>0) {
				request.setAttribute("message", "수정 완료");
				request.setAttribute("num", num);
				request.setAttribute("pw", pw);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/resultQna.jsp");
			}else {
				request.setAttribute("message", "수정 실패");
				request.setAttribute("path", "../qna/qnaList.qna");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}

		return actionFoward;
	}
}