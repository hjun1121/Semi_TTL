package com.fnw.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class NoticeWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		String method = request.getMethod();
		ActionFoward actionFoward = new ActionFoward();
		
		HttpSession session = null;
		MemberDTO memberDTO = null;
		try {
			session = request.getSession();
			memberDTO =  (MemberDTO)session.getAttribute("member");
		}catch (Exception e) {
		}
		String id = "";
		if(memberDTO != null) {
			id = memberDTO.getId();
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
	
			if(method.equals("POST")) {
				NoticeDAO noticeDAO = new NoticeDAO();
				NoticeDTO noticeDTO = new NoticeDTO();
				noticeDTO.setTitle(request.getParameter("title"));
				noticeDTO.setContents(request.getParameter("contents"));
				noticeDTO.setWriter(request.getParameter("writer"));
				int result=0;
				try {
					result = noticeDAO.insert(noticeDTO);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(result>0) {
					request.setAttribute("message", "입력 완료");
					request.setAttribute("path", "./noticeList.notice?id="+id);
				}else {
					request.setAttribute("message", "입력 실패");
					request.setAttribute("path", "./noticeList.notice?id="+id);
				}
				request.setAttribute("library", library);
				request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}else {
				request.setAttribute("notice", "notice");
				request.setAttribute("library", library);
				request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/notice/noticeWrite.jsp");
			}
		}	
		return actionFoward;
	}

}
