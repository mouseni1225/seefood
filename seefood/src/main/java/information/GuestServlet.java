package information;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.microsoft.windowsazure.services.blob.client.CloudBlobClient;
import com.microsoft.windowsazure.services.blob.client.CloudBlobContainer;
import com.microsoft.windowsazure.services.blob.client.CloudBlockBlob;
import com.microsoft.windowsazure.services.core.storage.CloudStorageAccount;

import _A_init.GlobalService;
import bonus.BonusDAOJdbc;
import login.MemberBean;
import register.GuestBean;
import register.GuestService;

@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
		* 1024 * 500 * 5)
@WebServlet("/pages/information/registerCustomer")
public class GuestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Map<String, String> errorMsgs = new HashMap<String, String>();
		HttpSession session = request.getSession(); // 取得連線
		request.setCharacterEncoding("UTF-8");// 網頁傳進來的用UTF-8解意
		response.setContentType("text/html; charset=UTF-8");
		request.setAttribute("ErrMsg", errorMsgs);// 建立物件存放錯誤訊息

		// 接收資料

		String memberAddress = request.getParameter("memberAddress");// 取的使用者網頁輸入的帳號
		String memberPassword = request.getParameter("memberPassword");// 取的使用者網頁輸入的密碼
		String memberPassword2 = request.getParameter("memberPassword2");// 取的使用者網頁輸入的密碼2
		String memberNicknName = request.getParameter("memberNicknName");// 取的使用者網頁輸入的暱稱
		String depId = request.getParameter("depId");// 取的使用者網頁輸入的部門編號

		String resTypes = request.getParameter("servItem");
		String resName = request.getParameter("org_Text");
		
		String resCity = request.getParameter("county");
		String resArea = request.getParameter("district");
		String resAddress = request.getParameter("resAddress").trim();
		String road=resCity+resArea+resAddress;
		
		
		String resPhone = request.getParameter("informtel");
		String lat = request.getParameter("lat").trim();
		String lng = request.getParameter("lng").trim();
		String special = request.getParameter("special");
		String price = request.getParameter("price").trim();
		String frg_Id = request.getParameter("frg_Id");
		
		String resOpentime = request.getParameter("resOpentime");
		String resClosetime = request.getParameter("resClosetime");
		String resRestTime = request.getParameter("resRestTime");
		String time="營業時間:"+resOpentime+" 關店時間:"+resClosetime+" 公休日:"+resRestTime;
		
		
		InputStream fis = null;
		InputStream is = null;
		long sizeInBytes = 0;

		int id = 0;// 為了String depId轉行int類別
		int rtype = 0;
		String type = null;

		Map<String, String> errors = new HashMap<String, String>(); // 建立物件存放錯誤訊息,關鍵字"errors"
		request.setAttribute("errors", errors);
		
        //抓圖片
		Collection<Part> parts = request.getParts();
		if (parts != null) {
			for (Part p : parts) {

				String fldName = p.getName(); // 抓欄位名

				System.out.println("test fldName=" + fldName);
				if (fldName.trim().equals("pic")) {
					System.out.println("here");
					sizeInBytes = p.getSize();
					System.out.println("sizeInBytes=" + sizeInBytes);
					fis = p.getInputStream();
					is = p.getInputStream();
					System.out.println("is=" + fis);

				}

			}
		}
		// 驗證資料
		// 驗證部門號碼欄位
		if (depId == null) {
			errorMsgs.put("depId", "請點選");// 塞入錯誤訊息
		} else {
			id = Integer.parseInt(depId);// String depId轉行int類別
			request.setAttribute("depId", id);// 回傳資料訊息
		}

		// 如果使用者選擇餐廳
		if (id == 10) {
			
			// 驗證部門號碼欄位
			if (resTypes != null) {
				rtype = Integer.parseInt(resTypes);// String resTypes轉型int類別
				System.out.println("rtype=" + rtype);
			} else {
				errorMsgs.put("resTypes", "請點選");// 塞入錯誤訊息
			}
            switch(rtype){
            
            case 100:
            	type="異國料理";
            	break;
            case 200:
            	type="日式料理";
            	break;
            case 300:
            	type="西式餐廳";
            	break;
            case 400:
            	type="中式餐廳";
            	break;
            case 500:
            	type="健康素食";
            	break;
            case 600:
            	type="甜點輕食";
            	break;
            case 700:
            	type="複合餐廳";
            	break;
            case 800:
            	type="泰式料理";
            	break;
    		
            }
			// 驗證店名欄位
			if (resName == null || resName.trim().length() == 0) {
				errorMsgs.put("resName", "請輸入店名");// 塞入錯誤訊息
			} else {
				request.setAttribute("resName", resName);// 回傳資料訊息
			}

			
			//驗證緯度
			if (lat==null||lat.trim().length()==0){
				errorMsgs.put("lat", "請輸入緯度");
			} else{
				request.setAttribute("lat", lat);
			}
			
			//驗證經度
			if (lng==null||lng.trim().length()==0){
				errorMsgs.put("lng", "請輸入經度");
			} else{
				request.setAttribute("lng", lng);
			}
			
			//驗證招牌餐點
			if(special==null||special.trim().length()==0){
				errorMsgs.put("special", "請輸入招牌餐點");
			} else{
				request.setAttribute("special", special);
			}
			
			//驗證平均價位
			if(price==null||price.trim().length()==0){
				errorMsgs.put("price", "請輸入平均價位");
			} else{
				request.setAttribute("price", price);
			}
			
			
			// 驗證城市欄位
			if (resCity == null || resCity.trim().length() == 0) {
				errorMsgs.put("resCity", "請輸入所在城市");// 塞入錯誤訊息
			} else {
				request.setAttribute("resCity", resCity);// 回傳資料訊息
			}

			// 驗證地區欄位
			if (resArea == null || resArea.trim().length() == 0) {
				errorMsgs.put("resArea", "請輸入所在地區");// 塞入錯誤訊息
			} else {
				request.setAttribute("resArea", resArea);// 回傳資料訊息
			}

			// 驗證地址欄位
			if (resAddress == null || resAddress.trim().length() == 0) {
				errorMsgs.put("resAddress", "請輸入地址");// 塞入錯誤訊息
			} else {
				request.setAttribute("resAddress", resAddress);// 回傳資料訊息
			}

			// 驗證電話欄位
			if (resPhone == null || resPhone.trim().length() == 0) {
				errorMsgs.put("resPhone", "請輸入電話");// 塞入錯誤訊息
			} else {
				request.setAttribute("resPhone", resPhone);// 回傳資料訊息
			}

			// 驗證營業時間欄位
			if (resOpentime == null || resOpentime.trim().length() == 0) {
				errorMsgs.put("resOpentime", "請選取營業時間");// 塞入錯誤訊息
			} else {
				request.setAttribute("resOpentime", resOpentime);// 回傳資料訊息
			}
			// 驗證關店時間欄位
			if (resClosetime == null || resClosetime.trim().length() == 0) {
				errorMsgs.put("resClosetime", "請選取關店時間");// 塞入錯誤訊息
			} else {
				request.setAttribute("resClosetime", resClosetime);// 回傳資料訊息
			}
			// 驗證公休欄位
			if (resRestTime == null || resRestTime.trim().length() == 0) {
				errorMsgs.put("resRestTime", "請輸入公休時間");// 塞入錯誤訊息
			} else {
				request.setAttribute("resRestTime", resRestTime);// 回傳資料訊息
			}

			System.out.println("resTypes="+ rtype);
			System.out.println("resName=" + resName);
			System.out.println("resCity=" + resCity);
			System.out.println("resArea=" + resArea);
			System.out.println("resAddress=" + resAddress);
			System.out.println("resPhone=" + resPhone);
			System.out.println("resOpentime=" + resOpentime);
			System.out.println("resClosetime=" + resClosetime);
			System.out.println("resRestTime=" + resRestTime);

		}

		System.out.println("memberAddress=" + memberAddress);// 自己驗證
		System.out.println("memberPassword=" + memberPassword);
		System.out.println("memberPassword2=" + memberPassword2);
		System.out.println("memberNicknName=" + memberNicknName);
		System.out.println("depId=" + depId);

		if (memberAddress == null || memberAddress.trim().length() == 0) {// 驗證帳號
			errorMsgs.put("memberAddress", "請輸入帳號");// 塞入錯誤訊息
		} else {
			request.setAttribute("memberAddress", memberAddress);// 回傳資料訊息
		}

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

		if (memberNicknName == null || memberNicknName.trim().length() == 0) {// 驗證暱稱
			errorMsgs.put("memberNicknName", "請輸入暱稱");// 塞入錯誤訊息
		} else {
			request.setAttribute("memberNicknName", memberNicknName);// 回傳資料訊息
		}
        

		
		
		
		
		
		
		if (errorMsgs.isEmpty() && rtype == 0) {// 如果沒有錯誤訊息
			GuestBean bean = new GuestBean();
			// 產生會員的bean物件,準備存放資料
			bean.setDepId(id);// 放部門編號
			bean.setMemberAddress(memberAddress);// 放帳號
			bean.setMemberNicknName(memberNicknName);// 放暱稱
			bean.setMemberPassword(memberPassword);// 放密碼
			
			
			GuestService guestService = new GuestService();
			if(sizeInBytes==0){
				sizeInBytes=39066;
				fis=getServletContext().getResourceAsStream("images/yel.jpg");
			}
			
	        guestService.insert(bean,fis, sizeInBytes);// 將會員的bean透過guestService的insert方法執行新增
			response.sendRedirect(request.getContextPath() + "/pages/information/registerSuccess.jsp");// 跳轉頁面
			return;
		}

		else if (errorMsgs.isEmpty() && id == 10) {

			GuestBean bean = new GuestBean();
			// 產生會員的bean物件,準備存放資料
			bean.setDepId(id);// 放部門編號
			bean.setMemberAddress(memberAddress);// 放帳號
			bean.setMemberNicknName(memberNicknName);// 放暱稱
			bean.setMemberPassword(memberPassword);// 放密碼
			GuestService guestService = new GuestService();
			if(sizeInBytes==0){
				sizeInBytes=39066;
				fis=getServletContext().getResourceAsStream("images/yel.jpg");
			}
			guestService.insert(bean,fis, sizeInBytes);

			GuestBean bean2 = new GuestBean();

			bean2.setOrg_Text(resName);
			bean2.setInformtel(resPhone);
			
			bean2.setInformaddress(road);
			bean2.setLat(lat);
			bean2.setLng(lng);
			bean2.setSpecial(special);

			bean2.setTime(time);

			bean2.setPrice(price);

			bean2.setServItem(type);
			bean2.setFrg_Id(frg_Id);
			bean2.setMemberAddress(memberAddress);

		
			guestService.insertrestaurant(bean2);

			response.sendRedirect(request.getContextPath() + "/pages/information/registerSuccess.jsp");// 跳轉頁面
			return;
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/pages/information/registerCustomer.jsp");// 停留本頁
			rd.forward(request, response);
			
		}
		
		
		
	}
}
