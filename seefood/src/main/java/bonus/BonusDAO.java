package bonus;

import login.MemberBean;

public interface BonusDAO {
	
	MemberBean selectBonus(int memberId);  //搜尋會員目前的紅利數
	
	MemberBean updataBonus(int memberId,int memberBonus); //更新會員增加或減少多少紅利數(登入用)
	
	

}
