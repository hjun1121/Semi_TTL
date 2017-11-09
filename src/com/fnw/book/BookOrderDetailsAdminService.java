package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.book.Book_OrderDAO;
import com.fnw.book.Book_OrderDTO;

public class BookOrderDetailsAdminService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
		int num =0;
		try {
		num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			
		}
		Book_OrderDTO book_OrderDTO=null;
		try {
			book_OrderDTO=book_OrderDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//boardDTO가 Null이면 다른 곳으로 처리
		
		request.setAttribute("view", book_OrderDTO);
		request.setAttribute("book", "book");
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/book/bookOrderDetailsAdmin.jsp");
		
		return actionFoward;
	}

}
