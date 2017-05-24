package _C_listCoupon.model;

import java.util.Date;

//放訂單 經由shoppingcart過來
public class OrderItemBean {

	int cpId=0;
	int cpResId=0;
	String cpType;
	String cpData ;
	int cpHowBonus=0;
	java.util.Date cpStarTime = null;
	java.util.Date cpOverTime = null;
	int qty = 0 ; 
	String resName;
	String org_Text;
	
	
	public OrderItemBean(int cpId, int cpResId, String cpType, String cpData, int cpHowBonus, java.util.Date cpStarTime,
			Date cpOverTime, int qty,String resName,String org_Text) {
		super();
		this.cpId = cpId;
		this.cpResId = cpResId;
		this.cpType = cpType;
		this.cpData = cpData;
		this.cpHowBonus = cpHowBonus;
		this.cpStarTime = cpStarTime;
		this.cpOverTime = cpOverTime;
		this.qty = qty;
		this.resName = resName;
		this.org_Text=org_Text;
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

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
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