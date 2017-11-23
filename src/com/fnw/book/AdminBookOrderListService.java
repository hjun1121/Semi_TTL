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
		
		int totalCount=0;
		if(state==1) {
			try {
				totalCount = book_OrderDAO.getTotalCount(state);
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				List<Book_OrderDTO> ar = book_OrderDAO.selectList(pageMaker.getMakeRow(),state);
				request.setAttribute("size", ar.size());
				request.setAttribute("library", library);
				request.setAttribute("orderList", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/admin/admin_bookOrderList.jsp");
		}else if(state==0) {
			try {
				totalCount = book_OrderDAO.getTotalCount(state);
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				List<Book_OrderDTO> ar = book_OrderDAO.selectList(pageMaker.getMakeRow(),state);
				request.setAttribute("size", ar.size());
				request.setAttribute("library", library);
				request.setAttribute("orderList", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/admin/admin_bookOrderList.jsp");
		} else if(state==2) {
			try {
				totalCount = book_OrderDAO.getTotalCount(state);
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				List<Book_OrderDTO> ar = book_OrderDAO.selectList(pageMaker.getMakeRow(),state);
				request.setAttribute("size", ar.size());
				request.setAttribute("library", library);
				request.setAttribute("orderList", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
				
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
				request.setAttribute("library", library);
				request.setAttribute("orderList", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/admin/admin_bookOrderList.jsp");
		}
		System.out.println("adminList");
		
		request.setAttribute("ln", ln);
		return actionFoward;
	
	}

}
