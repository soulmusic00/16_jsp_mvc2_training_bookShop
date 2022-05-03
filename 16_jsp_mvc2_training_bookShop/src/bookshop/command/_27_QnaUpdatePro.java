package bookshop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.bean.QnaDto;
import bookshop.controller.CommandAction;
import bookshop.dao.QnaDao;

public class _27_QnaUpdatePro implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,HttpServletResponse response) throws Throwable {
	
		request.setCharacterEncoding("utf-8");
		int qna_id =  Integer.parseInt(request.getParameter("qna_id"));
		String qna_content = request.getParameter("qna_content");
		
		//수정에 필요한 정보구성
		QnaDto qna = new QnaDto();
		qna.setQna_id(qna_id);
		qna.setQna_content(qna_content);
		
		//qna수정
		QnaDao qnaProcess = QnaDao.getInstance();
		int check = qnaProcess.updateArticle(qna);
		
		request.setAttribute("check", new Integer(check));
		
		return "/27_qnaUpdatePro.jsp";
		
	}
	
}