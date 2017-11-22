package com.fnw.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDAO;
import com.fnw.member.MemberDTO;
import com.fnw.notice.NoticeDTO;

public class NoticeViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		NoticeDAO noticeDAO = new NoticeDAO();
		int num =0;
		try {
		num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			
		}
		NoticeDTO noticeDTO=null;
		MemberDTO memberDTO = null;
		try {
			noticeDAO.hitUpdate(num);
			noticeDTO=noticeDAO.selectOne(num);
			
			String id = noticeDTO.getWriter();
			MemberDAO memberDAO = new MemberDAO();
			memberDTO = memberDAO.selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//boardDTO가 Null이면 다른 곳으로 처리
		
		request.setAttribute("view", noticeDTO);
		request.setAttribute("notice", "notice");
		request.setAttribute("memberDTO", memberDTO);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/notice/noticeView.jsp");
		
		return actionFoward;
	}

}
