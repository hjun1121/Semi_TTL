package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class AdminBookOrderNOService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		String cancel = request.getParameter("cancel");
		if(cancel==null){
			cancel="구냥";
		}
		
		Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
		Book_OrderDTO book_OrderDTO = new Book_OrderDTO();
		
		int result =0;
		try {
			
			book_OrderDTO = book_OrderDAO.selectOne(num);
			result = book_OrderDAO.updateAdminCancel(num, cancel);
			result = book_OrderDAO.updateAdmin(num, 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "거절 실패";
		String path = "../index.jsp";
		if(result>0) {
			message = num+"번 신청 거절";
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
