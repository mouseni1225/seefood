package login;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.controller")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=================來自LoginServlet的訊息==============="); // 測試
		Map<String, String> errors = new HashMap<String, String>(); // 建立存放錯誤訊息的物件
		request.setAttribute("ErrorMsg", errors); // 錯誤訊息放入request,關鍵字是"ErrorMsg"
		HttpSession session = request.getSession();// 取得session
		ServletContext context=request.getSession().getServletContext();

		String userId = request.getParameter("userId"); // 接取登入網頁的的"帳號"欄位值
		String userPsd = request.getParameter("userPsd");// 接取登入網頁的的"密碼"欄位值
		System.out.println("userId=" + userId); // 測試
		System.out.println("userPsd=" + userPsd); // 測試

		if (userId == null || userId.trim().length() == 0) { // 檢查帳號
			errors.put("noId", "請輸入ID"); // 錯誤訊息回傳登入網頁 ${ErrorMsg.noId}
			System.out.println("ID沒打"); // 測試
		}
		if (userPsd == null || userPsd.trim().length() == 0) {// 檢查密碼
			errors.put("noPsd", "請輸入密碼");// 錯誤訊息回傳登入網頁 ${ErrorMsg.noPsd}
			System.out.println("psd沒打"); // 測試
		}

		if (!errors.isEmpty()) { // 有錯誤訊息就停留原頁面
			RequestDispatcher rd = request.getRequestDispatcher("/pages/login/login.jsp");
			rd.forward(request, response);
			System.out.println("有錯誤回傳"); // 測試
			System.out.println("ID沒打"); // 測試
			return;
		}
		// 沒有錯誤訊息的情況
		// CopyMemberService confirm = new CopyMemberService(); //簡化至下一行
		boolean check = new MemberService().login(userId, userPsd);
		// 執行CopyMemberService的login方法以驗證身分,正確回傳true,錯誤回傳false
		if (check == false) {
			errors.put("loginerror", "帳號或密碼錯誤"); // 錯誤訊息,關鍵字${ErrorMsg.loginerror}
			RequestDispatcher rd = request.getRequestDispatcher("/pages/login/login.jsp");
			rd.forward(request, response);
			System.out.println("==========訊息結束==========");
			return;
		} else {
			MemberBean bean = new MemberService().nicknName(userId, userPsd); // 產生bean存查詢結果
			if (bean != null) {
				java.util.Date d1 = new java.util.Date();
				Calendar cal = Calendar.getInstance();
				d1 = cal.getTime();
				if (bean.getLoginTime() == null) {
					System.out.println("首次登入!!");
					System.out.println("紀錄當天首次登入時間=" + d1);
					bean = new MemberDAOJdbc().updata(d1, userId);
					session.setAttribute("bean", bean);// bean存進session當作登入標準,網頁以暱稱做判斷${bean.memberNicknName}
					request.setAttribute("msg", "當天首次登入,即可抽獎!!! ");
					RequestDispatcher rd = request.getRequestDispatcher("/pages/bonus/bonus.jsp");
					rd.forward(request, response);
					System.out.println("==========訊息結束==========");
					return;
				} else if (bean.getLoginTime() != null) {
					System.out.println("非首次登入!!");
					String time = new java.util.Date(bean.getLoginTime().getTime()).toString().substring(0, 3);
					System.out.println("會員上次登入時間=" + time);
					String time2 = cal.getTime().toString().substring(0, 3);
					System.out.println("現在時間=" + time2);
					
					if (!time.equals(time2)) {
						System.out.println("第2天登入!!");
						bean = new MemberDAOJdbc().updata(d1, userId);
						session.setAttribute("bean", bean);// bean存進session當作登入標準,網頁以暱稱做判斷${bean.memberNicknName}
						request.setAttribute("msg", "當天首次登入,即可抽獎!!! ");
						RequestDispatcher rd = request.getRequestDispatcher("/pages/bonus/bonus.jsp");
						rd.forward(request, response);
						System.out.println("==========訊息結束==========");
						return;
					}else if(time.equals(time2)){
						System.out.println("非首次登入也非第2天登入");
						session.setAttribute("bean", bean);// bean存進session當作登入標準,網頁以暱稱做判斷${bean.memberNicknName}
						context.setAttribute("name", bean.getMemberNicknName());
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
						rd.forward(request, response);
						System.out.println("==========訊息結束==========");
						return;
					}
				}
				session.setAttribute("bean", bean);// bean存進session當作登入標準,網頁以暱稱做判斷${bean.memberNicknName}
				RequestDispatcher rd = request.getRequestDispatcher("/pages/bonus/bonus.jsp");
				rd.forward(request, response);
				System.out.println("==========訊息結束??????????==========");
				return;
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
