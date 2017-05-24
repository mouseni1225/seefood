package information;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import register.GuestService;

@WebServlet("/ChangRes")
public class ChangRestaurantInfo extends HttpServlet {

	private static final long serialVersionUID = 1L;// 修改餐廳資料

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> errorMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setAttribute("ErrMsg", errorMsgs);

		String servItem;
		String org_Text;
		String lat;
		String lng;
		String informaddress;
		String informtel;
		String special;
		String time;
		String price;
		String memberAddress;
		try {
			servItem = request.getParameter("servItem");
			org_Text = request.getParameter("org_Text");
			lat = request.getParameter("lat");
			lng = request.getParameter("lng");
			informaddress = request.getParameter("informaddress");
			informtel = request.getParameter("informtel");
			special = request.getParameter("special");
			time = request.getParameter("time");
			price = request.getParameter("price");
			memberAddress = request.getParameter("memberAddress");
			System.out.println("servItem=" + servItem);
			System.out.println("org_Text=" + org_Text);
			System.out.println("lat=" + lat);
			System.out.println("lng=" + lng);
			System.out.println("informaddress=" + informaddress);
			System.out.println("informtel=" + informtel);
			System.out.println("special=" + special);
			System.out.println("time=" + time);
			System.out.println("price=" + price);
			System.out.println("memberAddress=" + memberAddress);
			GuestService guestService = new GuestService();
			guestService.updaterestaurant(org_Text, informtel, informaddress, lat, lng, special, time, price, servItem,
					memberAddress);
			response.sendRedirect(request.getContextPath() + "/pages/information/changResSuccess.jsp");// 跳轉頁面
		
			return;
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
