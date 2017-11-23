package com.fnw.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberLogoutService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		request.getSession().invalidate();
		
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

		if(ln == 0) {
			actionFoward.setCheck(false);
			actionFoward.setPath("../index.jsp");
		} else {
			actionFoward.setCheck(false);
			actionFoward.setPath("../library/libraryMain.library?ln=" + ln + "&library=" + library);
		}
		return actionFoward;
	}

}
