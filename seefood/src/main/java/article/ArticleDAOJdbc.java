package article;

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

public class ArticleDAOJdbc implements ArticleDAO {
	private DataSource dataSource;

	public ArticleDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT = "insert into article (memberId,articleData,articlePeople,articleTotalStar,articleAverageStar,articleTitle,memberNicknName,cutData,img,imgName) values (?,?,?,?,?,?,?,?,?,?)";
	@Override
	public ArticleBean insert(ArticleBean bean,InputStream is, long size) {
		System.out.println("執行會員新增文章(insert)");
		ArticleBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {

			if (bean != null) {
				stmt.setInt(1, bean.getMemberId());
				stmt.setString(2, bean.getArticleData());
				stmt.setInt(3, bean.getArticlePeople());
				stmt.setDouble(4, bean.getArticleTotalStar());
				stmt.setDouble(5, bean.getArticleAverageStar());
				stmt.setString(6, bean.getArticleTitle());
				stmt.setString(7, bean.getMemberNicknName());
				stmt.setString(8, bean.getCutData());
				stmt.setBinaryStream(9, is, size);
				stmt.setString(10, bean.getImgName());
				int i = 0;
				i = stmt.executeUpdate();
				if (i == 1) {
					System.out.println("文章內容新增成功");
					
				} else if (i == 0) {
					System.out.println("文章內容新增失敗");
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;

	}

	private static final String SELECT_BY_TITLE ="select * from  article  WHERE articleTitle LIKE ?";
	@Override
	public List<ArticleBean> selectTitle(String articleTitle) {
		System.out.println("查詢文章標籤(select_by_title)");
		List<ArticleBean> result=null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_TITLE);){
			stmt.setString(1,articleTitle);
			rset = stmt.executeQuery();
			result=new ArrayList<ArticleBean>();
			while(rset.next()){
				ArticleBean row=new ArticleBean();
				row.setArticleId(rset.getInt("articleId"));
				row.setMemberId(rset.getInt("memberId"));
				row.setArticleData(rset.getString("articleData"));
				row.setArticlePeople(rset.getInt("articlePeople"));
				row.setArticleTotalStar(rset.getInt("articleTotalStar"));
				row.setArticleAverageStar(rset.getInt("articleAverageStar"));
				row.setArticleTitle(rset.getString("articleTitle"));
				row.setMemberNicknName(rset.getString("memberNicknName"));
				row.setCutData(rset.getString("cutData"));
				row.setImg(rset.getBlob("img"));
				result.add(row);
			}
				
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	private static final String SELECT_BY_MEMBERID ="select * from article where memberId=?";
	@Override
	public List<ArticleBean> selectMemberId(int memberId) {
		System.out.println("查詢自己文章(select_by_memberId)");
		List<ArticleBean> result=null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MEMBERID);){
			stmt.setInt(1,memberId);
			rset = stmt.executeQuery();
			result=new ArrayList<ArticleBean>();
			while(rset.next()){
				ArticleBean row=new ArticleBean();
				row.setArticleId(rset.getInt("articleId"));
				row.setMemberId(rset.getInt("memberId"));
				row.setArticleData(rset.getString("articleData"));
				row.setArticlePeople(rset.getInt("articlePeople"));
				row.setArticleTotalStar(rset.getInt("articleTotalStar"));
				row.setArticleAverageStar(rset.getInt("articleAverageStar"));
				row.setArticleTitle(rset.getString("articleTitle"));
				row.setMemberNicknName(rset.getString("memberNicknName"));
				row.setCutData(rset.getString("cutData"));
				row.setImg(rset.getBlob("img"));
				result.add(row);
			}
				
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	private static final String SELECT_ALL ="select * from article  order by articleId desc";
	@Override
	public List<ArticleBean> selectAll() {
		System.out.println("查詢所有文章(select_all)");
		List<ArticleBean> result=null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);){
			rset = stmt.executeQuery();
			result=new ArrayList<ArticleBean>();
			while(rset.next()){
				ArticleBean row=new ArticleBean();
				row.setArticleId(rset.getInt("articleId"));
				row.setMemberId(rset.getInt("memberId"));
				row.setArticleData(rset.getString("articleData"));
				row.setArticlePeople(rset.getInt("articlePeople"));
				row.setArticleTotalStar(rset.getInt("articleTotalStar"));
				row.setArticleAverageStar(rset.getInt("articleAverageStar"));
				row.setArticleTitle(rset.getString("articleTitle"));
				row.setMemberNicknName(rset.getString("memberNicknName"));
				row.setCutData(rset.getString("cutData"));
				row.setImg(rset.getBlob("img"));
				result.add(row);
			}
				
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	private static final String SELECT_BY_NICKNNAME ="select * from  article  WHERE memberNicknName LIKE ?";
	@Override
	public List<ArticleBean> selectNicknName(String memberNicknName) {
		System.out.println("查詢指定作者(select_by_nickname)");
		List<ArticleBean> result=null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_NICKNNAME);){
			stmt.setString(1,memberNicknName);
			rset = stmt.executeQuery();
			result=new ArrayList<ArticleBean>();
			while(rset.next()){
				ArticleBean row=new ArticleBean();
				row.setArticleId(rset.getInt("articleId"));
				row.setMemberId(rset.getInt("memberId"));
				row.setArticleData(rset.getString("articleData"));
				row.setArticlePeople(rset.getInt("articlePeople"));
				row.setArticleTotalStar(rset.getInt("articleTotalStar"));
				row.setArticleAverageStar(rset.getInt("articleAverageStar"));
				row.setArticleTitle(rset.getString("articleTitle"));
				row.setMemberNicknName(rset.getString("memberNicknName"));
				row.setCutData(rset.getString("cutData"));
				row.setImg(rset.getBlob("img"));
				result.add(row);
			}
				
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
		
	}

	private static final String UPDATE="update article set articleTitle=?, articleData=?,memberNicknName=?,cutData=?,img=? where articleId=?";
	@Override
	public ArticleBean update(int articleId,String articleTitle, String articleData,String memberNicknName,String cutData,InputStream is,long sizeInBytes) {
		System.out.println("會員修改文章(update)");
		ArticleBean result=null;
		try(Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(UPDATE);){
			stmt.setString(1, articleTitle);
			stmt.setString(2, articleData);
			stmt.setString(3, memberNicknName);
			stmt.setString(4, cutData);
			stmt.setBinaryStream(5, is, sizeInBytes);
			stmt.setInt(6, articleId);
			int i = stmt.executeUpdate();
			if(i==1) {
				System.out.println("文章更新成功");
				result = this.selectarticleId(articleId);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	private static final String SELECT_BY_ARTICLETD="select * from article where articleId=?";
	@Override
	public ArticleBean selectarticleId(int articleId) {
		ArticleBean result = null;
		ResultSet rset = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ARTICLETD);) {
				stmt.setInt(1, articleId);
				rset = stmt.executeQuery();
				if(rset.next()) {
					result = new ArticleBean();
					result.setArticleId(rset.getInt("articleId"));
					result.setMemberId(rset.getInt("memberId"));
					result.setArticleData(rset.getString("articleData"));
					result.setArticlePeople(rset.getInt("articlePeople"));
					result.setArticleTotalStar(rset.getInt("articleTotalStar"));
					result.setArticleAverageStar(rset.getInt("articleAverageStar"));
					result.setArticleTitle(rset.getString("articleTitle"));
					result.setMemberNicknName(rset.getString("memberNicknName"));
					result.setImg(rset.getBlob("img"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (rset!=null) {
					try {
						rset.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
			}
		
		return result;
	}
	
	private static final String SELECT_TOP_ONE="select top 1 * from article order by articleId desc";
	@Override
	public ArticleBean selecttopone() {
		ArticleBean result = null;
		ResultSet rset = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_TOP_ONE);) {
				rset = stmt.executeQuery();
				if(rset.next()) {
					result = new ArticleBean();
					result.setArticleId(rset.getInt("articleId"));
					result.setMemberId(rset.getInt("memberId"));
					result.setArticleData(rset.getString("articleData"));
					result.setArticlePeople(rset.getInt("articlePeople"));
					result.setArticleTotalStar(rset.getInt("articleTotalStar"));
					result.setArticleAverageStar(rset.getInt("articleAverageStar"));
					result.setArticleTitle(rset.getString("articleTitle"));
					result.setMemberNicknName(rset.getString("memberNicknName"));
					result.setImg(rset.getBlob("img"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (rset!=null) {
					try {
						rset.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
			}
		
		
		return result;
	}
	
	private static final String DELECT=" DELETE FROM article WHERE articleId=?";
	@Override
	public int delect(int articleId) {
		
		try(Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(DELECT);){
			stmt.setInt(1, articleId);
			int i = stmt.executeUpdate();
			if(i==1) {
			   return i;
					
			}
			}catch(SQLException e){
				e.printStackTrace();
			}
			
			return 0;
	}
	
	
	
	private static final String UPDATESTAR="update article set articlePeople=?, articleTotalStar=?,articleAverageStar=? where articleId=?";
	@Override
	public ArticleBean update(int articleId, int articlePeople, int articleTotalStar, int articleAverageStar) {
		System.out.println("修改文章分數(update)");
		ArticleBean result=null;
		try(Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(UPDATESTAR);){
			stmt.setInt(1, articlePeople);
			stmt.setDouble(2, articleTotalStar);
			stmt.setDouble(3, articleAverageStar);
			stmt.setInt(4, articleId);
			int i = stmt.executeUpdate();
			if(i==1) {
				System.out.println("文章分數更新成功");
				result = this.selectarticleId(articleId);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return result;
		
		
	}
	
	

}
