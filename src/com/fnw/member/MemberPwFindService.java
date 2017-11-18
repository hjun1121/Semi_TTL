package com.fnw.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.util.EmailDAO;

public class MemberPwFindService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		
		if(method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberPwFind.jsp");
		}else {
			MemberDAO memberDAO = new MemberDAO();
			MemberDTO memberDTO = null;
			try {
				memberDTO = memberDAO.PwFind(request.getParameter("id"),request.getParameter("name"), request.getParameter("email"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			String message=null;
			if(memberDTO !=null) {
				EmailDAO emailDAO = new EmailDAO();
				emailDAO.sendPw(request, memberDTO);
				message="가입한 email로 임시 비밀번호를 발송했습니다.";
				request.setAttribute("message", message);
				request.setAttribute("path", "../member/memberLogin.member");
			}else {
				message="일치하는 회원정보가 없습니다.";
				request.setAttribute("message", message);
				request.setAttribute("path", "../index.jsp");
			}
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionFoward;
	}

}
