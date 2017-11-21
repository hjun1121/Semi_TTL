package com.fnw.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MarketBuyService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		int num = 1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		Market_TotalDTO market_TotalDTO = new Market_TotalDTO();
		try {
			market_TotalDTO = market_TotalDAO.selectOne(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int price = 100;
		try {
			price = Integer.parseInt(request.getParameter("price"));
		} catch (Exception e) {
		}
		
		int delivery=1;
		try {
			delivery= Integer.parseInt(request.getParameter("delivery"));
		} catch (Exception e) {
		}
		
		if(delivery==2) {
			price = price+2500;
		}
		
		Market_Deal_DetailsDTO market_Deal_DetailsDTO = new Market_Deal_DetailsDTO();
		market_Deal_DetailsDTO.setNum(num);
		market_Deal_DetailsDTO.setTitle(request.getParameter("title"));
		market_Deal_DetailsDTO.setWriter(request.getParameter("writer"));
		market_Deal_DetailsDTO.setCompany(request.getParameter("company"));
		market_Deal_DetailsDTO.setPublish_date(request.getParameter("publish_date"));
		market_Deal_DetailsDTO.setId(request.getParameter("id"));
		market_Deal_DetailsDTO.setPrice(price);
		market_Deal_DetailsDTO.setLibrary(Integer.parseInt(request.getParameter("library")));
		market_Deal_DetailsDTO.setKind(1);
		market_Deal_DetailsDTO.setDelivery(delivery);
		market_Deal_DetailsDTO.setPostCode(request.getParameter("postCode"));
		market_Deal_DetailsDTO.setAddr(request.getParameter("addr"));
		market_Deal_DetailsDTO.setAddr2(request.getParameter("addr2"));
		
		request.setAttribute("mddDTO", market_Deal_DetailsDTO);
		request.setAttribute("dto", market_TotalDTO);
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/market/marketBuy.jsp");
		
		return actionFoward;
	}

}
