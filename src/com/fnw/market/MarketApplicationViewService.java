package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.market.Market_OrderDAO;
import com.fnw.market.Market_OrderDTO;;

public class MarketApplicationViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Market_OrderDAO market_OrderDAO = new Market_OrderDAO();
		int num =0;
		try {
		num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			
		}
		Market_OrderDTO market_OrderDTO=null;
		try {
			market_OrderDTO=market_OrderDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//boardDTO가 Null이면 다른 곳으로 처리
		
		request.setAttribute("view", market_OrderDTO);
		request.setAttribute("market", "market");
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/marketApplicationView.jsp");
		
		return actionFoward;
	
	}

}
