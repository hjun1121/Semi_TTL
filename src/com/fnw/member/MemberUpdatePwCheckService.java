package com.fnw.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberUpdatePwCheckService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		
		MemberDAO memberDAO = new MemberDAO();
		
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		if(method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberUpdatePwCheck.jsp");
		}
		else {
			MemberDTO memberDTO = new MemberDTO();
			try {
				memberDTO = memberDAO.selectOne(request.getParameter("id"),request.getParameter("pw"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(memberDTO!=null) {
				actionFoward.setCheck(false);
				actionFoward.setPath("./memberUpdate.member?id="+request.getParameter("id"));
			}
			else {
				request.setAttribute("message", "비밀번호 다시 입력하세요.");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}
		request.setAttribute("library", library);
		return actionFoward;
	}

}
