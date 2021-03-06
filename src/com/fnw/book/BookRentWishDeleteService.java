package com.fnw.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;
import com.fnw.member.MemberDTO;

public class BookRentWishDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		Book_Rent_WishDAO book_Rent_WishDAO = new Book_Rent_WishDAO();
		String method = request.getMethod();
		
		int ln = 0;
		try {
			ln = Integer.parseInt(request.getParameter("ln"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(method.equals("GET")) {
			int result = 0;
			try {
				result = book_Rent_WishDAO.delete(Integer.parseInt(request.getParameter("num")));
			} catch (Exception e) {
				e.printStackTrace();
			}
			String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
			if(result>0) {
				request.setAttribute("message", "삭제 완료");
				request.setAttribute("path", "./bookRentWishList.book?curPage=1&id="+id);
			}else {
				request.setAttribute("message", "삭제 실패");
				request.setAttribute("path", "./bookRentWishList.book?curPage=1&id="+id);
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
			String[] param = request.getParameterValues("Pcheck");
			int result2 = 0;
			for(int i=0;i<param.length;i++) {
				try {
					result2 = book_Rent_WishDAO.delete(Integer.parseInt(param[i]));
				}catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
				if(result2>0) {
					request.setAttribute("message", "삭제 완료");
					request.setAttribute("path", "./bookRentWishList.book?curPage=1&id="+id);
				}else {
					request.setAttribute("message", "삭제 실패");
					request.setAttribute("path", "./bookRentWishList.book?curPage=1&id="+id);
				}
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}

		request.setAttribute("ln", ln);
		return actionFoward;
	}
}