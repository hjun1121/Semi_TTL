package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.library.LibraryDAO;

public class BookRentService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
			ActionFoward actionFoward = new ActionFoward();
			LibraryDAO libraryDAO = new LibraryDAO();
			String search = request.getParameter("search");
			String kind = request.getParameter("kind");
			int curPage = 1;
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			int library = 1;
			try {
				library = Integer.parseInt(request.getParameter("library"));
			} catch (Exception e) {
			}
			int num = 0;
			try {
				num = Integer.parseInt(request.getParameter("num"));
			} catch (Exception e) {
			}
			String rent_id = request.getParameter("rent_id");
			if(rent_id == null) {
				rent_id = "";
			}
			int result = 0;
			try {
				Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
				Book_TotalDTO book_TotalDTO = book_TotalDAO.selectOne(num);
				result = libraryDAO.bookRent(book_TotalDTO, rent_id);
			} catch (Exception e) {
				e.printStackTrace();
			}

			if(result > 0) {
				request.setAttribute("message", "대여 완료");
			}else {
				request.setAttribute("message", "대여 실패");
			}

			request.setAttribute("kind", kind);
			request.setAttribute("library", library);
			request.setAttribute("search", search);
			request.setAttribute("curPage", curPage);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/book/bookRent.jsp");
	
			return actionFoward;
	}
}
