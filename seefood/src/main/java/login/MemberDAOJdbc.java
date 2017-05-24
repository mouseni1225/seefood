package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAOJdbc implements MemberDAO {

	public DataSource datasource;

	public MemberDAOJdbc() {
		try {
			InitialContext context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String SELECT_BY_MEMBERADDRESS = "select m.*, res.org_Text from member m Full Outer Join restaurant res on m.memberAddress=res.memberAddress where m.memberAddress=?";

	@Override
	public MemberBean select(String memberAddress) {
		System.out.println("從帳號找會員資料");
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		MemberBean result = null;

		try {
			conn = datasource.getConnection();
			prst = conn.prepareStatement(SELECT_BY_MEMBERADDRESS);
			prst.setString(1, memberAddress);
			rs = prst.executeQuery();

			if (rs.next()) {
				result = new MemberBean();
				result.setDepId(rs.getInt("depId"));
				result.setMemberId(rs.getInt("memberId"));
				result.setMemberAddress(rs.getString("memberAddress"));
				result.setMemberPassword(rs.getString("memberPassword"));
				result.setMemberNicknName(rs.getString("memberNicknName"));
				result.setMemberBigPhoto(rs.getString("memberBigPhoto"));
				result.setMemberBonus(rs.getInt("MemberBonus"));
				result.setLoginTime(rs.getDate("loginTime"));
				result.setUnderArticleId(rs.getString("underArticleId"));
				result.setOrg_Text(rs.getString(10));
				
				System.out.println("ooo"+rs.getString(10));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			try {
				if (prst != null)
					prst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	private static final String SELECT_BY_MEMBERADDRESS2 = "select m.*, res.org_Text from member m Full Outer Join restaurant res on m.memberAddress=res.memberAddress where m.memberId=?";


	public MemberBean select2(int memberId) {
		System.out.println("從帳號找會員資料");
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		MemberBean result = null;

		try {
			conn = datasource.getConnection();
			prst = conn.prepareStatement(SELECT_BY_MEMBERADDRESS2);
			prst.setInt(1, memberId);
			rs = prst.executeQuery();

			if (rs.next()) {
				result = new MemberBean();
				result.setDepId(rs.getInt("depId"));
				result.setMemberId(rs.getInt("memberId"));
				result.setMemberAddress(rs.getString("memberAddress"));
				result.setMemberPassword(rs.getString("memberPassword"));
				result.setMemberNicknName(rs.getString("memberNicknName"));
				result.setMemberBigPhoto(rs.getString("memberBigPhoto"));
				result.setMemberBonus(rs.getInt("MemberBonus"));
				result.setLoginTime(rs.getDate("loginTime"));
				result.setUnderArticleId(rs.getString("underArticleId"));
				result.setOrg_Text(rs.getString(10));
				
				System.out.println("ooo"+rs.getString(10));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			try {
				if (prst != null)
					prst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	
	
	private static final String UPDATE = "update member set loginTime=? where memberAddress=?";

	@Override
	public MemberBean updata(java.util.Date loginTime, String memberAddress) {
		System.out.println("修改登入時間(update)");
		MemberBean result = null;
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;

		try {
			conn = datasource.getConnection();
			prst = conn.prepareStatement(UPDATE);
			if (loginTime != null) {
				prst.setDate(1, new java.sql.Date(loginTime.getTime()));
			} else {
				prst.setDate(1, null);
			}
			prst.setString(2, memberAddress);
			int i = prst.executeUpdate();
			if (i == 1) {
				result = this.select(memberAddress);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			try {
				if (prst != null)
					prst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	private static final String UPDATEUNDER = "update member set underArticleId=? where memberId=?";
	@Override
	public MemberBean updata(int memberId, String underArticleId) {
		System.out.println("紀錄會員給分過的文章(update)");
		MemberBean result = null;
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;

		try {
			conn = datasource.getConnection();
			prst = conn.prepareStatement(UPDATEUNDER);
			prst.setString(1,underArticleId);
			prst.setInt(2, memberId);
			int i = prst.executeUpdate();
			if (i == 1) {
				result = this.select(memberId);
				System.out.println("紀錄成功(update)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			try {
				if (prst != null)
					prst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}
	
	
	private static final String SELECT_BY_MEMBERID = "select * from member where memberId=?";

	@Override
	public MemberBean select(int memberId) {
		System.out.println("從ID找會員資料");
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		MemberBean result = null;

		try {
			conn = datasource.getConnection();
			prst = conn.prepareStatement(SELECT_BY_MEMBERID);
			prst.setInt(1, memberId);
			rs = prst.executeQuery();

			if (rs.next()) {
				result = new MemberBean();
				result.setDepId(rs.getInt("depId"));
				result.setMemberId(rs.getInt("memberId"));
				result.setMemberAddress(rs.getString("memberAddress"));
				result.setMemberPassword(rs.getString("memberPassword"));
				result.setMemberNicknName(rs.getString("memberNicknName"));
				result.setMemberBigPhoto(rs.getString("memberBigPhoto"));
				result.setMemberBonus(rs.getInt("MemberBonus"));
				result.setLoginTime(rs.getDate("loginTime"));
				result.setUnderArticleId(rs.getString("underArticleId"));
				
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			try {
				if (prst != null)
					prst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	
	
}
