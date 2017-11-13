package com.fnw.market;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class BookBuyWishService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Buy_WishDAO book_Buy_WishDAO = new Book_Buy_WishDAO();
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Market_TotalDTO market_TotalDTO = null;
		try {
			market_TotalDTO = new Market_TotalDAO().selectOne(num);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String id = request.getParameter("id");
		if(id == null) {
			id = "";
		}
		int result = 0;
		try {
			result = book_Buy_WishDAO.bookBuyWish(market_TotalDTO, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0) {
			request.setAttribute("message", "❤ 완료");
		} else {
			request.setAttribute("message", "❤ 실패");
		}

		request.setAttribute("curPage", curPage);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/bookBuyWish.jsp");
		
		return actionFoward;
	}

}
