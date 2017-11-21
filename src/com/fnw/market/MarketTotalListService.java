package com.fnw.market;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class MarketTotalListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Buy_WishDAO book_Buy_WishDAO = new Book_Buy_WishDAO();
		ArrayList<Book_Buy_WishDTO> buy_wish_list = new ArrayList<>();
		
		////id 받아오기
		HttpSession session = null;
		String id = null;
		try {
			session = request.getSession();
			id = ((MemberDTO)session.getAttribute("member")).getId();
			if(id == null) {
				id = "";
			}
		}catch (Exception e) {
		}	
		int curPage = 1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
		}
		
		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search = request.getParameter("search");
		if(search==null) {
			search="";
		}
		
		
		int totalCount =0;
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		ArrayList<Market_TotalDTO> ar = new ArrayList<>();
		try {
			buy_wish_list = book_Buy_WishDAO.selectList(id);
			request.setAttribute("curPage", curPage);
			request.setAttribute("buy_wish_list", buy_wish_list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			totalCount = market_TotalDAO.getTotalCount();
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			ar = market_TotalDAO.selectList(pageMaker.getMakeRow(), kind, search);
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("curPage", curPage);
			request.setAttribute("kind", kind);
			request.setAttribute("search", search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/marketTotalList.jsp");
		return actionFoward;
	}

}
