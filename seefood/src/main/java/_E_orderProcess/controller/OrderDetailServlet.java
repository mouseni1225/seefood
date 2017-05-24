package _E_orderProcess.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _D_shopping.model.OrderBean;
import _D_shopping.model.OrderDAO;
import _D_shopping.model.OrderItemDAOBean;


//接收orderList.jsp的資料
@WebServlet("/pages/_E_orderProcess/orderDetail.do")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String orderNo = request.getParameter("orderNo");
		int no = Integer.parseInt(orderNo.trim()); // ###
		try {
			OrderDAO ordDAO = new OrderDAO();
			OrderBean ob = ordDAO.getOrder(no);
			request.setAttribute("OrderBean", ob);
			RequestDispatcher rd = request.getRequestDispatcher("ShowOrderDetail.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			System.out.println("ooo");
			throw new ServletException(e);
		} catch (NamingException e) {
			System.out.println("xxx");
			throw new ServletException(e);
		}
	}

	public void displayOrderBean(OrderBean ob) {
		System.out.println("ob.getOrderNo()=" + ob.getOrderNo());
		System.out.println("ob.getMemberNicknName()=" + ob.getMemberNicknName());
		System.out.println("ob.getOrderDate=" + ob.getOrderDate());
		System.out.println("ob.getTotal=" + ob.getTotal());
		System.out.println("ob.getCancelTag=" + ob.getCancelTag());
		System.out.println("==============訂單明細=================");
		List<OrderItemDAOBean> items = ob.getItems();
		for (OrderItemDAOBean oib : items) {
			System.out.println("---------------一筆明細---------------");
			System.out.println("   oib.getSeqno()=" + oib.getSeqno());
			System.out.println("   oib.getOrderNo()=" + oib.getOrderNo());
			System.out.println("   oib.getCpId()=" + oib.getCpId());
			System.out.println("   oib.getCpId()=" + oib.getCpresId());
			System.out.println("   oib.getCpData()=" + oib.getCpData());
			System.out.println("   oib.getAmount()=" + oib.getAmount());
			System.out.println("   oib.getHowCoupon()=" + oib.getHowCoupon());
			System.out.println("   oib.getCpStarTime()=" + oib.getCpStarTime());
			System.out.println("   oib.getCpOverTime()=" + oib.getCpOverTime());
			System.out.println("   oib.getOrg_Text()=" + oib.getCpOverTime());
			
			
		}
	}
}