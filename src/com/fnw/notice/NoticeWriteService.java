package com.fnw.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class NoticeWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		String method = request.getMethod();
		ActionFoward actionFoward = new ActionFoward();
		
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
		if(method.equals("POST")) {
			NoticeDAO noticeDAO = new NoticeDAO();
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setTitle(request.getParameter("title"));
			noticeDTO.setContents(request.getParameter("contents"));
			noticeDTO.setWriter(request.getParameter("writer"));
			int result=0;
			try {
				result = noticeDAO.insert(noticeDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(result>0) {
				request.setAttribute("message", "입력 완료");
				request.setAttribute("path", "./noticeList.notice?id="+id);
			}else {
				request.setAttribute("message", "입력 실패");
				request.setAttribute("path", "./noticeList.notice?id="+id);
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
			request.setAttribute("notice", "notice");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/notice/noticeWrite.jsp");
		}
		request.setAttribute("library", library);
		return actionFoward;
	}

}
