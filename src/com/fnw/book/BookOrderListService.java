package com.fnw.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;
import com.fnw.util.PageMaker;

public class BookOrderListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ArrayList<Book_OrderDTO> list = new ArrayList<>();
		
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
		
		
		int state = 3;
		try {
			state = Integer.parseInt(request.getParameter("state"));
		}catch (Exception e) {
			
		}

		if(memberDTO == null ) {
			request.setAttribute("ln", ln);
			request.setAttribute("message", "로그인 후 가능합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {

			int totalCount = 1;
			if(state==0) {
				Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
				try {
					totalCount = book_OrderDAO.getTotalCount(kind, search,state);
					if(totalCount==0) {
						totalCount=1;
					}
					PageMaker pageMaker = new PageMaker(curPage, totalCount);
					list = book_OrderDAO.selectList(id,pageMaker.getMakeRow(),kind,search,state);
					request.setAttribute("size", list.size());
					request.setAttribute("bookOrderList", list);
					request.setAttribute("id", id);
					request.setAttribute("search", search);
					request.setAttribute("kind", kind);
					request.setAttribute("curPage", curPage);
					request.setAttribute("page", pageMaker.getMakePage());
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/book/bookOrderList.jsp");
			}else if(state==1) {
				Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
				try {
					totalCount = book_OrderDAO.getTotalCount(kind, search,state);
					if(totalCount==0) {
						totalCount=1;
					}
					PageMaker pageMaker = new PageMaker(curPage, totalCount);
					list = book_OrderDAO.selectList(id,pageMaker.getMakeRow(),kind,search,state);
					request.setAttribute("size", list.size());
					request.setAttribute("bookOrderList", list);
					request.setAttribute("id", id);
					request.setAttribute("search", search);
					request.setAttribute("kind", kind);
					request.setAttribute("curPage", curPage);
					request.setAttribute("page", pageMaker.getMakePage());
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/book/bookOrderList.jsp");
			}else if(state==2) {
				Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
				try {
					totalCount = book_OrderDAO.getTotalCount(kind, search,state);
					if(totalCount==0) {
						totalCount=1;
					}
					PageMaker pageMaker = new PageMaker(curPage, totalCount);
					list = book_OrderDAO.selectList(id,pageMaker.getMakeRow(),kind,search,state);
					request.setAttribute("bookOrderList", list);
					request.setAttribute("size", list.size());
					request.setAttribute("id", id);
					request.setAttribute("search", search);
					request.setAttribute("kind", kind);
					request.setAttribute("curPage", curPage);
					request.setAttribute("page", pageMaker.getMakePage());
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/book/bookOrderList.jsp");
			}else {
				Book_OrderDAO book_OrderDAO = new Book_OrderDAO();
				try {
					totalCount = book_OrderDAO.getTotalCount(kind, search,state);
					if(totalCount==0) {
						totalCount=1;
					}
					PageMaker pageMaker = new PageMaker(curPage, totalCount);
					list = book_OrderDAO.selectList(id,pageMaker.getMakeRow(),kind,search);
					request.setAttribute("bookOrderList", list);
					request.setAttribute("size", list.size());
					request.setAttribute("id", id);
					request.setAttribute("search", search);
					request.setAttribute("kind", kind);
					request.setAttribute("curPage", curPage);
					request.setAttribute("page", pageMaker.getMakePage());
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/book/bookOrderList.jsp");
			}
		
		}
		return actionFoward;
	}
}