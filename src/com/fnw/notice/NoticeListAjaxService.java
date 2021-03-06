package com.fnw.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.util.PageMaker;


public class NoticeListAjaxService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		NoticeDAO noticeDAO = new NoticeDAO();
		
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

		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
		}
		
		String kind = request.getParameter("kind");
		if(kind==null) {
			kind="title";
		}
		String search=request.getParameter("search");
		if(search==null) {
			search="";
		}
		
		int totalCount=0;
		try {
			totalCount = noticeDAO.getTotalCount(kind, search);
			if(totalCount==0) {
				totalCount=1;
			}
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			List<NoticeDTO> ar=noticeDAO.selectList(pageMaker.getMakeRow(), kind, search);
			request.setAttribute("size", ar.size());
			request.setAttribute("list", ar);
			request.setAttribute("kind", kind);
			request.setAttribute("search", search);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("curPage", curPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("library", library);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/notice/noticeAjax.jsp");
		
		request.setAttribute("ln", ln);
		return actionFoward;
	}

}
