package message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MessageDAOJdbc implements MessageDAO {
	private DataSource dataSource;
	
	public MessageDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT = " insert into message (articleId,memberId,memberNicknName,memberBigPhoto,title,postTime,lookmessage) values (?,?,?,?,?,?,?)";
	@Override
	public int insert(MessageBean mbean) {
		System.out.println("執行文章留言(insert)");
		int i = 0;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			stmt.setInt(1,mbean.getArticleId());
			stmt.setInt(2,mbean.getMemberId());
			stmt.setString(3,mbean.getMemberNicknName());
			stmt.setBlob(4, mbean.getMemberBigPhoto());
			stmt.setString(5,mbean.getTitle());
			Timestamp ts=new Timestamp(System.currentTimeMillis());
			stmt.setTimestamp(6, ts);
			stmt.setString(7,mbean.getLookmessage());
			i = stmt.executeUpdate();
			if (i == 1) {
				System.out.println("文章留言新增成功");
				
			} else if (i == 0) {
				System.out.println("文章留言新增失敗");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	
	private static final String SELECT_BY_ARTICLEID =" select * from message where articleId=?";
	@Override
	public List<MessageBean> selectAll(int articleId) {
		System.out.println("查詢文章所有留言(select_all)");
		List<MessageBean> result=null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ARTICLEID);){
			stmt.setInt(1,articleId);
			rset = stmt.executeQuery();
			result=new ArrayList<MessageBean>();
			while(rset.next()){
				MessageBean row=new MessageBean();
				row.setMessageId(rset.getInt("messageId"));
				row.setArticleId(rset.getInt("articleId"));
				row.setMemberId(rset.getInt("memberId"));
				row.setMemberNicknName(rset.getString("memberNicknName"));
				row.setMemberBigPhoto(rset.getBlob("memberBigPhoto"));
				row.setTitle(rset.getString("title"));
				row.setPostTime(rset.getTimestamp("postTime"));
				row.setLookmessage(rset.getString("lookmessage"));
				result.add(row);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}

}
