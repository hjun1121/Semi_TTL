package com.fnw.seat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class SeatCancelService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();

		Seat_DetailsDAO seat_DetailsDAO = new Seat_DetailsDAO();
		int result = 0;
		try {
			result = seat_DetailsDAO.seatCancel(Integer.parseInt(request.getParameter("seat_num")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0) {
			request.setAttribute("message", "취소 완료");
			request.setAttribute("path", "./seatTotalList.seat?id="+id);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatTotalList.jsp");
		}else {
			request.setAttribute("message", "취소 실패");
			request.setAttribute("path", "./seatTotalList.seat?id="+id);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatTotalList.jsp");
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		return actionFoward;
	}

}
