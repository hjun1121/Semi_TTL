package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class BookBuyWishReturnService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Buy_WishDAO book_Buy_WishDAO = new Book_Buy_WishDAO();
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		Market_TotalDTO market_TotalDTO = new Market_TotalDTO();
		
		String id = request.getParameter("id");
		if(id == null) {
			id = "";
		}
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			market_TotalDTO = market_TotalDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = 0;
		try {
			result = book_Buy_WishDAO.bookBuyWishReturn(market_TotalDTO, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0) {
			request.setAttribute("message", "❤ 해제 완료");
		} else {
			request.setAttribute("message", "❤ 해제 실패");
		}
		
		request.setAttribute("curPage", curPage);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/bookBuyWishReturn.jsp");
		
		return actionFoward;
	}
	
}