package com.fnw.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.book.Book_OrderDAO;
import com.fnw.book.Book_OrderDTO;
import com.fnw.util.PageMaker;

public class AdminBookOrderListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
		
		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
		}
		
		int state = 3;
		try {
			state = Integer.parseInt(request.getParameter("state"));
		}catch (Exception e) {
			
		}
		System.out.println("state"+state);
		
		int totalCount=0;
		if(state==0) {
			try {
				totalCount = book_OrderDAO.getTotalCount(state);
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				List<Book_OrderDTO> ar = book_OrderDAO.selectList(pageMaker.getMakeRow(),state);
				request.setAttribute("size", ar.size());
				request.setAttribute("orderList", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/admin/admin_bookOrderList.jsp");
		}else if(state==1) {
			try {
				totalCount = book_OrderDAO.getTotalCount(state);
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				List<Book_OrderDTO> ar = book_OrderDAO.selectList(pageMaker.getMakeRow(),state);
				request.setAttribute("size", ar.size());
				request.setAttribute("orderList", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/admin/admin_bookOrderList.jsp");
		} else {
			try {
				totalCount = book_OrderDAO.getTotalCount();
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				List<Book_OrderDTO> ar = book_OrderDAO.selectList(pageMaker.getMakeRow());
				request.setAttribute("size", ar.size());
				request.setAttribute("orderList", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/admin/admin_bookOrderList.jsp");
		}
		
		return actionFoward;
	
	}

}
