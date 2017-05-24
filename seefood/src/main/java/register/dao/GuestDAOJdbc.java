package register.dao;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import article.ArticleBean;
import register.GuestBean;
import register.GuestDAO;

public class GuestDAOJdbc implements GuestDAO {
	private DataSource dataSource;

	public GuestDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 一般會員區塊 註冊
	private static final String INSERT = "insert into member (depId,memberAddress,memberPassword,memberNicknName,memberBigPhoto) values (?, ?, ?, ?,?)";

	@Override
	public GuestBean insert(GuestBean bean,InputStream fis, long sizeInBytes) {
		GuestBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {

			stmt.setInt(1, bean.getDepId());
			stmt.setString(2, bean.getMemberAddress());
			stmt.setString(3, bean.getMemberPassword());
			stmt.setString(4, bean.getMemberNicknName());
			stmt.setBinaryStream(5, fis, sizeInBytes);
			int in = stmt.executeUpdate();
			System.out.println("in=" + in);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	// 一般會員區塊 修改
	private static final String UPDATE = "update member set memberNicknName=?, memberPassword=? ,memberBigPhoto=? where memberAddress=?";

	@Override
	public GuestBean update(String memberNicknName, String memberPassword,InputStream fis, long sizeInBytes, String memberAddress) {
		            
		GuestBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {

			stmt.setString(1, memberNicknName);
			stmt.setString(2, memberPassword);
			stmt.setBinaryStream(3, fis, sizeInBytes);
			stmt.setString(4, memberAddress);
			int up = stmt.executeUpdate();
			System.out.println("up=" + up);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}
	
	//修改會員密碼
	private static final String UPDATEPASS = "update member set  memberPassword=? where memberAddress=?";

	@Override
	public GuestBean updatepass(String memberPassword, String memberAddress) {
		GuestBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATEPASS);) {

			
			stmt.setString(1, memberPassword);

			stmt.setString(2, memberAddress);
			int up = stmt.executeUpdate();
			System.out.println("uppass=" + up);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}
	

	// 餐廳會員區塊 註冊
	private static final String INSERTRESTAURANT = "insert into restaurant( org_Text,informtel,informaddress,lat,lng,special,time,price,servItem,frg_Id,memberAddress) values (?,?,?,?,?,?,?,?,?,?,?)";

	@Override
	public GuestBean insertrestaurant(GuestBean bean2) {

		GuestBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERTRESTAURANT);) {

			stmt.setString(1, bean2.getOrg_Text());
			stmt.setString(2, bean2.getInformtel());
			stmt.setString(3, bean2.getInformaddress());
			stmt.setString(4, bean2.getLat());
			stmt.setString(5, bean2.getLng());
			stmt.setString(6, bean2.getSpecial());

			stmt.setString(7, bean2.getTime());

			stmt.setString(8, bean2.getPrice());

			stmt.setString(9, bean2.getServItem());
			stmt.setString(10, bean2.getFrg_Id());
			stmt.setString(11, bean2.getMemberAddress());

			int inr = stmt.executeUpdate();

			System.out.println("inr=" + inr);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	// 餐廳會員區塊 修改
	private static final String UPDATERESAURANT = "update restaurant set org_Text=?, informtel=?, informaddress=?, lat=?,lng=?, special=?, time=?, price=?, servItem=? where memberAddress=?";

	@Override
	public GuestBean updaterestaurant( String org_Text,String informtel,String informaddress,  String lat, String lng, 
			String special, String time, String price,String servItem,String memberAddress) {
		GuestBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATERESAURANT);) {

			stmt.setString(1, org_Text);
			stmt.setString(2, informtel);

			stmt.setString(3, informaddress);
			stmt.setString(4, lat);
			stmt.setString(5, lng);
			stmt.setString(6, special);
			stmt.setString(7, time);
			stmt.setString(8, price);
			stmt.setString(9, servItem);
			stmt.setString(10,memberAddress);
			int up = stmt.executeUpdate();
			System.out.println("rsup=" + up);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}
    //查詢餐廳
	private static final String SELECT_BY_memberAddress = "select * from restaurant where memberAddress=?";

	@Override
	public GuestBean selectrestaurant(String memberAddress) {
		GuestBean result = null;
		ResultSet rest = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_memberAddress);) {
			stmt.setString(1, memberAddress);
			rest = stmt.executeQuery();
			if (rest.next()) {
				result = new GuestBean();
				result.setOrg_Text(rest.getString("org_Text"));
				result.setInformtel(rest.getString("informtel"));
				result.setInformaddress(rest.getString("informaddress"));
				result.setLat(rest.getString("lat"));
				result.setLng(rest.getString("lng"));
				result.setSpecial(rest.getString("special"));
				result.setTime(rest.getString("time"));
				result.setPrice(rest.getString("price"));
				result.setServItem(rest.getString("servItem"));
				result.setFrg_Id(rest.getString("frg_Id"));
				result.setMemberAddress(rest.getString("memberAddress"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			rest.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;

	}

	
	private static final String SELECT = "select * from restaurant";
	
	@Override
	public List<GuestBean> select() {
		List<GuestBean> result=null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(SELECT);){
			int i=1;
			rset = stmt.executeQuery();
			result=new ArrayList<GuestBean>();
			while(rset.next()){
				GuestBean rs=new GuestBean();
				rs.setId(rset.getInt("id"));
				rs.setOrg_Text(rset.getString("org_Text"));
				rs.setInformtel(rset.getString("informtel"));
				rs.setInformaddress(rset.getString("informaddress"));
				rs.setLat(rset.getString("lat"));
				rs.setLng(rset.getString("lng"));
				rs.setSpecial(rset.getString("special"));
				rs.setTime(rset.getString("time"));
				rs.setPrice(rset.getString("price"));
				rs.setServItem(rset.getString("servItem"));
				rs.setFrg_Id(rset.getString("frg_Id"));
				result.add(rs);
				System.out.println("4月19 查詢"+i++);
			}
		
		
		
		return result;
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
		return result;
}
}