package _D_shopping.model;

import java.util.*;

// 本類別存放訂單資料
public class OrderBean {

	int orderNo;
	String memberNicknName;
	int total;
	java.util.Date orderDate;
	String cancelTag;
	String org_Text;
	
	
	
	List<OrderItemDAOBean> items = new ArrayList<OrderItemDAOBean>();

	public OrderBean() {
		super();
	}

	public OrderBean(String memberNicknName, int total, Date orderDate, String cancelTag,
			List<OrderItemDAOBean> items) {
		super();
		
		this.memberNicknName = memberNicknName;
		this.total = total;
		this.orderDate = orderDate;
		this.cancelTag = cancelTag;
		this.items = items;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberNicknName() {
		return memberNicknName;
	}

	public void setMemberNicknName(String memberNicknName) {
		this.memberNicknName = memberNicknName;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public java.util.Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(java.util.Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getCancelTag() {
		return cancelTag;
	}

	public void setCancelTag(String cancelTag) {
		this.cancelTag = cancelTag;
	}

	public List<OrderItemDAOBean> getItems() {
		return items;
	}

	public void setItems(List<OrderItemDAOBean> items) {
		this.items = items;
	}

	public String getOrg_Text() {
		return org_Text;
	}

	public void setOrg_Text(String org_Text) {
		this.org_Text = org_Text;
	}

}
