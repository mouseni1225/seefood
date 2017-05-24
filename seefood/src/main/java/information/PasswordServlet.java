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

import JavaMail.JavaMail;
import login.MemberBean;
import login.MemberDAOJdbc;
@WebServlet("/forget")
public class PasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	String memberAddress;
	String memberNicknName;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Map<String, String> successMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); // 取得連線
		memberAddress = request.getParameter("memberAddress");
		memberNicknName = request.getParameter("memberNicknName");

		MemberDAOJdbc memberdao = new MemberDAOJdbc();
		MemberBean getemail = memberdao.select(memberAddress);
		System.out.println(getemail.getMemberAddress());
		System.out.println(getemail.getMemberNicknName());
		System.out.println("memberAddress="+memberAddress);
		System.out.println("memberNicknName="+memberNicknName);
		if (getemail.getMemberAddress().equals(memberAddress)
				&& getemail.getMemberNicknName().equals(memberNicknName)) {
//			successMsgs.put("memberAddress", memberAddress);
//			successMsgs.put("memberNicknName", memberNicknName);
			session.setAttribute("memberAddress", memberAddress);
			session.setAttribute("memberNicknName", memberNicknName);
			System.out.println("Hi 有跑到PasswordServlet");
//			request.setAttribute("SucMsg", successMsgs);
			response.sendRedirect(request.getContextPath() + "/pages/information/changinformationpass.jsp");// 跳轉頁面
			                        
			return;
		}
		
		
	}
	
	

}
