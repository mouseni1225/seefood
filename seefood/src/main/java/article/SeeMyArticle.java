package article;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.MemberBean;

@WebServlet("/pages/SeeMyArticle")
public class SeeMyArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("================來自SeeMyArticle.java的訊息================");
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
			List<ArticleBean> select = new ArticleDAOJdbc().selectMemberId(bean.getMemberId()); // 透過會員編號搜尋出結果
			request.setAttribute("selectMemberId", select); // 將結果放進request回傳
			request.getRequestDispatcher("/pages/article/changearticle.jsp").forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return;
	}

}
