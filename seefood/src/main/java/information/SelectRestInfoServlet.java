package information;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.MemberBean;
import register.GuestBean;
import register.dao.GuestDAOJdbc;

@WebServlet("/selectresinfo")
public class SelectRestInfoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;// 修改餐廳資料 先讀取資料再送出修改

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, String> errorMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");// 網頁傳進來的用UTF-8解意
		response.setContentType("text/html; charset=UTF-8");
		request.setAttribute("ErrMsg", errorMsgs);
		HttpSession session = request.getSession(); // 建立物件存放錯誤訊息

		MemberBean bean = (MemberBean) session.getAttribute("bean");// 從使用者瀏覽器取得會員資料
																	// ,轉成同型別

		if (bean != null) {
			GuestBean select = new GuestDAOJdbc().selectrestaurant(bean.getMemberAddress());
			request.setAttribute("selectres", select);
			System.out.println(select);
			request.getRequestDispatcher("/pages/information/showallrestaurant.jsp").forward(request, response);
			System.out.println("ENDDDD");
			return;
		}

	}

}
