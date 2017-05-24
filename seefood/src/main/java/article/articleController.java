package article;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.MemberBean;
import message.MessageBean;
import message.MessageDAOJdbc;

@WebServlet("/pages/article/article.controller")
public class articleController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("================來自articleController.java的訊息================");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();// 取得連線
		//Map<String, String> errors = new HashMap<String, String>();// 建立物件存放錯誤訊息
		String search = request.getParameter("search"); // 取得搜索關鍵字
		String select = request.getParameter("select"); // 取得搜索選項
		String id = request.getParameter("id");// 取得文章編號
		String articleTitle = request.getParameter("title"); // 取得文章標題
		String delect = request.getParameter("delect"); // 取得欲刪除的文章編號
		MemberBean bean = null;

		if (delect != null) { // 執行刪除動作
			System.out.println("執行刪除動作");
			int delectId = Integer.parseInt(delect); // 執行刪除方法需要數字型態的文章編號
			int msg = new ArticleDAOJdbc().delect(delectId); // 執行刪除方法會回傳數字  成功回傳1 失敗回傳0													
			if (msg == 1) {
				System.out.println("刪除成功");
				bean = (MemberBean) session.getAttribute("bean"); // 取得會員編號
				List<ArticleBean> select2 = new ArticleDAOJdbc().selectMemberId(bean.getMemberId()); // 透過會員編號搜尋出結果
				request.setAttribute("selectMemberId", select2); // 將結果放進request回傳
			} else
				System.out.println("刪除失敗"); // 測試

			RequestDispatcher rd = request.getRequestDispatcher("/pages/article/changearticle.jsp");
			rd.forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}

		if (id != null && articleTitle == null) { // 有id 沒標題 >>執行閱讀文章
			System.out.println("執行閱讀文章和留言板");
			int articleId = Integer.parseInt(id);
			ArticleBean articleid = new ArticleDAOJdbc().selectarticleId(articleId);
			session.setAttribute("articleid", articleid);
			List<MessageBean> mbean=new MessageDAOJdbc().selectAll(articleId);  //搜尋所有留言內容
			request.setAttribute("mbean", mbean);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
			rd.forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}

		if (id != null && articleTitle != null) { // 有id 有標題 >>執行修改文章
			System.out.println("執行修改文章");
			int articleId = Integer.parseInt(id);
			ArticleBean articleid = new ArticleDAOJdbc().selectarticleId(articleId);
			session.setAttribute("articleid", articleid);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/article/surechange.jsp");
			rd.forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}

		// 驗證資料

		if (search == null || search.trim().length() == 0) {
			// 起始顯示搜尋所有文章的結果,沒有搜索關鍵字同樣搜尋所有文章
			System.out.println("執行搜尋所有文章");
			List<ArticleBean> artic = new ArticleDAOJdbc().selectAll();
			request.setAttribute("selectTitle", artic);
			request.getRequestDispatcher("/pages/article/showallarticle.jsp").forward(request, response);
			System.out.println("====================訊息結束====================");
			return;

		} else if (!search.isEmpty()) {
			// 由於是用模糊查詢,查詢條件寫法是 %關鍵字% ,但%無法直接打進SQL語法只能放進 "?"裡
			search = "%" + search + "%";
			if ("articleTitle".equals(select)) {
				System.out.println("執行搜尋標題");
				List<ArticleBean> artic = new ArticleDAOJdbc().selectTitle(search); // 產生物件artic存放找到的文章資料

				request.setAttribute("selectTitle", artic);
				request.getRequestDispatcher("/pages/article/showallarticle.jsp").forward(request, response);
				System.out.println("====================訊息結束====================");
				return;
			}
			if ("nicknName".equals(select)) {
				System.out.println("執行搜尋作者");
				List<ArticleBean> artic = new ArticleDAOJdbc().selectNicknName(search); // 產生物件artic存放找到的文章資料
				request.setAttribute("selectTitle", artic);
				request.getRequestDispatcher("/pages/article/showallarticle.jsp").forward(request, response);
				System.out.println("====================訊息結束====================");
				return;
			}
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("================來自articleController.java的訊息================");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();// 取得連線
		MemberBean bean = (MemberBean) session.getAttribute("bean"); // 取得會員資料
		String lookmessage=request.getParameter("lookmessage");      //取得留言內容
		String Id=request.getParameter("articleId");          //取得文章ID
		
		MessageBean msgbean=new MessageBean();
		int articleId = Integer.parseInt(Id);
		msgbean.setArticleId(articleId);
		msgbean.setLookmessage(lookmessage);
		msgbean.setMemberBigPhoto(null);   //待改
		
		
		if(bean==null){
			msgbean.setMemberNicknName("訪客");
			msgbean.setMemberId(0);
		}else if(bean!=null){
			msgbean.setMemberNicknName(bean.getMemberNicknName());
			msgbean.setMemberId(bean.getMemberId());
		}
		
		int i=new MessageDAOJdbc().insert(msgbean);
		if(i==1)
			System.out.println("留言新增成功");
		
		
			System.out.println("執行閱讀文章和留言板");
			
			ArticleBean articleid = new ArticleDAOJdbc().selectarticleId(articleId);
			session.setAttribute("articleid", articleid);
			List<MessageBean> mbean=new MessageDAOJdbc().selectAll(articleId);  //搜尋所有留言內容
			session.setAttribute("mbean", mbean);
			response.sendRedirect(response.encodeRedirectURL("/seefood/pages/article/seearticle.jsp#32"));
			
//			RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
//			String a="/pages/article/seearticle.jsp#32";
//			RequestDispatcher rd = request.getRequestDispatcher(a);
//			rd.forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		

	}
}
