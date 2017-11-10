package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;



public class AdminBookOrderOKService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		String type = request.getParameter("type");
		if(type==null){
			type="총류";
		}
		
		Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
		Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
		Book_OrderDTO book_OrderDTO = new Book_OrderDTO();
		Book_TotalDTO book_TotalDTO = new Book_TotalDTO();
		
		int result =0;
		try {
			
			book_OrderDTO = book_OrderDAO.selectOne(num);
			
			
			
			
			book_TotalDTO.setTitle(book_OrderDTO.getTitle());
			book_TotalDTO.setWriter(book_OrderDTO.getWriter());
			book_TotalDTO.setCompany(book_OrderDTO.getCompany());
			book_TotalDTO.setPublish_date(book_OrderDTO.getPublish_date());
			book_TotalDTO.setSection("123");
			book_TotalDTO.setLibrary(book_OrderDTO.getLibrary());
			book_TotalDTO.setType(type);
			book_TotalDTO.setState(book_OrderDTO.getState());
	
			
			
			
			
			result = book_TotalDAO.insert(book_TotalDTO);
			
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


