package message;

import java.util.List;

public interface MessageDAO {
	int insert(MessageBean mbean);  //會員留言用
	
	List<MessageBean> selectAll(int articleId);      //顯示目前文章的留言

}
