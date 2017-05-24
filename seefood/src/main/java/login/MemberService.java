package login;

import java.util.Arrays;

public class MemberService {
	
	private MemberDAO memberDao=new MemberDAOJdbc();
	
	public boolean login(String userId,String userPsd){
		MemberBean bean=memberDao.select(userId);
		if(bean!=null){
			if(userPsd!=null&&userPsd.trim().length()!=0){
				byte[] pass=userPsd.getBytes();
				byte[] temp=bean.getMemberPassword().getBytes();
				if(Arrays.equals(pass, temp)){
					System.out.println("密碼比對一致");
					return true;
				}
			}
		}
		System.out.println("密碼比對不一致");
		return false;
	}
	
	public MemberBean nicknName(String userId,String userPsd){
		MemberBean bean=memberDao.select(userId);
		return bean;
	}

}
