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
		
		int ln = 0;
		try {
			ln = Integer.parseInt(request.getParameter("ln"));
		} catch (Exception e) {
		}

		if(method.equals("GET")) {
			request.setAttribute("ln", ln);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberLogin.jsp?ln=" + ln);
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
				if(ln == 0) {
					actionFoward.setCheck(false);
					request.setAttribute("path", "../index.jsp");
				} else {
					actionFoward.setCheck(false);
					request.setAttribute("path", "../library/libraryMain.library?ln=" + ln );
				}
			}else {
				message="로그인 실패";
				request.setAttribute("message", message);
				request.setAttribute("path", "./memberLogin.member?ln=" + ln );
			}
			
			request.setAttribute("ln", ln);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp?ln=" + ln );
		}

		return actionFoward;
	}

}
