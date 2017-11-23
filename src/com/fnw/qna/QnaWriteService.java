package com.fnw.qna;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.market.Market_Deal_DetailsDAO;
import com.fnw.member.MemberDTO;

public class QnaWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		
		HttpSession session = null;
		MemberDTO memberDTO = null;
		try {
			session = request.getSession();
			memberDTO =  (MemberDTO)session.getAttribute("member");
		}catch (Exception e) {
		}
		
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
		
		if(memberDTO == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
		
			if(method.equals("GET")) {
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/qna/qnaWrite.jsp");
			}else {
				QnaDTO qnaDTO = null;
				QnaDAO qnaDAO = new QnaDAO();
				int result = 0;
				String message="";
				try {
					qnaDTO = new QnaDTO();
					qnaDTO.setType(Integer.parseInt(request.getParameter("type")));
					qnaDTO.setTitle(request.getParameter("title"));
					qnaDTO.setWriter(request.getParameter("writer"));
					qnaDTO.setContents(request.getParameter("contents"));
					qnaDTO.setWriter(request.getParameter("writer"));
					qnaDTO.setPw(request.getParameter("pw"));
					qnaDTO.setLibrary(Integer.parseInt(request.getParameter("library")));
					result = qnaDAO.insert(qnaDTO);
					if(result > 0) {
						request.setAttribute("message", "등록 완료");
						request.setAttribute("path", "./qnaList.qna");
					}else {
						request.setAttribute("message", "실패");
						request.setAttribute("path", "./qnaList.qna");
					}
					request.setAttribute("library", library);
					request.setAttribute("ln", ln);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/result.jsp");
					
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		}
		return actionFoward;
	}
}