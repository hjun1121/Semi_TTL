package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;


public class BookOrderOkAdminService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		System.out.println(num);
		Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
		Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
		Book_OrderDTO book_OrderDTO = new Book_OrderDTO();
	
		int result =0;
		try {
			book_OrderDTO = book_OrderDAO.selectOne(num);
			
			result = book_TotalDAO.insert(book_OrderDTO);
			result = book_OrderDAO.updateAdmin(num, 2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "승인 실패";
		String path = "../index.jsp";
		if(result>0) {
			message = num+"번 신청 승인";
			path = "./bookOrderListAdmin.book";
		}else {
			
		}
		
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionFoward;
	}

}
