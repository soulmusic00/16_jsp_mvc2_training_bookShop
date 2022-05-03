package bookshop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bookshop.dao.MemberDao;
import bookshop.controller.CommandAction;

public class _20_Confirm implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		  
		MemberDao manager = MemberDao.getInstance();
		int check= manager.confirm(id);
		
		request.setAttribute("check", new Integer(check));
		
		return "/20_confirm.jsp";
		
	}
	
}