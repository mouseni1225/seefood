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
import javax.servlet.http.HttpSession;

import JavaMail.JavaMail;
import login.MemberBean;
import login.MemberDAOJdbc;

@WebServlet("/pages/forgetpassword")
public class ForgetPassServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> errorMsgs = new HashMap<String, String>();
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); // 取得連線
		response.setContentType("text/html; charset=UTF-8");
		request.setAttribute("ErrMsg", errorMsgs);
		
		String memberAddress;
		String memberNicknName;

		memberAddress = request.getParameter("memberAddress");
		memberNicknName = request.getParameter("memberNicknName");

		MemberDAOJdbc memberdao = new MemberDAOJdbc();
		MemberBean getemail = memberdao.select(memberAddress);

		if (getemail != null) {

			if (!getemail.getMemberAddress().equals(memberAddress)
					|| !getemail.getMemberNicknName().equals(memberNicknName)) {
				errorMsgs.put("notfind", "輸入的資料不正確");
				
				RequestDispatcher rd = request.getRequestDispatcher("/pages/information/forgetpassword.jsp");// 停留本頁
				rd.forward(request, response);
				System.out.println("找不到此用戶1");
			} else if (getemail.getMemberAddress().equals(memberAddress)
					&& getemail.getMemberNicknName().equals(memberNicknName)) {
				
				
				String message = getemail.getMemberPassword();
				String path = request.getContextPath();
				//String message1 =  "<a href=http://localhost:8080"+path+"/forget?memberAddress="+memberAddress+"&memberNicknName="+memberNicknName+"><h1>歡迎來到食府</h1></a>";
				String message1 =  "<a href=http://seefood.azurewebsites.net"+path+"/forget?memberAddress="+memberAddress+"&memberNicknName="+memberNicknName+"><h1>歡迎來到食府</h1></a>";
				                                         
				
				//String message1 =  "<a href=http://localhost:8080"+path+"/pages/information/changinformationpass.jsp?memberAddress="+memberAddress+"&memberNicknName="+memberNicknName+"><h1>sending html mail check</h1></a>";
				                                                       
				JavaMail mail = new JavaMail();
				mail.setTo(memberAddress);
				mail.setSub("SeeFood");
				mail.setMsg(message1);
				
				JavaMail.send(mail);
				session.setAttribute("memberAddress", memberAddress);
				session.setAttribute("memberNicknName", memberNicknName);
				response.sendRedirect(request.getContextPath() + "/pages/information/emailSuccess.jsp");// 跳轉頁面

				return;
			}
		} else {
			System.out.println("找不到此用戶");
			errorMsgs.put("notfind", "輸入的資料不正確");
			RequestDispatcher rd = request.getRequestDispatcher("/pages/information/forgetpassword.jsp");// 停留本頁
			rd.forward(request, response);
			
		}
	}
}
