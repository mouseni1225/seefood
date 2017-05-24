package login;

public interface MemberDAO {
	MemberBean select(String memberAddress);   //登入用
	
	MemberBean updata(java.util.Date loginTime,String memberAddress); //更新登入時間
	
	MemberBean updata(int memberId,String underArticleId);  //紀錄會員評分過的文章
	
	MemberBean select(int memberId);

}
