package _C_listCoupon.model.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _A_init.GlobalService;
import _C_listCoupon.model.CouponBean;
import _C_listCoupon.model.DAO.CouponDAOJndi;
import article.ArticleBean;
import article.ArticleDAOJdbc;
import login.MemberBean;

@WebServlet("/pages/_C_listCoupon/seeselfcoupon")


// 接收BuyCouponServlet的資料
// 跟_C_listCoupons/listCoupons.jsp 資料交流
public class seeselfcoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("================來自seeselfcoupon.java的訊息================");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();// 取得連線
		MemberBean bean = (MemberBean) session.getAttribute("bean"); // 取得網頁裡session的會員資料
		// 驗證資料
				if (bean == null) { // 檢查有無登入(以防萬一用),送回首頁
					request.getRequestDispatcher("/index.jsp").forward(request, response);
					System.out.println("====================訊息結束====================");
					return;
				}
		if (bean != null) { // 檢查物件
			List<CouponBean> selectOne = new CouponDAOJndi().selectOne(bean.getOrg_Text());// 透過餐廳名稱搜尋出結果
			//List<ArticleBean> select = new ArticleDAOJdbc().selectMemberId(cp.getMemberId()); // 透過會員編號搜尋出結果
			request.setAttribute("selectOne", selectOne); // 將結果放進request回傳
			request.getRequestDispatcher("/pages/_C_listCoupon/selfcoupon.jsp").forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return;
	}

}