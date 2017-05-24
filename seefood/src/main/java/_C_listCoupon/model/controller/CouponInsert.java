package _C_listCoupon.model.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import _A_init.GlobalService;
import _C_listCoupon.model.CouponBean;
import _C_listCoupon.model.DAO.CouponDAOJndi;

//接收Insert.jsp的值
@WebServlet("/pages/_C_listCoupon/CouponInsert.do")

//
// 啟動檔案上傳的功能：
// 1. <form>標籤的 method屬性必須是"post", 而且
// enctype屬性必須是"multipart/form-data"
// 注意：enctype屬性的預設值為"application/x-www-form-urlencoded"
// 2. 定義可以挑選上傳檔案的表單欄位：
// <input type='file' name='user-defined_name' />
// 註: HTTP multipart request: 由Http客戶端(如瀏覽器)所建構的ㄧ種請求，用來
// 同時上傳表單資料與檔案。
//
// what-should-a-multipart-http-request-with-multiple-files-look-like?
// http://stackoverflow.com/questions/913626/what-should-a-multipart-http-request-with-multiple-files-look-like

// 在Servlet 3.0中，若要能夠處理瀏覽器送來的multipart request, Servlet必須
// 以註釋『javax.servlet.annotation.MultipartConfig』來宣告。
//
// MultipartConfig的屬性說明:
// location: 上傳之表單資料與檔案暫時存放在Server端之路徑。此路徑必須存在。
// fileSizeThreshold: 檔案的大小臨界值，超過此臨界值，上傳檔案會用存放在硬碟，
// 否則存放在主記憶體。
// maxFileSize: 上傳單一檔案之長度限制，如果超過此數值，Container會丟出例外
// maxRequestSize: 上傳所有檔案的總長度限制，如果超過此數值，Container會丟出例外
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
		* 1024 * 500 * 5)

public class CouponInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("--------------------------------------------");
		System.out.println("--------此為CouponInsert.java訊息-------------");
		// 準備存放錯誤訊息的List物件
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		// 設定輸入資料的編碼
		request.setCharacterEncoding("UTF-8");
		// 設定輸出的編碼
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();

		request.setAttribute("ErrMsg", errorMsgs);
		session.setAttribute("successMsg", successMsgs);
		try {
			int cpResId = 0;
			String cpResIdStr = "";

			String cpType = "";

			String cpData = "";
			Blob cpPhoto = null;

			int cpHowBonus = 0;
			String cpHowBonusStr = "";

			java.sql.Date cpStarTime = null;
			String cpStarTimeStr = "";

			java.sql.Date cpOverTime = null;
			String cpOverTimeStr = "";
			String org_Text = null;
			String fileName = "";
			InputStream fis = null;
			long sizeInBytes = 0;
			// request.getParts()方法傳回一個由javax.servlet.http.Part物件所組成的Collection
			// javax.servlet.http.Part: 代表上傳到Server的，可以是正常的表單資料(form data)，
			// 也可以上傳的檔案。
			// Part介面可以:
			// 1. 傳回欄位的名稱(<input>的name屬性)、大小、ContentType
			// 2. 每個Part的Header
			// 3. 刪除Part
			// 4. 將Part寫入硬碟
			Collection<Part> parts = request.getParts();
			if (parts != null) { // 如果這是一個上傳資料的表單
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					if (p.getContentType() == null) {
						if (fldName.equals("cpResId")) {
							cpResIdStr = value;
							cpResIdStr = cpResIdStr.trim();

							if (cpResIdStr == null || cpResIdStr.trim().length() == 0) {
								errorMsgs.put("errCpResId", "必須輸入餐廳");
							} else {
								try {
									cpResId = Integer.parseInt(cpResIdStr);
								} catch (NumberFormatException e) {
									e.printStackTrace();
									errorMsgs.put("errCpResId", "餐廳必須是數值");

								}
							}
							request.setAttribute("cpResId", cpResId);
						} else if (fldName.equals("cpType")) {
							cpType = value;
							if (cpType == null || cpType.trim().length() == 0) {
								errorMsgs.put("errCpType", "必須輸入餐廳種類");
							} else {
								request.setAttribute("cpType", cpType);
							}

						} else if (fldName.equals("cpData")) {
							cpData = value;
							if (cpData == null || cpData.trim().length() == 0) {
								errorMsgs.put("errCpData", "必須輸入內容");
							} else {
								request.setAttribute("cpData", cpData);
							}

						} else if (fldName.equals("cpHowBonus")) {
							cpHowBonusStr = value;
							cpHowBonusStr = cpHowBonusStr.trim();
							if (cpHowBonusStr == null || cpHowBonusStr.trim().length() == 0) {
								errorMsgs.put("errCpHowBonus", "必須輸入所需紅利");
							} else {
								try {
									cpHowBonus = Integer.parseInt(cpHowBonusStr);
								} catch (NumberFormatException e) {
									e.printStackTrace();
									e.printStackTrace();
									errorMsgs.put("errCpHowBonus", "價格必須是數值");
								}
							}
							request.setAttribute("price", cpHowBonusStr);
						} else if (fldName.equals("cpStarTime")) {
							cpStarTimeStr = value;
							cpStarTimeStr = cpStarTimeStr.trim();

							if (cpStarTimeStr == null || cpStarTimeStr.trim().length() == 0) {
								errorMsgs.put("errCpStarTimeStr", "必須輸入優惠開始時間");
							} else {
								try {
									cpStarTime = java.sql.Date.valueOf(cpStarTimeStr);
									System.out.println(cpStarTime);
								} catch (Exception e) {
									e.printStackTrace();
									e.printStackTrace();
									errorMsgs.put("errCpStarTimeStr", "時間輸入方式錯誤");
								}
							}
							request.setAttribute("cpStarTimeStr", cpStarTimeStr);
						} else if (fldName.equals("cpOverTime")) {
							cpOverTimeStr = value;
							cpOverTimeStr = cpOverTimeStr.trim();

							if (cpOverTimeStr == null || cpOverTimeStr.trim().length() == 0) {
								errorMsgs.put("errCpOverTime", "必須輸入優惠結束時間");
							} else {
								try {
									cpOverTime = java.sql.Date.valueOf(cpOverTimeStr);
								} catch (Exception e) {
									e.printStackTrace();
									e.printStackTrace();
									errorMsgs.put("errCpOverTime", "時間輸入方式錯誤");
								}
							}
							request.setAttribute("cpOverTime", cpOverTime);
						} else if (fldName.equals("org_Text")) {
							org_Text = value;
							if (org_Text == null || org_Text.trim().length() == 0) {
								errorMsgs.put("org_Text", "必須輸入餐廳名稱");
							} else {
								request.setAttribute("org_Text", org_Text);
							}
						}
					} else {
						System.out.println("起始為空:" + fileName);
						fileName = GlobalService.getFileName(p); // 此為圖片檔的檔名
						System.out.println("抓到檔名:" + fileName);
						fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);
						System.out.println("處理:" + fileName);

						if (fileName != null && fileName.trim().length() > 0) {
							sizeInBytes = p.getSize();
							fis = p.getInputStream();
						} else {
							errorMsgs.put("errPicture", "必須挑選圖片檔");
						}
					}
				}
			} else {
				errorMsgs.put("errTitle", "此表單不是上傳檔案的表單");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher rd = request.getRequestDispatcher("Insert.jsp");
				rd.forward(request, response);
				return;
			}
			System.out.println("org_Text=" + org_Text);
			CouponBean cp = new CouponBean(cpResId, cpType, cpData, fileName, cpHowBonus, cpStarTime, cpOverTime,
					org_Text);
			CouponDAOJndi cpDAO = new CouponDAOJndi();
			System.out.println("處理後:" + cp.getFileName());
			cpDAO.insertCoupon(cp, fis, sizeInBytes);
			successMsgs.put("success", "資料新增成功");
			System.out.println("資料新增成功");
			response.sendRedirect(response.encodeRedirectURL("DisplayPageCoupons"));
			return;
		} catch (Exception e) {
			e.printStackTrace();
			// errorMsgs.put("Exception", e.getMessage());

			System.out.println("CouponInsert.java發生錯誤");
			RequestDispatcher rd = request.getRequestDispatcher("Insert.jsp");
			rd.forward(request, response);
		}

		System.out.println("-----------------------------");
	}

}
