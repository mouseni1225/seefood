package _C_listCoupon.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _C_listCoupon.model.CouponBean;
import _C_listCoupon.model.DAO.CouponDAOJndi;
import login.MemberBean;

//施工中

//點選刪除button時會執行此程式
@WebServlet("/pages/_C_listCoupon/CouponDelete.do")
public class CouponDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CouponDelete() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("================來自CouponDelete.java的訊息================");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();// 取得連線
		String delect = request.getParameter("delect"); // 取得欲刪除的文章編號
		MemberBean bean = null;
		
		
		if (delect != null) { // 執行刪除動作
			System.out.println("執行刪除動作");
			int delectId = Integer.parseInt(delect); // 執行刪除方法需要數字型態的文章編號
			int msg = new CouponDAOJndi().delete(delectId); // 執行刪除方法會回傳數字
																// 成功回傳1 失敗回傳0
			if (msg == 1) {
				System.out.println("刪除成功");
				bean = (MemberBean) session.getAttribute("bean"); // 取得會員編號
				List<CouponBean> selectOne = new CouponDAOJndi().selectOne(bean.getOrg_Text());// 透過餐廳名稱搜尋出結果
				request.setAttribute("selectOne", selectOne); // 將結果放進request回傳
			} else
				System.out.println("刪除失敗"); // 測試
			//request.getRequestDispatcher("/pages/_C_listCoupon/selfcoupon.jsp").forward(request, response);
			
			RequestDispatcher rd = request.getRequestDispatcher("/pages/_C_listCoupon/selfcoupon.jsp");
			rd.forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}

	}

}
