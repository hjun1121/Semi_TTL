package com.fnw.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.util.PageMaker;

public class QnaListService implements Action {

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
		int curPage = 0;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			curPage=1;
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
		QnaDAO qnaDAO = new QnaDAO();
		ArrayList<QnaDTO> ar = new ArrayList<>();
		try {
			totalCount = qnaDAO.getTotalCount(kind, search);
			if(totalCount==0) {
				totalCount=1;
			}
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			ar = qnaDAO.selectList(pageMaker.getMakeRow(),kind, search);
			request.setAttribute("size", ar.size());
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("search", search);
			request.setAttribute("kind", kind);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("curPage", curPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("library", library);
		request.setAttribute("ln", ln);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/qna/qnaList.jsp");
		return actionFoward;
	}
}