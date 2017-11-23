package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.market.Market_OrderDAO;
import com.fnw.market.Market_OrderDTO;;

public class AdminMarketOrderViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Market_OrderDAO market_OrderDAO = new Market_OrderDAO();
		
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
		
		request.setAttribute("library", library);
		request.setAttribute("view", market_OrderDTO);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/admin/admin_MarketOrder_View.jsp");
		
		request.setAttribute("ln", ln);
		return actionFoward;
	}

}
