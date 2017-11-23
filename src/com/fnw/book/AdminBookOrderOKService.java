package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;



public class AdminBookOrderOKService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
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
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		String type = request.getParameter("type");
		if(type==null){
			type="총류";
		}
		
		String pos="";
		if(type.equals("총류"))
		{
			pos="a";
		}
		else if(type.equals("철학"))
		{
			pos="b";
		}
		else if(type.equals("종교"))
		{
			pos="c";
		}
		else if(type.equals("사회과학"))
		{
			pos="d";
		}else if(type.equals("자연과학"))
		{
			pos="e";
		}else if(type.equals("기술과학"))
		{
			pos="f";
		}else if(type.equals("예술"))
		{
			pos="g";
		}else if(type.equals("언어"))
		{
			pos="h";
		}else if(type.equals("문학"))
		{
			pos="i";
		}else if(type.equals("역사"))
		{
			pos="j";
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
			book_TotalDTO.setSection(pos+".100"+book_OrderDTO.getNum());
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
		request.setAttribute("library", library);
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		
		request.setAttribute("ln", ln);
		return actionFoward;
	}
}


