package information;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;



@WebServlet("/pages/information/CheckUserIdServlet")
public class CheckUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		System.out.println("userId="+userId);
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String custId = "";
		Gson gson = new Gson();
		Map<String, String> map = new HashMap<>();
		if (userId != null && userId.trim().length() != 0) {
			try {
				UserDAOSQLServer  dao = new UserDAOSQLServer();
		       custId = dao.checkUserId(userId);
		       System.out.println("check~custId="+custId);
			   map.put("custId", custId);
			} catch(Exception ex){
				ex.printStackTrace();
			}
		}
		out.println(gson.toJson(map));
		out.close();
	}
}
