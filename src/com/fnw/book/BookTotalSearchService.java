package com.fnw.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class BookTotalSearchService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {

		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Book_TotalDTO> ar = new ArrayList<>();
		Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
		ArrayList<Book_Rent_WishDTO> rent_wish_list = new ArrayList<>();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();
		
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
			rent_wish_list = book_Rent_WishDAO.selectList(id);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
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
		int totalCount=0;
		try {
			totalCount = book_TotalDAO.getTotalCount(kind, search);
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			ar = book_TotalDAO.selectList(pageMaker.getMakeRow(), kind, search);
			request.setAttribute("rent_wish_list", rent_wish_list);
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("kind", kind);
			request.setAttribute("search", search);
			request.setAttribute("curPage", curPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/book/bookTotalSearch.jsp");

		return actionFoward;
	}
}