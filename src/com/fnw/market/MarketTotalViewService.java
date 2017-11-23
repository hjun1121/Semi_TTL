package com.fnw.market;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class MarketTotalViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
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
		
		ArrayList<Book_Buy_WishDTO> ar = new ArrayList<>();
		try {
			ar = new Book_Buy_WishDAO().selectList(id);
		} catch (Exception e1) {
			e1.printStackTrace();
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
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
		}
		int num = 1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		if(memberDTO == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
			
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		Market_TotalDTO market_TotalDTO = new Market_TotalDTO();
		try {
			market_TotalDTO = market_TotalDAO.selectOne(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
			request.setAttribute("rent_wish_list", ar);
			request.setAttribute("library", library);
			request.setAttribute("num", num);
			request.setAttribute("curPage", curPage);
			request.setAttribute("ln", ln);
		
			request.setAttribute("dto", market_TotalDTO);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/market/marketTotalView.jsp");
		}

		return actionFoward;
	}

}
