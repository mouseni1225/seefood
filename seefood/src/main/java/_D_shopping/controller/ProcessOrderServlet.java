package _D_shopping.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _C_listCoupon.model.OrderItemBean;
import _D_shopping.model.OrderBean;
import _D_shopping.model.OrderDAO;
import _D_shopping.model.OrderItemDAOBean;
import _D_shopping.model.ShoppingCart;
import bonus.BonusDAOJdbc;
import login.MemberBean;
import login.MemberDAOJdbc;

// OrderConfirm.jsp 呼叫本程式
@WebServlet("/pages/_D_shopping/ProcessOrder.do")
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");

			String finalDecision = request.getParameter("finalDecision");
			HttpSession session = request.getSession(false);
			if (session == null) { // 使用逾時
				response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
				return;
			}
			MemberBean mb = (MemberBean) session.getAttribute("bean");
			if (mb == null) {
				response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
				return;
			}
			ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
			if (sc == null) {
				// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
				// 導向首頁
				response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
				return;
			}
			if (finalDecision.equals("CANCEL")) {
				session.removeAttribute("ShoppingCart");
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
				return; // 一定要記得 return
			}
			System.out.println("------------來自ProcessOrderServlet消息--------------");
			System.out.println("mb" + mb);
			System.out.println("----------------------------------------------");
			String memberNicknName = mb.getMemberNicknName();
			int totalAmount = sc.getSubtotal();
			Date today = (Date) session.getAttribute("today");
			List<OrderItemDAOBean> items = new ArrayList<OrderItemDAOBean>();
			Map<Integer, OrderItemBean> cart = sc.getContent();
			Set<Integer> set = cart.keySet();
			for (Integer k : set) {
				OrderItemBean oib = cart.get(k);
				OrderItemDAOBean oiDAO = new OrderItemDAOBean(0, 0, oib.getCpId(), oib.getCpResId(), oib.getCpData(),
						oib.getQty(), oib.getCpHowBonus(), oib.getCpStarTime(), oib.getCpOverTime(),oib.getOrg_Text());
				System.out.println("oib.getCpId()="+oib.getCpId());
				System.out.println("oib.getCpResId()="+oib.getCpResId());
				System.out.println("oib.getCpData()="+oib.getCpData());
				System.out.println("oib.getQty()="+oib.getQty());
				System.out.println("oib.getCpHowBonus()="+ oib.getCpHowBonus());
				System.out.println("oib.getCpStarTime()="+oib.getCpStarTime());
				System.out.println("oib.getCpOverTime()="+oib.getCpOverTime());
				System.out.println("oib.getOrg_Text()="+oib.getOrg_Text());
				System.out.println("----------------------------------------------");
				items.add(oiDAO);
			}
			// OrderBean:封裝一筆訂單資料的容器(包含訂單主檔與訂單明細檔的資料)
			OrderBean ob = new OrderBean(memberNicknName, totalAmount, today, null, items);
			OrderDAO order = new OrderDAO();
			String subtotalStr= request.getParameter("subtotal");
			System.out.println("subtotalStr="+subtotalStr);
			int subtotal=Integer.parseInt(subtotalStr);
			System.out.println("總計金額="+subtotal);
			System.out.println("原有點數="+mb.getMemberBonus());
			int n= mb.getMemberBonus(); 
			int ooo = n-subtotal;
			System.out.println("消費後點數="+ooo);
			
			mb =new BonusDAOJdbc().updataBonus(mb.getMemberId(), ooo);//更新消費後紅利
			MemberBean mmb=new MemberDAOJdbc().select(mb.getMemberAddress());
			request.setAttribute("bean", mmb);
			session.setAttribute("bean", mmb);
			
			order.insertOrder(ob);
			session.removeAttribute("ShoppingCart");
			response.sendRedirect(response.encodeRedirectURL("../../ThanksForOrdering.jsp"));
		} catch (NamingException e) {
			throw new ServletException();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException();
		}
	}

	public static void main(String[] args) {

	}
}