package bonus;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.MemberBean;

@WebServlet("/pages/bonus/GetBonus")
public class GetBonus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetBonus() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("================來自GetBonus.java的訊息================");
		HttpSession session = request.getSession();// 取得session
		MemberBean bean = (MemberBean) session.getAttribute("bean"); // 取得網頁裡session的會員資料
		int num = Integer.parseInt(request.getParameter("num")); // 取得會員抽到的紅利
		System.out.println("num=" + num);
		if (bean == null) { // 檢查有無登入(以防萬一用),送回首頁
			// request.getRequestDispatcher("/index.jsp").forward(request,
			// response);
			// System.out.println("====================訊息結束====================");
			return;
		}
		int a = 0;
		switch (num) {
		case 1:
			a = 2000;
			break;
		case 2:
			a = 1500;
			break;
		case 3:
			a = 500;
			break;
		case 4:
			a = 300;
			break;
		case 5:
			a = 100;
			break;
		default:
			a = 50;
			break;
		}
		System.out.println("現有點數=" + bean.getMemberBonus());
		System.out.println("獲得點數=" + a);
		int memberBonus = bean.getMemberBonus() + a;// 原有紅利加上獲得紅利
		System.out.println("總紅利=" + bean.getMemberBonus() + "+" + a + "=" + memberBonus);
		bean = new BonusDAOJdbc().updataBonus(bean.getMemberId(), memberBonus);
		//bean = new BonusDAOJdbc().selectBonus(bean.getMemberId());
		session.setAttribute("bean", bean);
		// RequestDispatcher rd =
		 //request.getRequestDispatcher("index.jsp");
		// rd.forward(request, response);
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
