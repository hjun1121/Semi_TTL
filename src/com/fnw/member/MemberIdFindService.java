package com.fnw.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberIdFindService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		
		if(method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberIdFind.jsp");
		}else {
			MemberDAO memberDAO = new MemberDAO();
			ArrayList<MemberDTO> ar = new ArrayList<>();
			try {
				ar = memberDAO.IdFind(request.getParameter("name"), request.getParameter("email"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(ar.size());
			
			if(ar.size()>0) {
				request.setAttribute("list", ar);
			}else {
				
			}
			request.setAttribute("size", ar.size());
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberIdFindAjax.jsp");
			
			
		}
		
		return actionFoward;
	}

}
