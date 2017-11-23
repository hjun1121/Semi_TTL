package com.fnw.market;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class MarketTotalViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
		
		ArrayList<Book_Buy_WishDTO> ar = new ArrayList<>();
		try {
			ar = new Book_Buy_WishDAO().selectList(id);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
			// TODO: handle exception
		}
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int num = 1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		if(request.getSession().getAttribute("member") ==null ) {
			request.setAttribute("message", "로그인후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
			
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		Market_TotalDTO market_TotalDTO = new Market_TotalDTO();
		try {
			market_TotalDTO = market_TotalDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("dto", market_TotalDTO);
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/marketTotalView.jsp");
		}

		request.setAttribute("rent_wish_list", ar);
		request.setAttribute("library", library);
		request.setAttribute("num", num);
		request.setAttribute("curPage", curPage);
	
		request.setAttribute("ln", ln);
		return actionFoward;
	}

}
