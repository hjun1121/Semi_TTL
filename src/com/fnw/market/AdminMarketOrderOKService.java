package com.fnw.market;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.util.DBConnector;

public class AdminMarketOrderOKService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
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
		int num = 0;
		int state = 1;
		int price = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			state = Integer.parseInt(request.getParameter("state"));
			price = Integer.parseInt(request.getParameter("price"));
		}catch (Exception e) {
		}
		Market_OrderDAO market_OrderDAO = new Market_OrderDAO();
		Market_TotalDAO market_TotalDAO = new Market_TotalDAO();
		Market_OrderDTO market_OrderDTO = new Market_OrderDTO();
		int result =0;
		Connection con = null;
		try {
			con = DBConnector.getConnect();
			con.setAutoCommit(false);
			market_OrderDTO = market_OrderDAO.selectOne(num);
			double Aprice = (state*20);
			Aprice = Aprice/100;
			Aprice = 1-Aprice;
			Aprice = price*Aprice;
			
			Market_Deal_DetailsDAO market_Deal_DetailsDAO = new Market_Deal_DetailsDAO();
			result = market_Deal_DetailsDAO.insert(market_OrderDTO,state,Aprice, con);
			result = market_TotalDAO.insert(market_OrderDTO,state,Aprice,con);
			result = market_OrderDAO.updateAdmin(num, 10);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback();
				result=0;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				con.setAutoCommit(true);
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		String message = "승인 실패";
		String path = "../index.jsp";
		if(result>0) {
			message = num+"번 신청 승인";
			path = "./marketOrderAdmin.market";
		}else {
			
		}
		request.setAttribute("library", library);
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		
		request.setAttribute("ln", ln);
		return actionFoward;
	}

}
