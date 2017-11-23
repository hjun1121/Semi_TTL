package com.fnw.seat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class SeatDetailsListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Seat_DetailsDTO> list = new ArrayList<>();

		HttpSession session = null;
		MemberDTO memberDTO = null;
		try {
			session = request.getSession();
			memberDTO =  (MemberDTO)session.getAttribute("member");
		}catch (Exception e) {
		}
		String id = "";
		if(memberDTO != null) {
			id = memberDTO.getId();
		}

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
		}
		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e) {
			curPage=1;
		}
		

		if(memberDTO == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
		
			SimpleDateFormat sdf = new SimpleDateFormat("yy");
	        Calendar c1 = Calendar.getInstance();
	        String strToday = sdf.format(c1.getTime());
	
			String year = request.getParameter("year");
			if(year == null) {
				year=strToday;
			}
			
			sdf = new SimpleDateFormat("MM");
	        c1 = Calendar.getInstance();
	        strToday = sdf.format(c1.getTime());
			String month = request.getParameter("month");
			if(month == null) {
				month=strToday;
			}		
			
			sdf = new SimpleDateFormat("dd");
	        c1 = Calendar.getInstance();
	        strToday = sdf.format(c1.getTime());
			String day = request.getParameter("day");
			if(day == null) {
				day=strToday;
			}	
			String p_date = year+"/"+month+"/"+day;
			
			int totalCount=0;
			Seat_DetailsDAO seat_DetailsDAO = new Seat_DetailsDAO();
			
			try {
				totalCount = seat_DetailsDAO.getTotalCount(p_date);
				if(totalCount==0) {
					totalCount=1;
				}
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				list = seat_DetailsDAO.selectList(id,pageMaker.getMakeRow(), p_date);
				request.setAttribute("size", list.size());
				request.setAttribute("seatList", list);
				request.setAttribute("id", id);
				request.setAttribute("year", year);
				request.setAttribute("month", month);
				request.setAttribute("day", day);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("library", library);
			request.setAttribute("ln", ln);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/seat/seatTotalList.jsp");
		}	
		return actionFoward;
	}

}
