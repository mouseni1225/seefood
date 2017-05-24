package register;

import java.io.InputStream;
import java.util.List;

public interface GuestDAO {

	GuestBean insert(GuestBean bean,InputStream fis, long sizeInBytes);

	GuestBean update(String memberNicknName, String memberPassword, InputStream fis,long sizeInBytes,String memberAddress);          
	//update(String memberNicknName, String memberPassword, String memberAddress);
	GuestBean updatepass(String memberPassword, String memberAddress);

	GuestBean insertrestaurant(GuestBean bean2);

	GuestBean updaterestaurant( String org_Text,String informtel,String informaddress, String lat, String lng,
			 String special, String time, String price,String servItem,String memberAddress);

	GuestBean selectrestaurant(String memberAddress);
	
	List<GuestBean> select();
}
