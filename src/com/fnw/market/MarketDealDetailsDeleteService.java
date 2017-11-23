package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class MarketDealDetailsDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();

		Market_Deal_DetailsDAO market_Deal_DetailsDAO = new Market_Deal_DetailsDAO();
		String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
		
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
			// TODO: handle exception
		}
		int result = 0;
		try {
			result = market_Deal_DetailsDAO.delete(Integer.parseInt(request.getParameter("num")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0) {
			request.setAttribute("message", "삭제 완료");
			request.setAttribute("path", "./marketDealsList.market?curPage=1&id="+id);
		}else {
			request.setAttribute("message", "삭제 실패");
			request.setAttribute("path", "./marketDealsList.market?curPage=1&id="+id);
		}
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		request.setAttribute("ln", ln);
		return actionFoward;
	}
}
