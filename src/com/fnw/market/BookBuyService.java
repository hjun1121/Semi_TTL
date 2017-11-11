package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class BookBuyService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();

		if(method.equals("GET")) {
			int number = Integer.parseInt(request.getParameter("num"));
			Book_Buy_WishDAO book_Buy_WishDAO = new Book_Buy_WishDAO();
			Book_Buy_WishDTO book_Buy_WishDTO = null;
			try {
				book_Buy_WishDTO = book_Buy_WishDAO.selectOne(number);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			request.setAttribute("buyWishList", book_Buy_WishDTO);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/market/bookOrder.jsp");
		} else {
			Book_Buy_WishDAO book_Buy_WishDAO = new Book_Buy_WishDAO();
			int number = Integer.parseInt(request.getParameter("num"));
			int upResult = 0;
			try {
				upResult = book_Buy_WishDAO.update(number);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			Market_Deal_DetailsDTO market_Deal_DetailsDTO = new Market_Deal_DetailsDTO();
			Market_Deal_DetailsDAO market_Deal_DetailsDAO = new Market_Deal_DetailsDAO();
			if(upResult>0) {
				market_Deal_DetailsDTO.setTitle(request.getParameter("title"));
				market_Deal_DetailsDTO.setWriter(request.getParameter("writer"));
				market_Deal_DetailsDTO.setCompany(request.getParameter("company"));
				market_Deal_DetailsDTO.setPublish_date(request.getParameter("publish_date"));
				market_Deal_DetailsDTO.setId(request.getParameter("id"));
				market_Deal_DetailsDTO.setPrice(Integer.parseInt(request.getParameter("price")));
				market_Deal_DetailsDTO.setLibrary(Integer.parseInt(request.getParameter("library")));
				market_Deal_DetailsDTO.setKind(Integer.parseInt(request.getParameter("kind")));
				market_Deal_DetailsDTO.setDelivery(Integer.parseInt(request.getParameter("approval")));
			}
			int result = 0;
			String message = null;

			try {
				result = market_Deal_DetailsDAO.insert(market_Deal_DetailsDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(result > 0) {
				message = "등록 완료";
			}else {
				message = "등록 실패";
			}
			request.setAttribute("message", message);
			request.setAttribute("path", "../index.jsp");
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		return actionFoward;
	}
}
