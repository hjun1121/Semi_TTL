package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class BookRentWishService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();
		Book_TotalDTO book_TotalDTO = new Book_TotalDTO();
		Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
		String search = request.getParameter("search");
		int curPage = Integer.parseInt(request.getParameter("curPage"));
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			book_TotalDTO = book_TotalDAO.selectOne(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		String id = request.getParameter("id");
		if(id == null) {
			id = "";
		}
		int result = 0;
		try {
			result = book_Rent_WishDAO.bookRentWish(book_TotalDTO, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if(result > 0) {
			request.setAttribute("message", "찜 완료");
		}else {
			request.setAttribute("message", "찜 실패");
		}

		request.setAttribute("search", search);
		request.setAttribute("curPage", curPage);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/book/bookRentWish.jsp");

		return actionFoward;
	}
}
