package _D_shopping.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import _C_listCoupon.model.OrderItemBean;

public class ShoppingCart {

	private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	public ShoppingCart() {
	}
	public Map<Integer, OrderItemBean>  getContent() {  // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(int cpId, OrderItemBean  oi) {
		if (oi.getQty() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(cpId) == null ) {
		    cart.put(cpId, oi);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderItemBean oib = cart.get(cpId);
			// 加購的數量：oi.getQty()
			// 原有的數量：oib.getQty()			
			oib.setQty(oi.getQty() + oib.getQty());
		}
	}
	// 修改商品的數量
	public boolean modifyQty(int cpId, OrderItemBean  oi) {
		if ( cart.get(cpId) != null && oi.getQty() > 0 ) {
	       cart.put(cpId, oi);
	       return true;
		} else {
		   return false;
		}
	}
	public boolean modifyQty(int cpId, int  newQty) {
		if ( cart.get(cpId) != null ) {
		   OrderItemBean  oi = (OrderItemBean)cart.get(cpId);
		   oi.setQty(newQty);
	       cart.put(cpId, oi);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteBook(int cpId) {
		if ( cart.get(cpId) != null ) {
	       cart.remove(cpId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public int getSubtotal(){
		int subTotal = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			int CpHowBonus    = cart.get(n).getCpHowBonus();
			int    qty      = cart.get(n).getQty();
			subTotal +=  CpHowBonus  * qty;
		}
		return subTotal;
	}
	public void listCart() {
		Set<Integer> set = cart.keySet();
		for(Integer k : set){
			System.out.printf("cpId=%3d,  Qty=%3d,  price=%5.2f,  discount=%6.2f\n" , k , cart.get(k).getQty(), cart.get(k).getCpHowBonus());
		}
		System.out.println("------------------");
	}
}
