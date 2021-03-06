package com.fnw.member;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberJoinService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		
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

		if(method.equals("GET")){
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberJoin.jsp");
			
		}else {
			
			int result = this.doPost(request);
			
			String message=null;
			
			if(result>0) {
				message="회원가입 성공";
				request.setAttribute("path", "../index.jsp");
			}else {
				message="회원가입 실패";
				request.setAttribute("path", "../member/memberJoin/member");
			}
			request.setAttribute("message", message);
			request.setAttribute("library", library);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		request.setAttribute("ln", ln);
		return actionFoward;
	}

	private int doPost(HttpServletRequest request) {
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("pw"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setBirth(Date.valueOf(request.getParameter("birth")));
		memberDTO.setGender(request.getParameter("gender"));
		memberDTO.setPostCode(request.getParameter("postCode"));
		memberDTO.setAddr(request.getParameter("addr"));
		memberDTO.setAddr2(request.getParameter("addr2"));
		memberDTO.setPhone(request.getParameter("phone"));
		memberDTO.setEmail(request.getParameter("email"));
		memberDTO.setLibrary(Integer.parseInt(request.getParameter("library")));
		int result =0;  
		try {
			result = memberDAO.insert(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
