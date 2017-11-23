package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDAO;
import com.fnw.member.MemberDTO;

public class BookBuyFinishService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		HttpSession session = request.getSession();
		String id = ((MemberDTO)session.getAttribute("member")).getId();
		
		int ln = 0;
		try {
			ln = Integer.parseInt(request.getParameter("ln"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Market_Deal_DetailsDTO market_Deal_DetailsDTO = null;
		Market_Deal_DetailsDAO market_Deal_DetailsDAO = new Market_Deal_DetailsDAO();
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = null;
		try {
			memberDTO = memberDAO.selectOne(id);
			market_Deal_DetailsDTO = market_Deal_DetailsDAO.selectOne(Integer.parseInt(request.getParameter("num")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("member", memberDTO);
		request.setAttribute("mdd", market_Deal_DetailsDTO);
		
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/bookBuyFinish.jsp");
		request.setAttribute("ln", ln);
		return actionFoward;
	}
}
