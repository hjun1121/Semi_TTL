package com.fnw.seat;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.DBConnector;
import com.fnw.util.PageMaker;

public class SeatOutService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();

		Seat_DetailsDAO seat_DetailsDAO = new Seat_DetailsDAO();
		SeatDAO seatDAO = new SeatDAO();
		int result = 0;
		int num = 0;
		Connection con = null;
		try {
			con = DBConnector.getConnect();
			con.setAutoCommit(false);
			num = Integer.parseInt(request.getParameter("num"));
			result = seat_DetailsDAO.seatUpdate(num,con);
			result = seatDAO.updateOut(Integer.parseInt(request.getParameter("seat_num")),con);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback();
				result=0;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				con.setAutoCommit(true);
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(result>0) {
			request.setAttribute("message", "퇴실 완료");
			request.setAttribute("path", "./seatTotalList.seat?id="+id);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatTotalList.jsp");
		}else {
			request.setAttribute("message", "퇴실 실패");
			request.setAttribute("path", "./seatTotalList.seat?id="+id);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatTotalList.jsp");
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		return actionFoward;
	}

}
