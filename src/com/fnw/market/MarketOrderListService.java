package com.fnw.market;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class MarketOrderListService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Market_OrderDTO> list = new ArrayList<>();
		
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
		}
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
		}
		int curPage = 0;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			curPage = 1;
		}
		
		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search = request.getParameter("search");
		if(search==null) {
			search="";
		}
		
		if(memberDTO == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
			
			int totalCount = 1;
			Market_OrderDAO market_OrderDAO = new Market_OrderDAO();
			try {
				totalCount = market_OrderDAO.getTotalCount(kind, search);
				if(totalCount==0) {
					totalCount=1;
				}
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				list = market_OrderDAO.selectList(id,pageMaker.getMakeRow(),kind,search);
				request.setAttribute("size", list.size());
				request.setAttribute("marketOrderList", list);
				request.setAttribute("id", id);
				request.setAttribute("search", search);
				request.setAttribute("kind", kind);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("ln", ln);
			request.setAttribute("library", library);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/market/marketOrderList.jsp");
			
		}
		
		return actionFoward;
	}

}
