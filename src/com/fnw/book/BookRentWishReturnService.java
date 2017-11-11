package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class BookRentWishReturnService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String kind = request.getParameter("kind");
		if(kind == null) {
			kind = "title";
		}
		int library = 1;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String search = request.getParameter("search");
		if(search == null) {
			search = "";
		}
		int curPage = 0;
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
			result = book_Rent_WishDAO.bookRentWishReturn(num, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0) {
			request.setAttribute("message", "❤ 해제 완료");
		}else {
			request.setAttribute("message", "❤ 해제 실패");
		}

		request.setAttribute("search", search);
		request.setAttribute("kind", kind);
		request.setAttribute("library", library);
		request.setAttribute("curPage", curPage);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/book/bookRentWishReturn.jsp");

		
		return actionFoward;
	}
	
}
