package register;

import java.sql.Blob;
import java.util.Date;

public class GuestBean {
	//一般會員資料
	private int memberId;
	private int depId;
	private String memberAddress;
	private String memberPassword;
	private String memberNicknName;
	private Blob memberBigPhoto;
	private int memberBonus;
	//餐廳資料
	private int id;
	private String servItem;
    private String org_Text;
    private String lat;
    private String lng;
    private String informaddress;
    private String informtel;
    private String special;
    private String time;
    private String price;
    private String frg_Id;
    
    private String resTotalStar;
    private String resAverageStar;
    private String resPeople;
    private String img;
	
    

	@Override
	public String toString() {
		return "GuestBean [memberId=" + memberId + ", depId=" + depId + ", memberAddress=" + memberAddress
				+ ", memberPassword=" + memberPassword + ", memberNicknName=" + memberNicknName + ", memberBigPhoto="
				+ memberBigPhoto + ", memberBonus=" + memberBonus + ", id=" + id + ", servItem=" + servItem
				+ ", org_Text=" + org_Text + ", lat=" + lat + ", lng=" + lng + ", informaddress=" + informaddress
				+ ", informtel=" + informtel + ", special=" + special + ", time=" + time + ", price=" + price
				+ ", frg_Id=" + frg_Id + ", resTotalStar=" + resTotalStar + ", resAverageStar=" + resAverageStar
				+ ", resPeople=" + resPeople + ", img=" + img + "]";
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getDepId() {
		return depId;
	}

	public void setDepId(int depId) {
		this.depId = depId;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberNicknName() {
		return memberNicknName;
	}

	public void setMemberNicknName(String memberNicknName) {
		this.memberNicknName = memberNicknName;
	}

	public Blob getMemberBigPhoto() {
		return memberBigPhoto;
	}

	public void setMemberBigPhoto(Blob memberBigPhoto) {
		this.memberBigPhoto = memberBigPhoto;
	}

	public int getMemberBonus() {
		return memberBonus;
	}

	public void setMemberBonus(int memberBonus) {
		this.memberBonus = memberBonus;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServItem() {
		return servItem;
	}

	public void setServItem(String servItem) {
		this.servItem = servItem;
	}

	public String getOrg_Text() {
		return org_Text;
	}

	public void setOrg_Text(String org_Text) {
		this.org_Text = org_Text;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getInformaddress() {
		return informaddress;
	}

	public void setInformaddress(String informaddress) {
		this.informaddress = informaddress;
	}

	public String getInformtel() {
		return informtel;
	}

	public void setInformtel(String informtel) {
		this.informtel = informtel;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getFrg_Id() {
		return frg_Id;
	}

	public void setFrg_Id(String frg_Id) {
		this.frg_Id = frg_Id;
	}

	public String getResTotalStar() {
		return resTotalStar;
	}

	public void setResTotalStar(String resTotalStar) {
		this.resTotalStar = resTotalStar;
	}

	public String getResAverageStar() {
		return resAverageStar;
	}

	public void setResAverageStar(String resAverageStar) {
		this.resAverageStar = resAverageStar;
	}

	public String getResPeople() {
		return resPeople;
	}

	public void setResPeople(String resPeople) {
		this.resPeople = resPeople;
	}

	
	
}
