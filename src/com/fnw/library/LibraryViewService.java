package com.fnw.library;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnw.action.Action;
import com.fnw.action.ActionFoward;

public class LibraryViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		LibraryDAO libraryDAO = new LibraryDAO();
		ArrayList<LibraryDTO> ar = null;
		int library = 0;
		try {
			library = Integer.parseInt(request.getParameter("library"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			ar = libraryDAO.selectList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("library", library);
		request.setAttribute("library", ar);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/library/libraryView.jsp");
		
		return actionFoward;
	}

}
