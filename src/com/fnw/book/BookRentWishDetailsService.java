package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class BookRentWishDetailsService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Rent_DetailsDAO book_Rent_DetailsDAO = new Book_Rent_DetailsDAO();
		Book_Rent_DetailsDTO book_Rent_DetailsDTO = null;
		Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
		Book_TotalDTO book_TotalDTO = new Book_TotalDTO();
		
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
			book_Rent_DetailsDTO = book_Rent_DetailsDAO.selectOne(Integer.parseInt(request.getParameter("num")));
			book_TotalDTO = book_TotalDAO.selectOne(Integer.parseInt(request.getParameter("num")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("library", library);
		request.setAttribute("book", book_TotalDTO);
		request.setAttribute("bookRentDTO", book_Rent_DetailsDTO);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/book/bookRentWishDetails.jsp");
		request.setAttribute("ln", ln);
		return actionFoward;
	}
}