package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class AdminMarketOrderOKService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		Market_OrderDAO market_OrderDAO = new Market_OrderDAO();
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		Market_OrderDTO market_OrderDTO = new Market_OrderDTO();
		
		int result =0;
		try {
			market_OrderDTO = market_OrderDAO.selectOne(num);
			
			result = market_TotalDAO.insert(market_OrderDTO);
			result = market_OrderDAO.updateAdmin(num, 10);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "승인 실패";
		String path = "../index.jsp";
		if(result>0) {
			message = num+"번 신청 승인";
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
