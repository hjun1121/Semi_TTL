package com.fnw.library;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.book.Book_TotalDTO;
import com.fnw.util.PageMaker;

public class LibraryBookSearchService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {

		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Book_TotalDTO> ar = new ArrayList<>();
		
		LibraryDAO libraryDAO = new LibraryDAO();

		int library = 1;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int curPage = 1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));			
		} catch (Exception e) {
			// TODO: handle exception
		}
		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search=request.getParameter("search");
		if(search==null) {
			search="";
		}
		int totalCount = 0;
		try {
			totalCount = libraryDAO.getTotalCount(kind, search, library);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			ar = libraryDAO.selectList(pageMaker.getMakeRow(), kind, search, library);
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("kind", kind);
			request.setAttribute("search", search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/library/libraryBookSearch.jsp");
		
		return actionFoward;
	}
}
