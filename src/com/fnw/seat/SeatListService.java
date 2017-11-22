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
			// TODO: handle exception
		}

		if(method.equals("POST")) {
			SeatDAO seatDAO = new SeatDAO();
			ArrayList<SeatDTO> ar = new ArrayList<>();
			ArrayList<SeatDTO> ar1 = new ArrayList<>();
			ArrayList<SeatDTO> ar2 = new ArrayList<>();
			ArrayList<SeatDTO> ar3 = new ArrayList<>();
			ArrayList<SeatDTO> ar4 = new ArrayList<>();
			try {
				ar = seatDAO.selectList(library);
				ar1 = seatDAO.selectList(1);
				ar2 = seatDAO.selectList(2);
				ar3 = seatDAO.selectList(3);
				ar4 = seatDAO.selectList(4);

				int cnt = 0;
				int cntAll = 0;
				
				int cnt2 = 0;
				int cntAll2 = 0;
				
				int cnt3 = 0;
				int cntAll3 = 0;
				
				int cnta = cnt+cnt2+cnt3;
				int cntAlla = cntAll+cntAll2+cntAll3;
				request.setAttribute("cnta", cnta);
				request.setAttribute("cntAlla", cntAlla);
				
				for(int i=1; i<5; i++ ) {
					cnt = seatDAO.count(1, i);
					cntAll = seatDAO.countAll(1, i);
					
					cnt2 = seatDAO.count(2, i);
					cntAll2 = seatDAO.countAll(2, i);
					
					cnt3 = seatDAO.count(3, i);
					cntAll3 = seatDAO.countAll(3, i);
					
					cnt = cnt+cnt2+cnt3;
					cntAlla = cntAll+cntAll2+cntAll3;
					
					request.setAttribute("cnta"+i, cnta);
					request.setAttribute("cntAlla"+i, cntAlla);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("seat", ar);
			request.setAttribute("seat1", ar1);
			request.setAttribute("seat2", ar2);
			request.setAttribute("seat3", ar3);
			request.setAttribute("seat4", ar4);
			request.setAttribute("library", library);

			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatList.jsp");
		}else {
			SeatDAO seatDAO = new SeatDAO();
			ArrayList<SeatDTO> ar = new ArrayList<>();
			try {
				ar = seatDAO.selectList(library);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("library", library);
			request.setAttribute("seat", ar);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatView.jsp");
		}

		return actionFoward;
	}
}
