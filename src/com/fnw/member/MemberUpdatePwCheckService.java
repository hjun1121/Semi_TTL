package com.fnw.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberUpdatePwCheckService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		
		MemberDAO memberDAO = new MemberDAO();
		
		int ln = 0;
		try {
			ln = Integer.parseInt(request.getParameter("ln"));
		} catch (Exception e) {
		}
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
		}

		HttpSession session = null;
		MemberDTO memberDT = null;
		try {
			session = request.getSession();
			memberDT =  (MemberDTO)session.getAttribute("member");
		}catch (Exception e) {
		}
		String id = "";
		if(memberDT != null) {
			id = memberDT.getId();
		}
		
		
		if(memberDT == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member?ln="+ln);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
			
		
			if(method.equals("GET")) {
				actionFoward.setCheck(true);
				request.setAttribute("ln", ln);
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
					actionFoward.setPath("./memberUpdate.member?id="+request.getParameter("id")+"&ln="+ln);
				}
				else {
					request.setAttribute("message", "비밀번호 다시 입력하세요.");
					request.setAttribute("ln", ln);
					
					request.setAttribute("path", "./memberUpdatePwCheck.member?ln="+ln);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				}
			}
		}
		return actionFoward;
	}

}
