package com.fnw.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class BookInformationService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Book_Rent_WishDTO> ar = new ArrayList<>();
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
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int num = 1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			ar = book_Rent_WishDAO.selectList(id);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
		Book_TotalDTO book_TotalDTO = new Book_TotalDTO();

		try {
			book_TotalDTO = book_TotalDAO.selectOne(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("book", book_TotalDTO);
		request.setAttribute("rent_wish_list", ar);
		request.setAttribute("curPage", curPage);
		request.setAttribute("num", num);
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/book/bookInformation.jsp");

		return actionFoward;
	}
}