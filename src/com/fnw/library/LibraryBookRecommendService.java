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

public class LibraryBookRecommendService implements Action{

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		LibraryDAO libraryDAO = new LibraryDAO();
		ArrayList<Book_TotalDTO> ar = new ArrayList<>();
		ArrayList<Book_Rent_WishDTO> rent_wish_list = new ArrayList<>();
		
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
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			rent_wish_list = new Book_Rent_WishDAO().selectList(id);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int library = 1;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			ar = libraryDAO.bookRecommend(library);
			request.setAttribute("curPage", curPage);
			request.setAttribute("list", ar);
			request.setAttribute("rent_wish_list", rent_wish_list);
			request.setAttribute("library", library);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/library/libraryBookRecommend.jsp");

		return actionFoward;
	}
	
}
