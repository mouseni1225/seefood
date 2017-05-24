package _C_listCoupon.model;

import java.sql.Blob;

public class CouponBean implements java.io.Serializable { // JavaBean必須實作java.io.Serializable

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int cpId;
	private int cpResId;
	private String resName;
	private String cpType;
	private String cpData;
	private Blob cpPhoto;
	private int cpHowBonus;
	private java.util.Date cpStarTime;
	private java.util.Date cpOverTime;
	private String fileName;
	private String org_Text;
	
	
	public CouponBean() {

	}

	// ↓建構子用於 CouponDelete.java
	public CouponBean(int cpId, int cpResId, String cpType, String cpData, String fileName, int cpHowBonus,
			java.util.Date cpStarTime, java.util.Date cpOverTime) {
		super();
		this.cpId = cpId;
		this.cpResId = cpResId;
		this.cpType = cpType;
		this.cpData = cpData;
		this.fileName = fileName;
		this.cpHowBonus = cpHowBonus;
		this.cpStarTime = cpStarTime;
		this.cpOverTime = cpOverTime;

	}

	// CouponInsert
	public CouponBean(int cpResId, String cpType, String cpData, String fileName, int cpHowBonus, java.util.Date cpStarTime,
			java.util.Date cpOverTime ,String org_Text) {
		super();
		this.cpResId = cpResId;
		this.cpType = cpType;
		this.cpData = cpData;
		this.fileName = fileName;
		this.cpHowBonus = cpHowBonus;
		this.cpStarTime = cpStarTime;
		this.cpOverTime = cpOverTime;
		this.org_Text = org_Text;
	}

	@Override
	public String toString() {
		return "couponBean [cpResId=" + cpResId + ", cpType=" + cpType + ", cpData=" + cpData + ", cpPhoto=" + cpPhoto
				+ ", cpHowBonus=" + cpHowBonus + ", cpStarTime=" + cpStarTime + ", cpOverTime=" + cpOverTime + "]";
	}

	public int getCpId() {
		return cpId;
	}

	public void setCpId(int cpId) {
		this.cpId = cpId;
	}

	public int getCpResId() {
		return cpResId;
	}

	public void setCpResId(int cpResId) {
		this.cpResId = cpResId;
	}

	public String getCpType() {
		return cpType;
	}

	public void setCpType(String cpType) {
		this.cpType = cpType;
	}

	public String getCpData() {
		return cpData;
	}

	public void setCpData(String cpData) {
		this.cpData = cpData;
	}

	public Blob getCpPhoto() {
		return cpPhoto;
	}

	public void setCpPhoto(Blob cpPhoto) {
		this.cpPhoto = cpPhoto;
	}

	public int getCpHowBonus() {
		return cpHowBonus;
	}

	public void setCpHowBonus(int cpHowBonus) {
		this.cpHowBonus = cpHowBonus;
	}

	public java.util.Date getCpStarTime() {
		return cpStarTime;
	}

	public void setCpStarTime(java.util.Date cpStarTime) {
		this.cpStarTime = cpStarTime;
	}

	public java.util.Date getCpOverTime() {
		return cpOverTime;
	}

	public void setCpOverTime(java.util.Date cpOverTime) {
		this.cpOverTime = cpOverTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getOrg_Text() {
		return org_Text;
	}

	public void setOrg_Text(String org_Text) {
		this.org_Text = org_Text;
	}

}
