package com.fnw.market;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.util.PageMaker;

public class BookBuyWishListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Buy_WishDAO book_Buy_WishDAO = new Book_Buy_WishDAO();
		ArrayList<Book_Buy_WishDTO> list = new ArrayList<>();
		
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			curPage = 1 ;
		}
		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search = request.getParameter("search");
		if(search==null) {
			search="";
		}
		
		String id = request.getParameter("id");
		int totalCount = 0;
		try {
			totalCount = book_Buy_WishDAO.getTotalCount(kind, search);
			if(totalCount==0) {
				totalCount = 1;
			}
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			list = book_Buy_WishDAO.selectList(id,pageMaker.getMakeRow(),kind,search);
			request.setAttribute("size", list.size());
			request.setAttribute("bookBuyWishList", list);
			request.setAttribute("id", id);
			request.setAttribute("page", pageMaker.getMakePage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/bookBuyWishList.jsp");
		return actionFoward;
	}
}