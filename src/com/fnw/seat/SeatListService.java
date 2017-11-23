package com.fnw.seat;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class SeatListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
		}

		if(method.equals("GET")) {
			
			int cnt = 0;
			int cntAll = 0;
			int cnt2 = 0;
			int cntAll2 = 0;
			int cnt3 = 0;
			int cntAll3 = 0;
			int cnta=0;
			int cntAlla=0;
			SeatDAO seatDAO = new SeatDAO();
			
			for(int i=1; i<5; i++ ) {
				try {
					cnt = seatDAO.count(1, i);
					cntAll = seatDAO.countAll(1, i);
					cnt2 = seatDAO.count(2, i);
					cntAll2 = seatDAO.countAll(2, i);
					cnt3 = seatDAO.count(3, i);
					cntAll3 = seatDAO.countAll(3, i);
					cnta = cnt+cnt2+cnt3;
					cntAlla = cntAll+cntAll2+cntAll3;
					request.setAttribute("cnta"+i, cnta);
					request.setAttribute("cntAlla"+i, cntAlla);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatList.jsp");
			
		}else {
			SeatDAO seatDAO = new SeatDAO();
			ArrayList<SeatDTO> ar = new ArrayList<>();
			
			try {
				ar = seatDAO.selectList(library);
				int cnt1 = seatDAO.countAll(1, library);
				int cnt2 = cnt1 + seatDAO.countAll(2, library);
				int cnt3 = cnt2 + seatDAO.countAll(3, library);
				request.setAttribute("cnt1", cnt1);
				request.setAttribute("cnt2", cnt2);
				request.setAttribute("cnt3", cnt3);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("list", ar);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatView.jsp");
		}

		return actionFoward;
	}
}
