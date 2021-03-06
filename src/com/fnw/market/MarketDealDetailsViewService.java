package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MarketDealDetailsViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();

		Market_Deal_DetailsDTO market_Deal_DetailsDTO = null;
		Market_Deal_DetailsDAO market_Deal_DetailsDAO = new Market_Deal_DetailsDAO();
		
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
		try {
			market_Deal_DetailsDTO = market_Deal_DetailsDAO.selectOne(Integer.parseInt(request.getParameter("num")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("library", library);
		request.setAttribute("bookDealsDetail", market_Deal_DetailsDTO);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/marketDealsDetails.jsp");
		request.setAttribute("ln", ln);
		return actionFoward;
	}

}
