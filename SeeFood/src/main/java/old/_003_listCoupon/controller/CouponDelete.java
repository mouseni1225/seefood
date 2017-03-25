package old._003_listCoupon.controller;

import java.io.IOException;
import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import old._003_listCoupon.model.CouponBean;
import old._003_listCoupon.model.CouponService;

//點選刪除button時會執行此程式
@WebServlet("/_03_listCoupon/CouponDelete.do")
public class CouponDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CouponDelete() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 準備存放錯誤訊息的List物件
		List<String> errorMessage = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMessage);
		// 設定輸入資料的編碼
		request.setCharacterEncoding("UTF-8");
		int CpId = 0;
		int CpResId = 0;
		int CpType = 0;
		Blob CpPhoto = null;
		int CpHowBonus = 0;
		LocalDateTime CpStarTime = null;
		java.sql.Date CpOverTime = null;

		// 1. 檢查cpId欄位
		String cpId = request.getParameter("cpId");
		if (cpId != null && cpId.trim().length() > 0) {
			try {
				CpId = Integer.parseInt(cpId.trim()); // 因為CouponBean內的cpId型態為int所以要轉型態
			} catch (NumberFormatException e) {
				errorMessage.add("欄位必須為數值");
			}
		} else if (cpId == null || cpId.trim().length() == 0) {
			errorMessage.add("cpId欄必須輸入");
		}
		// 2. 檢查cpResId欄位
		String cpResId = request.getParameter("cpResId");
		if (cpResId == null || cpResId.trim().length() == 0) {
			try {
				CpResId = Integer.parseInt(cpResId.trim());
			} catch (NumberFormatException e) {
				errorMessage.add("cpResId欄必須為數值");
			}
		} else if (cpResId == null || cpResId.trim().length() == 0) {
			errorMessage.add("cpResId欄必須輸入");
		}

		// 3.檢查cpType欄位
		String cpType = request.getParameter("cpType");
		if (cpType != null && cpType.trim().length() > 0) {
			try {
				CpType = Integer.parseInt(cpType.trim()); // 因為CouponBean內的cpType型態為int所以要轉型態
			} catch (NumberFormatException e) {
				errorMessage.add("cpType欄位必須為數值");
			}
		} else if (cpType == null || cpType.trim().length() == 0) {
			errorMessage.add("請輸入料理種類");
		}

		// 4.檢查cpData欄位
		String cpData = request.getParameter("cpData");
		if (cpData != null && cpData.trim().length() > 0) {
			errorMessage.add("請輸入內容");
		}

		// 5.檢查cpPhoto欄位
		String cpPhoto = request.getParameter("cpPhoto");
		if (cpPhoto != null && cpPhoto.trim().length() > 0) {

			try {
				byte[] test = cpPhoto.getBytes("UTF-8");
				CpPhoto = new javax.sql.rowset.serial.SerialBlob(test);// 因為CouponBean內的cpPhoto型態為Blob所以要轉型態
			} catch (Exception e) {
				errorMessage.add("必須為圖片");
			}
		} else if (cpPhoto == null || cpPhoto.trim().length() == 0) {
			errorMessage.add("請上傳圖片");
		}
		// 6. 檢查cpHowBonus欄位
		String cpHowBonus = request.getParameter("cpHowBonus");
		if (cpHowBonus != null && cpHowBonus.trim().length() > 0) {
			try {
				CpHowBonus = Integer.parseInt(cpHowBonus);// 因為CouponBean內的cpHowBonus型態為int所以要轉型態
			} catch (NumberFormatException e) {
				errorMessage.add("請輸入所需紅利");
			}

		}
		// 7. 檢查cpStarTime欄位
		String cpStarTime = request.getParameter("cpStarTime");
		if (cpStarTime != null && cpStarTime.trim().length() > 0) {
			errorMessage.add("請輸入優惠開始時間");
		}
		// 8. 檢查cpOverTime欄位
		String cpOverTime = request.getParameter("cpOverTime");
		if (cpOverTime != null && cpOverTime.trim().length() > 0) {
			
			try {
				CpOverTime=java.sql.Date.valueOf(cpOverTime);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(cpOverTime == null || cpOverTime.trim().length() == 0){
			errorMessage.add("請輸入優惠結束時間");
		}

		if (!errorMessage.isEmpty()) { // 如果有錯誤訊息
			RequestDispatcher rd = request.getRequestDispatcher("update.jsp");// 連回update.jsp
			rd.forward(request, response);
			return;
		}
		CouponBean bean = new CouponBean(CpId, CpResId, CpType, cpData, CpPhoto, CpHowBonus, CpStarTime, CpOverTime);
		CouponService service = new CouponService();
		service.delete(bean);// 刪除
		response.sendRedirect("maintain.jsp"); // 成功就連回maintain.jsp
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
