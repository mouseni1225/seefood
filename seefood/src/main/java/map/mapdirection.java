package map;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/pages/map0331/test")
public class mapdirection extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public mapdirection() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("================來自mapdirection.java的訊息================");
		HttpSession session = request.getSession();// 取得session
		
		String name=request.getParameter("name");
		System.out.println("name="+name);

		request.setAttribute("name", name);
		RequestDispatcher rd = request.getRequestDispatcher("../map0331/homemapsecond.jsp");
		rd.forward(request, response);

	}

}
