package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class AdminBookOrderAjaxService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		request.setAttribute("num", num);
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/admin/admin_bookOrder_ajax.jsp");
		
		return actionFoward;
	}

}
