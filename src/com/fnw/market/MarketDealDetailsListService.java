package com.fnw.market;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class MarketDealDetailsListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Market_Deal_DetailsDTO> list = new ArrayList<>();
		String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
		
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int type = 3;
		try {
			type = Integer.parseInt(request.getParameter("type"));
		} catch (Exception e) {
		}
		
		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e) {
			curPage=1;
		}
		
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
		Market_Deal_DetailsDAO market_Deal_DetailsDAO = new Market_Deal_DetailsDAO();
	
		if(type==1) {
			try {
				totalCount = market_Deal_DetailsDAO.getTotalCount(p_date,type);
				if(totalCount==0) {
					totalCount=1;
				}
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				list = market_Deal_DetailsDAO.selectList(id,pageMaker.getMakeRow(), p_date,type);
				request.setAttribute("size", list.size());
				request.setAttribute("type", type);
				request.setAttribute("bookDeals", list);
				request.setAttribute("id", id);
				request.setAttribute("year", year);
				request.setAttribute("month", month);
				request.setAttribute("day", day);
				request.setAttribute("page", pageMaker.getMakePage());
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/market/marketDealsList.jsp");
		}else if(type==2) {
			try {
				totalCount = market_Deal_DetailsDAO.getTotalCount(p_date,type);
				if(totalCount==0) {
					totalCount=1;
				}
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				list = market_Deal_DetailsDAO.selectList(id,pageMaker.getMakeRow(), p_date,type);
				request.setAttribute("size", list.size());
				request.setAttribute("type", type);
				request.setAttribute("bookDeals", list);
				request.setAttribute("id", id);
				request.setAttribute("year", year);
				request.setAttribute("month", month);
				request.setAttribute("day", day);
				request.setAttribute("page", pageMaker.getMakePage());
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/market/marketDealsList.jsp");
		}else if(type==3){
			try {
				totalCount = market_Deal_DetailsDAO.getTotalCount(p_date);
				if(totalCount==0) {
					totalCount=1;
				}
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				list = market_Deal_DetailsDAO.selectList(id,pageMaker.getMakeRow(), p_date);
				request.setAttribute("size", list.size());
				request.setAttribute("type", type);
				request.setAttribute("bookDeals", list);
				request.setAttribute("id", id);
				request.setAttribute("year", year);
				request.setAttribute("month", month);
				request.setAttribute("day", day);
				request.setAttribute("page", pageMaker.getMakePage());
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/market/marketDealsList.jsp");
		}
		request.setAttribute("library", library);
		return actionFoward;
	}

}
