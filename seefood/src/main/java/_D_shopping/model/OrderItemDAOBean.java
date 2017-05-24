package _D_shopping.model;

import java.util.Date;

public class OrderItemDAOBean {

	int seqno;
	int orderNo;
	int cpId;
	int cpresId;
	String cpData;
	int amount;
	int howCoupon;
	java.util.Date cpStarTime;
	java.util.Date cpOverTime;
	String org_Text;
	
	public OrderItemDAOBean(int seqno, int orderNo, int cpId, int cpresId, String cpData, int amount, int howCoupon,
			java.util.Date cpStarTime, Date cpOverTime,String org_Text) {
		super();
		this.seqno = seqno;
		this.orderNo = orderNo;
		this.cpId = cpId;
		this.cpresId = cpresId;
		this.cpData = cpData;
		this.amount = amount;
		this.howCoupon = howCoupon;
		this.cpStarTime = cpStarTime;
		this.cpOverTime = cpOverTime;
		this.org_Text=org_Text;
	}

	public OrderItemDAOBean() {

	}

	public int getSeqno() {
		return seqno;
	}

	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getCpId() {
		return cpId;
	}

	public void setCpId(int cpId) {
		this.cpId = cpId;
	}

	public String getCpData() {
		return cpData;
	}

	public void setCpData(String cpData) {
		this.cpData = cpData;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getHowCoupon() {
		return howCoupon;
	}

	public void setHowCoupon(int howCoupon) {
		this.howCoupon = howCoupon;
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

	public int getCpresId() {
		return cpresId;
	}

	public void setCpresId(int cpresId) {
		this.cpresId = cpresId;
	}

	public String getOrg_Text() {
		return org_Text;
	}

	public void setOrg_Text(String org_Text) {
		this.org_Text = org_Text;
	}

	
}