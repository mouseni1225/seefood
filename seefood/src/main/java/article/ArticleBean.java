package article;

import java.sql.Blob;

public class ArticleBean {
	private int articleId;
	private int memberId;
	private String articleData;
	private int articlePeople;
	private int articleTotalStar;
	private int articleAverageStar;
	private String articleTitle;
	private String memberNicknName;
	private String cutData;
	private Blob img;
	private String imgName;
	
	public String getCutData() {
		return cutData;
	}
	public void setCutData(String cutData) {
		this.cutData = cutData;
	}
	public String getMemberNicknName() {
		return memberNicknName;
	}
	public void setMemberNicknName(String memberNicknName) {
		this.memberNicknName = memberNicknName;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getArticleData() {
		return articleData;
	}
	public void setArticleData(String articleData) {
		this.articleData = articleData;
	}
	public int getArticlePeople() {
		return articlePeople;
	}
	public void setArticlePeople(int articlePeople) {
		this.articlePeople = articlePeople;
	}
	public int getArticleTotalStar() {
		return articleTotalStar;
	}
	public void setArticleTotalStar(int articleTotalStar) {
		this.articleTotalStar = articleTotalStar;
	}
	public int getArticleAverageStar() {
		return articleAverageStar;
	}
	public void setArticleAverageStar(int articleAverageStar) {
		this.articleAverageStar = articleAverageStar;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public Blob getImg() {
		return img;
	}
	public void setImg(Blob img) {
		this.img = img;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	@Override
	public String toString() {
		return "ArticleBean [articleId=" + articleId + ", memberId=" + memberId + ", articleData=" + articleData
				+ ", articlePeople=" + articlePeople + ", articleTotalStar=" + articleTotalStar
				+ ", articleAverageStar=" + articleAverageStar + ", articleTitle=" + articleTitle + ", memberNicknName="
				+ memberNicknName + ", cutData=" + cutData + ", img=" + img + ", imgName=" + imgName + "]";
	}
	
	
	
	
	
	
	

}
