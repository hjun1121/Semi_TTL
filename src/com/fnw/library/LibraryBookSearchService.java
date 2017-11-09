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
		int curPage=1;
		int totalCount=0;

		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search=request.getParameter("search");
		if(search==null) {
			search="";
		}

		try {
			library = Integer.parseInt(request.getParameter("library"));
			curPage=Integer.parseInt(request.getParameter("curPage"));
			totalCount = libraryDAO.getTotalCount(kind, search, library);
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			ar = libraryDAO.selectList(pageMaker.getMakeRow(), kind, search, library);
			///////////
			System.out.println(ar.get(0).getTitle());
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("kind", kind);
			request.setAttribute("search", search);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/library/libraryBookSearch.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return actionFoward;
	}
}
