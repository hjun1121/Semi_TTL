package com.fnw.market;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.market.Market_OrderDTO;
import com.fnw.member.MemberDTO;
import com.fnw.market.Market_OrderDAO;
import com.fnw.util.PageMaker;

public class AdminMarketOrderListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Market_OrderDAO market_OrderDAO = new Market_OrderDAO();

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
		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e1) {
		}

		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search=request.getParameter("search");
		if(search==null) {
			search="";
		}

		if(memberDTO == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else if(memberDTO.getKind() != 10){
			request.setAttribute("ln", ln);
			request.setAttribute("message", "접근 권한이 없습니다.");
			request.setAttribute("path", "../index.jsp");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
		
			int totalCount=0;
			try {
				totalCount = market_OrderDAO.getTotalCount(kind, search);
				PageMaker pageMaker = new PageMaker(curPage, totalCount);
				List<Market_OrderDTO> ar=market_OrderDAO.selectList(pageMaker.getMakeRow(), 1);
				request.setAttribute("size", ar.size());
				request.setAttribute("list", ar);
				request.setAttribute("page", pageMaker.getMakePage());
				request.setAttribute("curPage", curPage);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			request.setAttribute("library", library);
			request.setAttribute("ln", ln);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/admin/admin_MarketOrder_List.jsp");
		}
		
		return actionFoward;
	}
}
