package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class AdminMarketOrderNOService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		Market_OrderDAO market_OrderDAO = new Market_OrderDAO();
		int result =0;
		try {
			result = market_OrderDAO.updateAdmin(num, 0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "거절 실패";
		String path = "../index.jsp";
		if(result>0) {
			message = num+"번 신청 거절";
			path = "./marketOrderAdmin.market";
		}else {
			
		}
		
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionFoward;
	}

}
