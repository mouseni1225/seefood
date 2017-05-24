package register;

import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import register.dao.GuestDAOJdbc;

public class GuestService {
	// private GuestDAO guestDAO;
	//
	// public GuestService(GuestDAO guestDAO) {
	// this.guestDAO = guestDAO;
	// }
	private GuestDAO guestDAO = new GuestDAOJdbc();

	// 一般會員區塊
	public GuestBean insert(GuestBean bean,InputStream fis, long sizeInBytes) {
		GuestBean result = null;
		if (bean != null) {
			result = guestDAO.insert(bean,fis, sizeInBytes);
			System.out.println("result=" + result);
		}

		return result;
	}

	public GuestBean update(String memberNicknName, String memberPassword, InputStream fis, long sizeInBytes,String memberAddress) {
		GuestBean result = null;

		result = guestDAO.update(memberNicknName, memberPassword, fis, sizeInBytes, memberAddress);
				//.update(memberAddress, memberPassword, memberNicknName,fis, sizeInBytes);
		System.out.println("Finish");
		return result;
	}
	
	//一般會員密碼
	public GuestBean updatepass(String memberPassword, String memberAddress) {
		GuestBean result = null;

		result = guestDAO.updatepass(memberPassword, memberAddress);
		System.out.println("Finish pass");
		return result;
	}

	// 餐廳會員區塊
	public GuestBean insertrestaurant(GuestBean bean2) {
		GuestBean result = null;
		if (bean2 != null) {
			result = guestDAO.insertrestaurant(bean2);
			System.out.println("result=" + result);
		}

		return result;
	}

	public GuestBean selectrestaurant(String memberAddress) {
		GuestBean result = null;

		result = guestDAO.selectrestaurant(memberAddress);

		return result;
	}

	public GuestBean updaterestaurant(String servItem, String org_Text, String lat, String lng, String informaddress,
			String informtel, String special, String time, String price,String memberAddress) {
		GuestBean result = null;
		result = guestDAO.updaterestaurant(servItem, org_Text, lat, lng, informaddress, informtel, special, time, price, memberAddress);
		System.out.println("有跑到更新啦");
		return null;
	}
}