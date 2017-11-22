package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class BookBuyFinishService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();

		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/bookBuyFinish.jsp");
		return actionFoward;
	}
}
