package login;

public class MemberBean {
	private int memberId;
	private int depId;
	private String memberAddress;
	private String memberPassword;
	private String memberNicknName;
	private String memberBigPhoto;
	private int memberBonus;
	private java.util.Date loginTime;
	private String underArticleId;
	private String org_Text;
	

	

	@Override
	public String toString() {
		return "MemberBean [memberId=" + memberId + ", depId=" + depId + ", memberAddress=" + memberAddress
				+ ", memberPassword=" + memberPassword + ", memberNicknName=" + memberNicknName + ", memberBigPhoto="
				+ memberBigPhoto + ", memberBonus=" + memberBonus + ", loginTime=" + loginTime + ", underArticleId="
				+ underArticleId + ", org_Text=" + org_Text + "]";
	}

	public String getUnderArticleId() {
		return underArticleId;
	}

	public void setUnderArticleId(String underArticleId) {
		this.underArticleId = underArticleId;
	}

	public java.util.Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(java.util.Date loginTime) {
		this.loginTime = loginTime;
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

	public String getMemberBigPhoto() {
		return memberBigPhoto;
	}

	public void setMemberBigPhoto(String memberBigPhoto) {
		this.memberBigPhoto = memberBigPhoto;
	}

	public int getMemberBonus() {
		return memberBonus;
	}

	public void setMemberBonus(int memberBonus) {
		this.memberBonus = memberBonus;
	}

	public String getOrg_Text() {
		return org_Text;
	}

	public void setOrg_Text(String org_Text) {
		this.org_Text = org_Text;
	}

}
