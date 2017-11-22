package com.fnw.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberLoginService implements Action {

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

		if(method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberLogin.jsp");
		}else {
			MemberDAO memberDAO = new MemberDAO();
			MemberDTO memberDTO = null;
			try {
				memberDTO = memberDAO.selectOne(request.getParameter("id"), request.getParameter("pw"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String message=null;
			if(memberDTO !=null) {
				message="로그인 성공";
				request.getSession().setAttribute("member", memberDTO);
				request.setAttribute("message", message);
				request.setAttribute("path", "../index.jsp");
			}else {
				message="로그인 실패";
				request.setAttribute("message", message);
				request.setAttribute("path", "./memberLogin.member");
			}
			
			request.setAttribute("library", library);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionFoward;
	}

}
