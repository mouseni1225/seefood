package _03_listCoupon.model;

import java.sql.Blob;
import java.time.LocalDateTime;

public class CouponBean implements java.io.Serializable { // JavaBean必須實作java.io.Serializable

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int cpId;
	private int cpResId;
	private int cpType;
	private String cpData;
	private Blob cpPhoto;
	private int cpHowBonus;
	private LocalDateTime cpStarTime;
	private java.util.Date cpOverTime;

	
	public CouponBean(){
		
	}
	//↓建構子用於 CouponDelete.java 
	public CouponBean(int cpId, int cpResId, int cpType, String cpData, Blob cpPhoto, int cpHowBonus,
			LocalDateTime cpStarTime, java.util.Date cpOverTime) {
		super();
		this.cpId = cpId;
		this.cpResId = cpResId;
		this.cpType = cpType;
		this.cpData = cpData;
		this.cpPhoto = cpPhoto;
		this.cpHowBonus = cpHowBonus;
		this.cpStarTime = cpStarTime;
		this.cpOverTime = cpOverTime;

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

	public int getCpType() {
		return cpType;
	}

	public void setCpType(int cpType) {
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

	public LocalDateTime getCpStarTime() {
		return cpStarTime;
	}

	public void setCpStarTime(LocalDateTime cpStarTime) {
		this.cpStarTime = cpStarTime;
	}

	public java.util.Date getCpOverTime() {
		return cpOverTime;
	}

	public void setCpOverTime(java.util.Date cpOverTime) {
		this.cpOverTime = cpOverTime;
	}

}
