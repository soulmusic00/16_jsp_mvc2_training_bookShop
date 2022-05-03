package bookshop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.bean.QnaDto;
import bookshop.controller.CommandAction;
import bookshop.dao.QnaDao;

public class _32_QnaReplyUpdate implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,HttpServletResponse response) throws Throwable {
		
        request.setCharacterEncoding("utf-8");
		
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		
		//주어진 qna_id에 해당하는 수정할 qna답변을 가져옴 
		QnaDao qnaProcess = QnaDao.getInstance();
		QnaDto qna  =  qnaProcess.updateGetArticle(qna_id);
		
		request.setAttribute("qna", qna);
		request.setAttribute("qna_id", new Integer(qna_id));
		request.setAttribute("type", new Integer(0));
		
		return "/32_qnaReplyUpdate.jsp";
	
	}
	
}