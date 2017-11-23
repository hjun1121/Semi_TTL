package com.fnw.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.util.PageMaker;

public class AdminMemberListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method=request.getMethod();
		
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
			if(method.equals("GET")) {
				this.pagination(request);
				request.setAttribute("library", library);
				request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/admin/admin_member_list.jsp");
				
			}else { //post 일 때
				
				this.pagination(request);
				String sel = request.getParameter("sel");
						
				if(sel == null) {
					request.setAttribute("library", library);
					request.setAttribute("ln", ln);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/admin/admin_member_list_ajax.jsp");
				}else {
					request.setAttribute("library", library);
					request.setAttribute("ln", ln);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/admin/admin_member_list.jsp");
				}
				
			}
		}
		return actionFoward;
	}

	
	public void pagination(HttpServletRequest request) {
		
		int kind = 1;
		try {
			kind = Integer.parseInt(request.getParameter("kind"));
		}catch (Exception e) {
		}
		String kind1 = request.getParameter("kind1");
		if(kind1 == null) {
			kind1 = "id";
		}
		String search = request.getParameter("search");
		if(search == null) {
			search = "";
		}
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			curPage=1;
		}
		String type = "member";
		if(kind==0) {
			type="black";
		}else if(kind==10){
			type="admin";
		}else {
			type="member";
		}
		MemberDAO memberDAO = new MemberDAO();
		int totalCount = 0;
		ArrayList<MemberDTO> ar = new ArrayList<>();
		try {
			totalCount = memberDAO.getTotalCount(kind, kind1, search);
			PageMaker pageMaker = new PageMaker(curPage, totalCount);
			
			ar = memberDAO.selectList(kind, pageMaker.getMakeRow(), kind1, search);
			
			request.setAttribute("size", ar.size());
			request.setAttribute("list", ar);
			request.setAttribute("type", type);
			request.setAttribute("kind", kind);
			request.setAttribute("kind1", kind1);
			request.setAttribute("search", search);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("curPage", curPage);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//pagination 끝
	
}
