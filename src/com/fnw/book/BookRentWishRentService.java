package com.fnw.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.library.LibraryDAO;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class BookRentWishRentService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();
		LibraryDAO libraryDAO = new LibraryDAO();
		ArrayList<Book_Rent_WishDTO> list = new ArrayList<>();

		int curPage = 0;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			curPage = 1;
		}

		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search = request.getParameter("search");
		if(search==null) {
			search="";
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

		int totalCount = 0;
		int result = 0;

		try {
			totalCount = book_Rent_WishDAO.getTotalCount(kind, search);
			Book_TotalDTO book_TotalDTO = new Book_TotalDTO();
			Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
			Book_Rent_DetailsDAO book_Rent_DetailsDAO = new Book_Rent_DetailsDAO();
			book_TotalDTO = book_TotalDAO.selectOne(num);
			result = libraryDAO.bookRent(book_TotalDTO, rent_id);
			book_Rent_DetailsDAO.insert(book_TotalDTO, rent_id);
			book_Rent_WishDAO.stateUpdate(num);
			if(totalCount==0) {
				totalCount=1;
			}
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			list = book_Rent_WishDAO.selectList(rent_id,pageMaker.getMakeRow(),kind,search);
			request.setAttribute("id", rent_id);
			request.setAttribute("bookRentWishList", list);
			request.setAttribute("id", rent_id);
			request.setAttribute("page", pageMaker.getMakePage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			request.setAttribute("message", "대여 완료");
			request.setAttribute("path", "../book/bookRentWishList.book?id="+rent_id);
		}else {
			request.setAttribute("message", "대여 실패");
			request.setAttribute("path", "../book/bookRentWishList.book?id="+rent_id);
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		return actionFoward;
	}
}
