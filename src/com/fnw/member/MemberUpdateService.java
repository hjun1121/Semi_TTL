package com.fnw.member;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class MemberUpdateService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = null;
		int result = 0;

		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(method.equals("GET")) {
			try {
				memberDTO = memberDAO.selectOne(request.getParameter("id"));
				String e = memberDTO.getEmail();
				String[] ar = e.split("@");
				String email1 = ar[0];
				String email2 = ar[1];
				
				String p = memberDTO.getPhone();
				String[] ar2 = p.split("-");
				String f = ar2[0];
				String m = ar2[1];
				String l = ar2[2];
				request.setAttribute("DTO", memberDTO);
				request.setAttribute("email1", email1);
				request.setAttribute("email2", email2);
				request.setAttribute("f", f);
				request.setAttribute("m", m);
				request.setAttribute("l", l);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberUpdate.jsp");
		}else {
			
			MemberDTO m = null;
			try {
				memberDTO = memberDAO.selectOne(request.getParameter("id"));
				memberDTO.setId(request.getParameter("id"));
				memberDTO.setPw(request.getParameter("pw1"));
				memberDTO.setBirth(Date.valueOf(request.getParameter("birth")));
				memberDTO.setPostCode(request.getParameter("postCode"));
				memberDTO.setAddr(request.getParameter("addr"));
				memberDTO.setAddr2(request.getParameter("addr2"));
				memberDTO.setPhone(request.getParameter("phone"));
				memberDTO.setEmail(request.getParameter("email"));
				memberDTO.setLibrary(Integer.parseInt(request.getParameter("library")));
				memberDTO.setKind(Integer.parseInt(request.getParameter("kind")));
				try {
					result = memberDAO.update(memberDTO);
					
					HttpSession session = request.getSession();
					m = (MemberDTO)session.getAttribute("member");
					if(memberDTO.getId().equals(m.getId())) {
						session.setAttribute("member", memberDTO);
					}					
				
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			if(result>0) {
				if(((MemberDTO)request.getSession().getAttribute("member")).getKind() == 10) {
					if(memberDTO.getId().equals(m.getId())) {
						request.setAttribute("message", "수정 완료");
						request.setAttribute("path", "../member/memberUpdate.member?id="+memberDTO.getId());
					}else {
						request.setAttribute("message", "수정 완료");
						request.setAttribute("path", "./memberList.member");
					}
				}else {
					request.setAttribute("message", "수정 완료");
					request.setAttribute("path", "../member/memberUpdate.member?id="+memberDTO.getId());
				}
			}else {
				request.setAttribute("message", "수정 실패");
				request.setAttribute("path", "./memberUpdatePwCheck.member");
			}
			request.setAttribute("library", library);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionFoward;
	}

}
