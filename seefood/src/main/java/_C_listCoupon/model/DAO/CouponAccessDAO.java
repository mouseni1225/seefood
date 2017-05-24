package _C_listCoupon.model.DAO;

import java.sql.Blob;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import _C_listCoupon.model.CouponBean;

public interface CouponAccessDAO {
	// 計算總共有幾頁
	public int getTotalPages() throws SQLException;

	// 計算紀錄總筆數
	public int getRecordCounts() throws SQLException;

	public CouponBean getCoupon();

	public List<CouponBean> getPageCoupon();

	// 依據產品ID去單筆查詢
	public CouponBean select(int cpid);

	// 將值回傳給maintain.jsp用
	public List<CouponBean> getAllCoupon();

	public List<CouponBean> select();

	public CouponBean insert(CouponBean bean);

	public CouponBean update(int cpResId, int cpType, String cpData, Blob cpPhoto, int cpHowBonus,
			LocalDateTime cpStarTime, java.util.Date cpOverTime, int cpId);
	public boolean delete(int cpid) ;
}
