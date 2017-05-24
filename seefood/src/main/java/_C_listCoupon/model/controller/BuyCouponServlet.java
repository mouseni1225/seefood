package _C_listCoupon.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _C_listCoupon.model.OrderItemBean;
import _D_shopping.model.ShoppingCart;

@WebServlet("/pages/_C_listCoupon/BuyCoupon.do")
public class BuyCouponServlet extends HttpServlet {
	// 當使用者按下『加入購物車』時，瀏覽器會送出請求到本程式
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);

		if (session == null) { // 使用逾時
			request.setAttribute("Errors", "使用逾時，請重新登入(BuyBookServlet:SessionTimeOut)");
			RequestDispatcher rd = request.getRequestDispatcher("/pages/login/login.jsp");
			rd.forward(request, response);
			return;
		}
		// 取出存放在session物件內的ShoppingCart物件
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 將此新建ShoppingCart的物件放到session物件內
			session.setAttribute("ShoppingCart", cart);
		}

		String cpIdStr = request.getParameter("cpId");
		String cpResIdStr = request.getParameter("cpResId");
		String cpResName = request.getParameter("resName");
		String cpTypeStr = request.getParameter("cpType");
		String cpData = request.getParameter("cpData");
		String cpHowBonusStr = request.getParameter("cpHowBonus");
		String cpStarTimeStr = request.getParameter("cpStarTime");
		String cpOverTimeStr = request.getParameter("cpOverTime");
		String org_Text = request.getParameter("resName");
		String pageNo = request.getParameter("pageNo");
		String qtyStr = request.getParameter("qty");

		System.out.println("----------來自BuyCouponServlet訊息----------");
		System.out.println("----------此為maintain.jsp傳來的資料----------");
		System.out.println("cpIdStr=" + cpIdStr);
		System.out.println("cpResIdStr=" + cpResIdStr);
		System.out.println("cpResName=" + cpResName);
		System.out.println("cpTypeStr=" + cpTypeStr);
		System.out.println("cpData=" + cpData);
		System.out.println("cpHowBonusStr=" + cpHowBonusStr);
		System.out.println("cpStarTimeStr=" + cpStarTimeStr);
		System.out.println("cpOverTimeStr=" + cpOverTimeStr);
		System.out.println("cpOverTimeStr=" + org_Text);
		System.out.println("pageNotr=" + pageNo);
		System.out.println("qtyStr=" + qtyStr);
		System.out.println("-----------------------------------------");

		if (pageNo == null) {
			pageNo = "1";
		}
		int cpId = 0;
		int cpResId = 0;
		// int cpType =0;
		int cpHowBonus = 0;
		java.util.Date cpStarTime = null;
		java.util.Date cpOverTime = null;
		int qty = 0;

		try {
			// 進行資料型態的轉換

			cpId = Integer.parseInt(cpIdStr.trim());
			cpResId = Integer.parseInt(cpResIdStr.trim());
			// cpType = Integer.parseInt(cpTypeStr.trim());
			cpHowBonus = Integer.parseInt(cpHowBonusStr.trim());
			cpStarTime = java.sql.Date.valueOf(cpStarTimeStr);
			cpOverTime = java.sql.Date.valueOf(cpOverTimeStr);
			qty = Integer.parseInt(qtyStr.trim());

			System.out.println("----------來自BuyCouponServlet訊息----------");
			System.out.println("----------此為maintain.jsp傳來的資料----------");
			System.out.println("----------------此為轉型過後的資料--------------");
			System.out.println("cpId=" + cpId);
			System.out.println("cpResId=" + cpResId);
			System.out.println("cpResName=" + cpResName);
			System.out.println("cpType=" + cpTypeStr);
			System.out.println("cpData=" + cpData);
			System.out.println("cpHowBonus=" + cpHowBonus);
			System.out.println("cpStarTime=" + cpStarTime);
			System.out.println("cpOverTime=" + cpOverTime);
			System.out.println("org_Text=" + org_Text);
			System.out.println("pageNo=" + pageNo);
			System.out.println("qty=" + qty);
			System.out.println("-----------------------------------------");

		} catch (NumberFormatException e) {
			throw new ServletException(e);
		}
		// 將訂單資料封裝到OrderItemBean內
		OrderItemBean oi = new OrderItemBean(cpId, cpResId, cpTypeStr, cpData, cpHowBonus, cpStarTime, cpOverTime, qty,
				cpResName,org_Text);
		// 將OrderItemBean加入ShoppingCart的物件內
		cart.addToCart(cpId, oi);
		RequestDispatcher rd = request.getRequestDispatcher("/pages/_C_listCoupon/DisplayPageCoupons?pageNo=" + pageNo);
		rd.forward(request, response);
	}
}