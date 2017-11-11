package com.fnw.book;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class BookReturnService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Rent_DetailsDAO book_Rent_DetailsDAO = new Book_Rent_DetailsDAO();
		Book_Rent_DetailsDTO book_Rent_DetailsDTO = null;
		int result = 0;
		HttpSession session = request.getSession();
		String id = ((MemberDTO)session.getAttribute("member")).getId();
		try {
			book_Rent_DetailsDTO = book_Rent_DetailsDAO.selectTime(Integer.parseInt(request.getParameter("num")));
		}catch (Exception e1) {
			e1.printStackTrace();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		String today = sdf.format(new Date());
		Date todayDate = null;
		try {
			todayDate = sdf.parse(today);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		long diff = todayDate.getTime() - (book_Rent_DetailsDTO.getIn_time()).getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);
		
		try {
			result = book_Rent_DetailsDAO.bookReturn(Integer.parseInt(request.getParameter("num")),diffDays);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0) {
			request.setAttribute("message", "반납 성공");
			request.setAttribute("path", "../book/bookRentList.book?id="+id);
		}else{
			request.setAttribute("message", "반납 실패");
			request.setAttribute("path", "../book/bookRentList.book?id="+id);
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionFoward;
	}
}