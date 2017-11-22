package com.fnw.library;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.book.Book_Rent_WishDAO;
import com.fnw.book.Book_Rent_WishDTO;
import com.fnw.book.Book_TotalDTO;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class LibraryBookSearchService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {

		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Book_TotalDTO> ar = new ArrayList<>();
		ArrayList<Book_Rent_WishDTO> rent_wish_ar = new ArrayList<>();
		LibraryDAO libraryDAO = new LibraryDAO();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();

		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		////id 받아오기
		HttpSession session = null;
		String id = null;
		try {
			session = request.getSession();
			id = ((MemberDTO)session.getAttribute("member")).getId();
			if(id == null) {
				id = "";
			}
		}catch (Exception e) {
		}
		try {
			rent_wish_ar = book_Rent_WishDAO.selectList(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
			request.setAttribute("rent_wish_list", rent_wish_ar);
			request.setAttribute("library", library);
			request.setAttribute("curPage", curPage);
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
