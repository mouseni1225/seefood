package information;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import register.GuestBean;
import register.GuestDAO;
import register.dao.GuestDAOJdbc;

@WebServlet("/pages/information/ConnectionMap")
public class ConnectionMap extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=UTF-8");
		GuestDAO guestdao=new GuestDAOJdbc();
		
		List<GuestBean> res=guestdao.select();
		
		PrintWriter out =response.getWriter();
		
		Gson gson = new Gson();
		String result = gson.toJson(res);
		out.println(result);
		out.flush();
		
		return;
		
	}

}
