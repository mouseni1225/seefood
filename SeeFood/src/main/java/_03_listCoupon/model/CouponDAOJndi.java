package _03_listCoupon.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CouponDAOJndi implements Serializable {
	private static final long serialVersionUID = 1L;// 序列化
	private int cpId = 0; // 查詢單筆商品會用到此代號
	private int pageNo = 0;
	private int recordsPerPage = 3; // 每頁三筆
	private int totalPages = -1;

	public DataSource dataSource;

	// 宣告DataSource類別的
	// dataSource物件為全域方便底下Connection conn使用
	// 設定datasource
	public CouponDAOJndi() {
		try {
			InitialContext context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public int getTotalPages() throws SQLException {
		// 計算總共有幾頁
		if (totalPages == -1) {
			// 注意下一列的double型態轉換
			totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		}
		return totalPages;
	}

	// 計算紀錄總筆數
	public int getRecordCounts() throws SQLException {
		String sql = "SELECT count(*) FROM coupon";
		PreparedStatement pStmt = null;
		Connection connection = null;
		ResultSet rs = null;
		int result = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement(sql);
			rs = pStmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pStmt != null) {
				try {
					pStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public void setCpId(int cpId) {
		this.cpId = cpId;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	public CouponBean getCoupon() {
		CouponBean cb = null;
		ResultSet rs = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(SELECT_BY_ID);) {
			pstm.setInt(1, cpId);
			rs = pstm.executeQuery();
			if (rs.next()) {
				cb = new CouponBean();
				// 從rs取出資料 並 放入Java Bean 物件
				cb.setCpId(rs.getInt("cpId"));
				cb.setCpResId(rs.getInt("cpResId"));
				cb.setCpType(rs.getInt("cpType"));
				cb.setCpData(rs.getString("cpData"));
				cb.setCpPhoto(rs.getBlob("cpPhoto"));
				cb.setCpHowBonus(rs.getInt("cpHowBonus"));
				// 1.8新time localDateTime 使用
				// ResultSet尚未支援新的localDateTime 所以採用轉換再轉
				Date test = rs.getTimestamp("cpStarTime"); // 從資料庫撈出來為date
				System.out.println(test);
				Instant test2 = test.toInstant();// 轉成instant>>
				LocalDateTime test3 = LocalDateTime.ofInstant(test2, ZoneOffset.systemDefault());
				// ↑從instant 轉成localDateTime
				cb.setCpStarTime(test3);
				cb.setCpOverTime(rs.getDate("cpOverTime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return cb;
	}

	public List<CouponBean> getPageCoupon() {
		List<CouponBean> lcb = null;
		String queryPageString = "SELECT  * FROM (SELECT  ROW_NUMBER() OVER (ORDER BY cpID)" + " AS RowNum )"
				+ " AS NewTable WHERE RowNum >= ? AND RowNum <= ?";
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(queryPageString);
				ResultSet rs = pstm.executeQuery();) {

			int startRecordNo = (pageNo - 1) * recordsPerPage + 1;
			int endRecordNo = (pageNo) * recordsPerPage;
			// PreparedStatement物件內所有的問號都要有值，否則執行pStmt.executeQuery()
			// 或pStmt.executeUpdate()時程式一定會掛掉。
			pstm.setInt(1, startRecordNo);
			pstm.setInt(2, endRecordNo);
			lcb = new ArrayList<CouponBean>();
			while (rs.next()) {
				CouponBean row = new CouponBean();
				row.setCpId(rs.getInt("cpId"));
				row.setCpResId(rs.getInt("cpResId"));
				row.setCpType(rs.getInt("cpType"));
				row.setCpData(rs.getString("cpData"));
				row.setCpPhoto(rs.getBlob("cpPhoto"));
				row.setCpHowBonus(rs.getInt("cpHowBonus"));
				Date test = rs.getTimestamp("cpStarTime");
				Instant test2 = test.toInstant();
				LocalDateTime test3 = LocalDateTime.ofInstant(test2, ZoneOffset.systemDefault());
				row.setCpStarTime(test3);
				row.setCpOverTime(rs.getDate("cpOverTime"));
				lcb.add(row);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lcb;
	}

	private static final String SELECT_BY_ID = "select * from coupon where cpid=?";

	// 依據產品ID去單筆查詢
	public CouponBean select(int cpid) {
		CouponBean cb = null;
		ResultSet rs = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(SELECT_BY_ID);) {
			pstm.setInt(1, cpid);
			rs = pstm.executeQuery();
			if (rs.next()) {
				cb = new CouponBean();
				// 從rs取出資料 並 放入Java Bean 物件
				cb.setCpId(rs.getInt("cpId"));
				cb.setCpResId(rs.getInt("cpResId"));
				cb.setCpType(rs.getInt("cpType"));
				cb.setCpData(rs.getString("cpData"));
				cb.setCpPhoto(rs.getBlob("cpPhoto"));
				cb.setCpHowBonus(rs.getInt("cpHowBonus"));
				// 1.8新time localDateTime 使用
				// ResultSet尚未支援新的localDateTime 所以採用轉換再轉
				Date test = rs.getTimestamp("cpStarTime"); // 從資料庫撈出來為date
				System.out.println(test);
				Instant test2 = test.toInstant();// 轉成instant>>
				LocalDateTime test3 = LocalDateTime.ofInstant(test2, ZoneOffset.systemDefault());
				// ↑從instant 轉成localDateTime
				cb.setCpStarTime(test3);
				cb.setCpOverTime(rs.getDate("cpOverTime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return cb;
	}

	public List<CouponBean> getAllCoupon() { // 將值回傳給maintain.jsp用
		return select();
	}

	private static final String SELECT_ALL = "select * from coupon";

	public List<CouponBean> select() {
		List<CouponBean> lcb = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(SELECT_ALL);
				ResultSet rs = pstm.executeQuery();) {
			lcb = new ArrayList<CouponBean>();
			while (rs.next()) {
				CouponBean row = new CouponBean();
				row.setCpId(rs.getInt("cpId"));
				row.setCpResId(rs.getInt("cpResId"));
				row.setCpType(rs.getInt("cpType"));
				row.setCpData(rs.getString("cpData"));
				row.setCpPhoto(rs.getBlob("cpPhoto"));
				row.setCpHowBonus(rs.getInt("cpHowBonus"));
				Date test = rs.getTimestamp("cpStarTime");
				Instant test2 = test.toInstant();
				LocalDateTime test3 = LocalDateTime.ofInstant(test2, ZoneOffset.systemDefault());
				row.setCpStarTime(test3);
				row.setCpOverTime(rs.getDate("cpOverTime"));
				lcb.add(row);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lcb;
	}

	private static final String INSERT = "insert into coupon (cpResId, cpType, cpData, cpPhoto, cpHowBonus, cpStarTime,cpOverTime) "
			+ "values (?, ?, ?, ? ,?, ?, ?)";

	public CouponBean insert(CouponBean bean) {
		CouponBean cb = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstm = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				pstm.setInt(1, bean.getCpResId());
				pstm.setInt(2, bean.getCpType());
				pstm.setString(3, bean.getCpData());
				pstm.setBlob(4, bean.getCpPhoto());
				pstm.setInt(5, bean.getCpHowBonus());
				LocalDateTime cpStarTime = bean.getCpStarTime();
				if (cpStarTime != null) {
					pstm.setObject(6, LocalDateTime.now());
				} else {
					pstm.setObject(6, null);
				}
				java.util.Date cpOverTime = bean.getCpOverTime();
				if (cpOverTime != null) {
					pstm.setDate(7, new java.sql.Date(cpOverTime.getTime()));

				} else {
					pstm.setDate(7, null);
				}
				int i = pstm.executeUpdate();
				if (i == 1) {
					cb = this.select(bean.getCpResId());
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cb;
	}

	private static final String UPDATE = "update coupon set cpResId=?,cpType=?, cpData=?, cpPhoto=?,"
			+ " cpHowBonus=?, cpStarTime=?, cpOverTime=? where cpId=?";

	public CouponBean update(int cpResId, int cpType, String cpData, Blob cpPhoto, int cpHowBonus,
			LocalDateTime cpStarTime, java.util.Date cpOverTime, int cpId) {
		CouponBean cb = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstm = conn.prepareStatement(UPDATE);) {
			pstm.setInt(1, cpResId);
			pstm.setInt(2, cpType);
			pstm.setString(3, cpData);
			pstm.setBlob(4, cpPhoto);
			pstm.setInt(5, cpHowBonus);
			pstm.setObject(6, cpStarTime);
			if (cpOverTime != null) {
				pstm.setDate(7, new java.sql.Date(cpOverTime.getTime()));
			} else {
				pstm.setDate(7, null);
			}
			pstm.setInt(8, cpId);
			pstm.executeUpdate();
			int i = pstm.executeUpdate();
			if (i == 1) {
				cb = this.select(cpId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cb;
	}

	private static final String DELETE = "delete from coupon where cpId=?";

	public boolean delete(int cpid) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstm = conn.prepareStatement(DELETE);) {
			pstm.setInt(1, cpid);
			int i = pstm.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
