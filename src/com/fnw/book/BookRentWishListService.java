package com.fnw.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
/*import com.fnw.book.Book_Buy_WishDAO;*/
import com.fnw.util.PageMaker;

public class BookRentWishListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();
		ArrayList<Book_Rent_WishDTO> list = new ArrayList<>();
		
		HttpSession session = null;
		MemberDTO memberDTO = null;
		try {
			session = request.getSession();
			memberDTO =  (MemberDTO)session.getAttribute("member");
		}catch (Exception e) {
		}
		
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
		
		if(memberDTO == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {

		
			String id = request.getParameter("id");
			int totalCount = 0;
			
			
			
			
			try {
				totalCount = book_Rent_WishDAO.getTotalCount(kind, search);
				if(totalCount==0) {
					totalCount=1;
				}
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				list = book_Rent_WishDAO.selectList(id,pageMaker.getMakeRow(),kind,search);
				request.setAttribute("size", list.size());
				request.setAttribute("id", id);
				request.setAttribute("bookRentWishList", list);
				request.setAttribute("id", id);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
				} catch (Exception e) {
					e.printStackTrace();
			}
			request.setAttribute("library", library);
			request.setAttribute("ln", ln);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/book/bookRentWishList.jsp");
			
		}
		return actionFoward;
	}
}