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
		int library=1;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		}catch (Exception e) {
		}

			SeatDAO seatDAO = new SeatDAO();
			ArrayList<SeatDTO> ar= new ArrayList<>();
			try {
				ar = seatDAO.selectList(library);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("seat", ar);
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatAjax_1.jsp");
		
		
		
		return actionFoward;
	}

}
