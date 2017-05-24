package information;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import register.GuestBean;
import register.GuestService;

@WebServlet("/changpass")
public class ChangYouPassServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;// 修改會員資料

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> errorMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");// 網頁傳進來的用UTF-8解意
		response.setContentType("text/html; charset=UTF-8");
		request.setAttribute("ErrMsg", errorMsgs);// 建立物件存放錯誤訊息

		String memberAddress;
		String memberPassword;
		String memberPassword2;
		
		try {
			memberAddress = request.getParameter("memberAddress");// 取的使用者網頁輸入的帳號
			memberPassword = request.getParameter("memberPassword");// 取的使用者網頁輸入的密碼
			memberPassword2 = request.getParameter("memberPassword2");// 取的使用者網頁輸入的密碼2
			

			System.out.println("memberAddress=" + memberAddress);// 自己驗證
			System.out.println("memberPassword=" + memberPassword);
			System.out.println("memberPassword2=" + memberPassword2);
			

			if (memberPassword == null || memberPassword.trim().length() == 0) {// 驗證密碼
				errorMsgs.put("memberPassword", "請輸入密碼");// 塞入錯誤訊息
			} else {
				request.setAttribute("memberPassword", memberPassword);// 回傳資料訊息
			}
			if (memberPassword2 == null || memberPassword2.trim().length() == 0) {// 驗證密碼2
				errorMsgs.put("memberPassword2", "請再次輸入密碼");// 塞入錯誤訊息
			} else {
				request.setAttribute("memberPassword2", memberPassword2);// 回傳資料訊息
			}
			if (memberPassword2.equals(memberPassword)) {// 比對密碼1&密碼2
			} else {
				errorMsgs.put("memberPassword2", "密碼不符");// 塞入錯誤訊息
			}

			
			if (errorMsgs.isEmpty()) {// 如果沒有錯誤訊息

				GuestService guestService = new GuestService();
				GuestBean gu = guestService.updatepass( memberPassword, memberAddress);// 將會員的bean透過guestService的insert方法執行新增

				response.sendRedirect(request.getContextPath() + "/pages/information/changPassSuccess.jsp");// 跳轉頁面
				request.getSession().invalidate();//移除session
				return;
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/pages/information/changinformationpass.jsp");// 停留本頁
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
