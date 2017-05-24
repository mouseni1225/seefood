package information;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class UserDAOSQLServer {
	private DataSource ds = null;
	public UserDAOSQLServer() throws NamingException, SQLException { 
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
	}
	public String checkUserId(String memberAddress) {
		String sql = "SELECT * FROM MEMBER WHERE MEMBERADDRESS = ?";
		try (
			Connection connection = ds.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(sql);
		) {
			pstmt.setString(1, memberAddress);
			try (
				ResultSet rs = pstmt.executeQuery();
			) {
				if (rs.next()) {
					String custId 	= rs.getString("memberAddress").trim(); 
					System.out.println("custId="+custId);
					return custId;
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return null;
	}
}
