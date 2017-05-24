package bonus;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.ArticleBean;
import article.ArticleDAOJdbc;
import login.MemberBean;
import login.MemberDAOJdbc;
import message.MessageBean;
import message.MessageDAOJdbc;

@WebServlet("/pages/article/bonuscontroller")
public class BonusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BonusController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("================來自BonusController.java的訊息================");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();// 取得連線
		System.out.println(request.getParameter("star"));
		int star = Integer.parseInt(request.getParameter("star"))*10; // 接收使用者打的分數
		MemberBean bean = (MemberBean) session.getAttribute("bean"); // 取得網頁裡session的會員資料
		ArticleBean articleid = (ArticleBean) session.getAttribute("articleid"); // 取得網頁裡session的文章資料
        System.out.println(articleid);
		Map<String, String> errors = new HashMap<String, String>(); // 建立物件存放訊息
		if (bean != null) { // 身分是會員的情況下
			// 確認目前會員是否已給過分數? 需先檢查bean.getUnderArticleId()是否為null?
			if (bean.getUnderArticleId() != null) { // 有打過分數
				String spilt[] = bean.getUnderArticleId().split(",");
				
				for (int i = 0; i < spilt.length; i++) {
					System.out.println(spilt[i]);
					System.out.println(String.valueOf(articleid.getArticleId())+"++++++++++++");
					if (spilt[i].equals(String.valueOf(articleid.getArticleId()))) { // 此篇打過分數,檔回本頁
						System.out.println("你已經給過分數囉");
						System.out.println(
								"spilt[" + i + "]:" + spilt[i] + " == " + "String.valueOf(articleid.getArticleId()):"
										+ String.valueOf(articleid.getArticleId()));
						// 測試用
						
						errors.put("already", "你已經給過分數囉"); // 放錯誤訊息,關鍵字"noStar.already"
						session.setAttribute("noStar", errors);// 關鍵字"noStar"
						List<MessageBean> mbean=new MessageDAOJdbc().selectAll(articleid.getArticleId());  //搜尋所有留言內容
						session.setAttribute("mbean", mbean);
						response.sendRedirect(response.encodeRedirectURL("/seefood/pages/article/seearticle.jsp#24"));
//						RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
//						rd.forward(request, response);
						System.out.println("====================訊息結束====================");
						return;
					}
				}
				System.out.println("沒有給過分數");// 確認沒有給過分
				String underArticleId = bean.getUnderArticleId() + "," + String.valueOf(articleid.getArticleId());// 將這次給分,串在上次紀錄後面
				bean = new MemberDAOJdbc().updata(bean.getMemberId(), underArticleId);// 將這次給分,記錄下來
				// 更新分數
				articleid = new ArticleDAOJdbc().update(articleid.getArticleId(), articleid.getArticlePeople() + 1,
						articleid.getArticleTotalStar() + star,
						(articleid.getArticleTotalStar() + star) / (articleid.getArticlePeople() + 1));
				List<MessageBean> mbean=new MessageDAOJdbc().selectAll(articleid.getArticleId());  //搜尋所有留言內容
				session.setAttribute("mbean", mbean);
				session.setAttribute("articleid", articleid); // 更新後的文章資料傳回頁面
				session.setAttribute("bean", bean); // 更新後的會員資料傳回頁面
				errors.put("thanks", "謝謝你的評分"); // 放訊息,關鍵字"noStar.thanks"
				session.setAttribute("noStar", errors);// 關鍵字"noStar"
				response.sendRedirect(response.encodeRedirectURL("/seefood/pages/article/seearticle.jsp#24"));
//				RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
//				rd.forward(request, response);
				System.out.println("====================訊息結束====================");
				return;

			} else if (bean.getUnderArticleId() == null) { // 頭一次打分數
				System.out.println("頭一次打分數");
				System.out.println(bean.getMemberId());
				System.out.println(String.valueOf(articleid.getArticleId()));
				bean = new MemberDAOJdbc().updata(bean.getMemberId(), String.valueOf(articleid.getArticleId()));// 將這次給分,記錄下來
				// 更新分數
				int a=(articleid.getArticleTotalStar() + star) / (articleid.getArticlePeople() + 1);
				int b=0;
				if(a==50)
					b=50;
				else if(44<a&&a<50)
					b=45;
				else if(39<a&&a<45)
					b=40;
				else if(34<a&&a<40)
					b=35;
				else if(29<a&&a<35)
					b=30;
				else if(24<a&&a<30)
					b=25;
				else if(19<a&&a<25)
					b=20;
				else if(14<a&&a<20)
					b=15;
				else if(9<a&&a<15)
					b=10;
				else if(4<a&&a<10)
					b=5;
				else if(0<a&&a<5)
					b=0;
				
				articleid = new ArticleDAOJdbc().update(articleid.getArticleId(), articleid.getArticlePeople() + 1,
						articleid.getArticleTotalStar() + star,b);
if(new MessageDAOJdbc().selectAll(articleid.getArticleId())==null){
	System.out.println("留言內容為空");
	session.setAttribute("articleid", articleid); // 更新後的文章資料傳回頁面
	session.setAttribute("bean", bean); // 更新後的會員資料傳回頁面
	errors.put("thanks", "謝謝你的評分"); // 放訊息,關鍵字"noStar.thanks"
	session.setAttribute("noStar", errors);// 關鍵字"noStar"
	response.sendRedirect(response.encodeRedirectURL("/seefood/pages/article/seearticle.jsp#24"));
//	RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
//	rd.forward(request, response);
	System.out.println("====================訊息結束====================");
	return;
}
				List<MessageBean> mbean=new MessageDAOJdbc().selectAll(articleid.getArticleId()); //搜尋所有留言內容
				System.out.println("有留言內容");
				session.setAttribute("mbean", mbean);
				session.setAttribute("articleid", articleid); // 更新後的文章資料傳回頁面
				session.setAttribute("bean", bean); // 更新後的會員資料傳回頁面
				errors.put("thanks", "謝謝你的評分"); // 放訊息,關鍵字"noStar.thanks"
				session.setAttribute("noStar", errors);// 關鍵字"noStar"
				response.sendRedirect(response.encodeRedirectURL("/seefood/pages/article/seearticle.jsp#24"));
//				RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
//				rd.forward(request, response);
				System.out.println("====================訊息結束====================");
				return;
			}

		} else if (bean == null) { // 遊客打分數用
			System.out.println("遊客打分數用");
			// 更新分數
			int a=(articleid.getArticleTotalStar() + star) / (articleid.getArticlePeople() + 1);
			int b=0;
			if(a==50)
				b=50;
			else if(44<a&&a<50)
				b=45;
			else if(39<a&&a<45)
				b=40;
			else if(34<a&&a<40)
				b=35;
			else if(29<a&&a<35)
				b=30;
			else if(24<a&&a<30)
				b=25;
			else if(19<a&&a<25)
				b=20;
			else if(14<a&&a<20)
				b=15;
			else if(9<a&&a<15)
				b=10;
			else if(4<a&&a<10)
				b=5;
			else if(0<a&&a<5)
				b=0;
			
			articleid = new ArticleDAOJdbc().update(articleid.getArticleId(), articleid.getArticlePeople() + 1,
					articleid.getArticleTotalStar() + star,b);
			List<MessageBean> mbean=new MessageDAOJdbc().selectAll(articleid.getArticleId());  //搜尋所有留言內容
			System.out.println(articleid.getArticleId());
			session.setAttribute("mbean", mbean);
			session.setAttribute("articleid", articleid); // 更新後的文章資料傳回頁面
			errors.put("thanks", "謝謝你的評分"); // 放訊息,關鍵字"noStar.thanks"
			session.setAttribute("noStar", errors);// 關鍵字"noStar"
			response.sendRedirect(response.encodeRedirectURL("/seefood/pages/article/seearticle.jsp#24"));
//			RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
//			rd.forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}

	}

}
