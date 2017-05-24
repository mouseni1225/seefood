package article;

import java.io.InputStream;
import java.util.List;

public interface ArticleDAO {
	List<ArticleBean> selectAll(); // 一進入美食文章網頁就列出所有文章

	List<ArticleBean> selectTitle(String articleTitle); // 遊客想查詢指定文章,有多筆結果的情況需用List泛型

	List<ArticleBean> selectNicknName(String memberNicknName); // 遊客想查詢指定文章,有多筆結果的情況需用List泛型

	List<ArticleBean> selectMemberId(int memberId); // 會員查詢自己文章,有多筆結果的情況需用List泛型

	ArticleBean insert(ArticleBean bean,InputStream is, long size); // 會員新增文章
	
	ArticleBean update(int articleId,String articleTitle,String articleData,String memberNicknName,String cutData,InputStream is,long sizeInBytes);  // 會員修改文章

	ArticleBean selectarticleId(int articleId);//修改完成後立即顯示成果
	
	ArticleBean selecttopone(); //找最新一筆資料
	
	int delect(int articleId); //刪除文章
	
	ArticleBean update(int articleId,int articlePeople,int articleTotalStar,int articleAverageStar);//修改文章分數
}
