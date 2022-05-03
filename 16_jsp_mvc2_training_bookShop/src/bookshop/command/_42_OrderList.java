package bookshop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.bean.BuyDto;
import bookshop.controller.CommandAction;
import bookshop.dao.BuyDao;

public class _42_OrderList implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,HttpServletResponse response) throws Throwable {
		
		List<BuyDto> buyLists = null;
		int count = 0;

		//전체 주문목록의 수를 얻어냄
		BuyDao buyProcess = BuyDao.getInstance();
		count = buyProcess.getListCount();
		
		if (count > 0){			
			buyLists = buyProcess.getBuyList();
		    request.setAttribute("buyLists", buyLists);
		}
		
		request.setAttribute("count", new Integer(count));
	    request.setAttribute("type", new Integer(0));
	    
		return "/42_orderList.jsp";
		
	}
	
}