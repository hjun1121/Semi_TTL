package com.fnw.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberIdCheckService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String id = request.getParameter("id");
		
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = null;
		try {
			memberDTO = memberDAO.selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(memberDTO != null) {
			request.setAttribute("ch_id", "no");
		}else {
			request.setAttribute("ch_id", "ok");
		}
		
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/member/memberIdCheck.jsp");
		return actionFoward;
	}

}
