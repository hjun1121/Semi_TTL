package com.fnw.library;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class LibraryBookRecommendService implements Action{

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		int library = 1;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return actionFoward;
	}
	
}
