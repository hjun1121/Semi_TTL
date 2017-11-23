package com.fnw.seat;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class SeatList1AjaxService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		int ln = 0;
		try {
			ln = Integer.parseInt(request.getParameter("ln"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int library=1;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		}catch (Exception e) {
		}

		SeatDAO seatDAO = new SeatDAO();

		try {
			int cnt = seatDAO.count(1, library);
			int cntAll = seatDAO.countAll(1, library);

			int cnt2 = seatDAO.count(2, library);
			int cntAll2 = seatDAO.countAll(2, library);

			int cnt3 = seatDAO.count(3, library);
			int cntAll3 = seatDAO.countAll(3, library);
			request.setAttribute("cnt", cnt);
			request.setAttribute("cntAll", cntAll);
			request.setAttribute("cnt2", cnt2);
			request.setAttribute("cntAll2", cntAll2);
			request.setAttribute("cnt3", cnt3);
			request.setAttribute("cntAll3", cntAll3);
		} catch (Exception e) {
			e.printStackTrace();
		}


		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/seat/seatAjax_1.jsp");



		request.setAttribute("ln", ln);
		return actionFoward;
	}

}
