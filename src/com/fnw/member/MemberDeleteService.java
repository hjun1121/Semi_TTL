package com.fnw.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.book.Book_OrderDAO;
import com.fnw.book.Book_Rent_DetailsDAO;
import com.fnw.book.Book_Rent_DetailsDTO;
import com.fnw.book.Book_Rent_WishDAO;
import com.fnw.book.Book_TotalDAO;
import com.fnw.market.Book_Buy_WishDAO;
import com.fnw.market.Market_Deal_DetailsDAO;
import com.fnw.market.Market_OrderDAO;
import com.fnw.market.Market_TotalDAO;
import com.fnw.qna.QnaDAO;
import com.fnw.qnaReply.Qna_ReplyDAO;
import com.fnw.seat.SeatDAO;
import com.fnw.seat.Seat_DetailsDAO;

public class MemberDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String memberid = request.getParameter("id");
		
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
		
		MemberDAO memberDAO = new MemberDAO();
		Book_Buy_WishDAO book_Buy_WishDAO = new Book_Buy_WishDAO();
		Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();
		Book_TotalDAO book_TotalDAO = new Book_TotalDAO();
		Market_Deal_DetailsDAO market_Deal_DetailsDAO = new Market_Deal_DetailsDAO();
		Market_OrderDAO market_OrderDAO = new Market_OrderDAO();
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		QnaDAO qnaDAO = new QnaDAO();
		Qna_ReplyDAO qna_ReplyDAO = new Qna_ReplyDAO();
		SeatDAO seatDAO = new SeatDAO();
		Seat_DetailsDAO seat_DetailsDAO = new Seat_DetailsDAO();
		
		int result  = 0;
		int check = 0;
		
		Book_Rent_DetailsDAO book_Rent_DetailsDAO = new Book_Rent_DetailsDAO();
		Book_Rent_DetailsDTO book_Rent_DetailsDTO = null;
		try {
			check = book_Rent_DetailsDAO.memDelOne(memberid);
			if(check > 0) {
				request.setAttribute("message", "책 반납해주세요");
				request.setAttribute("path", "../index.jsp");
			}else {
				result = memberDAO.delete(memberid);
				book_Buy_WishDAO.delete(memberid);
				book_OrderDAO.delete(memberid);
				book_Rent_WishDAO.delete(memberid);
				book_TotalDAO.update(memberid);
				market_Deal_DetailsDAO.delete(memberid);
				market_OrderDAO.delete(memberid);
				market_TotalDAO.delete(memberid);
				qnaDAO.update(memberid);
				qna_ReplyDAO.update(memberid);
				seatDAO.update(memberid);
				seat_DetailsDAO.delete(memberid);
				book_Rent_DetailsDAO.delete(memberid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0) {
			request.setAttribute("message", "탈퇴 완료");
			MemberDTO memberDTO =(MemberDTO)request.getSession().getAttribute("member");
			String id = memberDTO.getId();
			
			if(id.equals(request.getParameter("id"))) { // 본인이면
				request.setAttribute("path", "../index.jsp");
				request.getSession().invalidate();
			}else {//본인이 아니면
				request.setAttribute("path", "./memberList.member");
			}
			
		}else {
			if(check>0) {
				request.setAttribute("message", "책 반납해주세요");
				request.setAttribute("path", "../index.jsp");
			}else {
				request.setAttribute("message", "탈퇴 실패");
				request.setAttribute("path", "../index.jsp");
			}
		}
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		request.setAttribute("ln", ln);
		return actionFoward;
	}

}
