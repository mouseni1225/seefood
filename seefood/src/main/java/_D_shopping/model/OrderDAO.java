package _D_shopping.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO {
	private static final long serialVersionUID = 1L;
	private String memberNicknName = null;
	private DataSource ds = null;

	public OrderDAO() throws NamingException {
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
	}

	public void insertOrder(OrderBean ob) throws SQLException {
		String sqlOrder = "Insert Into iHaveCoupon " + " (memberNicknName, total, orderDate) " + " values(?, ?, ?) ";
		Connection conn = null;
		PreparedStatement pStmt = null;
		ResultSet generatedKeys = null;
		PreparedStatement pStmt2 = null;
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false); // 開啟JDBC Transaction
			pStmt = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
			pStmt.setString(1, ob.getMemberNicknName());
			pStmt.setDouble(2, ob.getTotal());
			Timestamp ts = new Timestamp(ob.getOrderDate().getTime());
			pStmt.setTimestamp(3, ts);
			pStmt.executeUpdate();
			int id = 0;
			generatedKeys = pStmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			} else {
				throw new SQLException("Creating user failed, no generated key obtained.");
			}
			String sqlItem = "Insert Into couponOrderItems (orderNo, cpId, cpData, amount, howCoupon, cpStarTime, cpOverTime,cpResId) "
					+ " values(?, ?, ?, ?, ?, ?, ?,? ) ";
			List<OrderItemDAOBean> items = ob.getItems();
			pStmt2 = conn.prepareStatement(sqlItem);
			int n = 0;
			for (OrderItemDAOBean oib : items) {
				// 下列四個敘述為交易測試而編寫
				// n++;
				// if (n > 2) {
				// System.out.println("發生例外 n>2");
				// throw new SQLException("JDBC交易測試用");
				// }
				pStmt2.setInt(1, id);
				pStmt2.setInt(2, oib.getCpId());
				pStmt2.setString(3, oib.getCpData());
				pStmt2.setInt(4, oib.getAmount());
				pStmt2.setInt(5, oib.getHowCoupon());
				java.util.Date cpStarTime = oib.getCpStarTime();
				if (cpStarTime != null) {
					pStmt2.setDate(6, new java.sql.Date(cpStarTime.getTime()));
				} else {
					pStmt2.setDate(6, null);
				}
				java.util.Date cpOverTime = oib.getCpOverTime();
				if (cpOverTime != null) {
					pStmt2.setDate(7, new java.sql.Date(cpOverTime.getTime()));
				} else {
					pStmt2.setDate(7, null);
				}
				pStmt2.setInt(8, oib.getCpresId());
				System.out.print("oib.getResId="+oib.getCpresId());
				int count = pStmt2.executeUpdate();
				pStmt2.clearParameters();
			}
			conn.commit();
		} catch (SQLException e) {
			System.out.println("資料還原");
			e.printStackTrace();
			if (conn != null)
				conn.rollback();
		} finally {

			if (pStmt != null) {
				pStmt.close();
			}
			if (pStmt2 != null) {
				pStmt2.close();
			}
			if (conn != null)
				conn.setAutoCommit(true);
			if (conn != null) {
				conn.close();
			}
		}
	}

	public OrderBean getOrder(int orderNo) throws SQLException {
		String sqlOrder = "SELECT * FROM iHaveCoupon WHERE orderNo = ? ";
		String sqlOrderItems = "SELECT co.*, cp.org_Text FROM couponOrderItems co join coupon cp  on co.cpid = cp.cpid WHERE orderNo = ?";
		List<OrderItemDAOBean> items = new ArrayList<OrderItemDAOBean>();
		Connection conn = null;
		PreparedStatement pStmt = null;
		PreparedStatement pStmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		OrderBean ob = null;
		try {
			conn = ds.getConnection();
			pStmt = conn.prepareStatement(sqlOrder);
			pStmt.setInt(1, orderNo);
			rs = pStmt.executeQuery();
			if (rs.next()) {
				ob = new OrderBean();
				ob.setOrderNo(rs.getInt(1));
				ob.setMemberNicknName(rs.getString(2));
				ob.setTotal(rs.getInt(3));
				ob.setOrderDate(rs.getDate(4));
			}
			if (ob == null) {
				throw new SQLException("資料庫邏輯錯誤：無此紀錄, 訂單編號=" + orderNo);
			} else {
				pStmt2 = conn.prepareStatement(sqlOrderItems);
				pStmt2.setInt(1, orderNo);
				rs2 = pStmt2.executeQuery();
				OrderItemDAOBean oib = null;
				while (rs2.next()) {
					oib = new OrderItemDAOBean();
					oib.setSeqno(rs2.getInt("seqno"));
					oib.setOrderNo(rs2.getInt("orderNo"));
					oib.setCpId(rs2.getInt("cpId"));
					oib.setCpresId(rs2.getInt("CpresId"));
					oib.setCpData(rs2.getString("cpData"));
					oib.setAmount(rs2.getInt("amount"));
					oib.setHowCoupon(rs2.getInt("HowCoupon"));
//					Date test = rs2.getTimestamp("cpStarTime");
//					Instant test2 = test.toInstant();
//					LocalDateTime test3 = LocalDateTime.ofInstant(test2, ZoneOffset.systemDefault());
					oib.setCpStarTime(rs2.getDate("cpStarTime"));
					oib.setCpOverTime(rs2.getDate("cpOverTime"));
					oib.setOrg_Text(rs2.getString(10));
					System.out.println("--------------來自orderDAO訊息-----------------");
					System.out.println("-----------------getOrder-------------------");
					System.out.println("seqno=" + rs2.getInt("seqno"));
					System.out.println("orderNo=" + rs2.getInt("orderNo"));
					System.out.println("cpId=" + rs2.getInt("cpId"));
					System.out.println("resId=" + rs2.getInt("cpresId"));
					System.out.println("cpData=" + rs2.getString("cpData"));
					System.out.println("amount=" + rs2.getInt("amount"));
					System.out.println("HowCoupon=" + rs2.getInt("HowCoupon"));
					System.out.println("cpStarTime=" + rs2.getTimestamp("cpStarTime"));
					System.out.println("cpOverTime=" + rs2.getDate("cpOverTime"));
					System.out.println("org_Text=" + rs2.getString(10));
					System.out.println("--------------------------------------------");

					items.add(oib);
				}
			}
			ob.setItems(items);
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (rs2 != null) {
				rs2.close();
			}
			if (pStmt != null) {
				pStmt.close();
			}
			if (pStmt2 != null) {
				pStmt2.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return ob;
	}

	public Collection<OrderBean> getAllOrders() throws SQLException {
		Collection<OrderBean> coll = new ArrayList<OrderBean>();
		String sqlOrder = "SELECT * FROM iHaveCoupon Order by orderDate desc, orderNo desc ";
		PreparedStatement pStmt = null;
		Connection conn = null;
		ResultSet rs = null;
		OrderBean ob = null;
		try {
			conn = ds.getConnection();
			pStmt = conn.prepareStatement(sqlOrder);
			rs = pStmt.executeQuery();

			while (rs.next()) {
				ob = new OrderBean();
				ob.setOrderNo(rs.getInt(1));
				ob.setMemberNicknName(rs.getString(2));
				ob.setTotal(rs.getInt(3));
				ob.setOrderDate(rs.getDate(4));

				coll.add(ob);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pStmt != null) {
				pStmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		// System.out.println("OrderDAO coll.size()=" + coll.size());
		return coll;
	}

	public Collection<OrderBean> getMemberOrders() throws SQLException {
		Collection<OrderBean> coll = new ArrayList<OrderBean>();
		String sqlOrder = "SELECT * FROM orders Order by orderDate asc where memberNicknName = ?";
		PreparedStatement pStmt = null;
		Connection conn = null;
		ResultSet rs = null;
		OrderBean ob = null;
		try {
			conn = ds.getConnection();
			pStmt = conn.prepareStatement(sqlOrder);
			pStmt.setString(1, memberNicknName);
			rs = pStmt.executeQuery();

			while (rs.next()) {
				ob = new OrderBean();
				ob.setOrderNo(rs.getInt(1));
				ob.setMemberNicknName(rs.getString(2));
				ob.setTotal(rs.getInt(3));
				ob.setOrderDate(rs.getDate(4));
				coll.add(ob);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pStmt != null) {
				pStmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return coll;
	}

	public String getMmberNicknName() {
		return memberNicknName;
	}

	public void setMemberNicknName(String memberNicknName) {
		this.memberNicknName = memberNicknName;
	}

}