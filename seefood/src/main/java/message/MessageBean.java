package message;

import java.sql.Blob;
import java.sql.Timestamp;

public class MessageBean {
	private int messageId;
	private int articleId;
	private int memberId;
	private String memberNicknName;
	private Blob memberBigPhoto;
	private String title;
	private Timestamp postTime;
	private String lookmessage;
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
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
	public String getMemberNicknName() {
		return memberNicknName;
	}
	public void setMemberNicknName(String memberNicknName) {
		this.memberNicknName = memberNicknName;
	}
	public Blob getMemberBigPhoto() {
		return memberBigPhoto;
	}
	public void setMemberBigPhoto(Blob memberBigPhoto) {
		this.memberBigPhoto = memberBigPhoto;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getPostTime() {
		return postTime;
	}
	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}
	public String getLookmessage() {
		return lookmessage;
	}
	public void setLookmessage(String lookmessage) {
		this.lookmessage = lookmessage;
	}
	@Override
	public String toString() {
		return "MessageBean [messageId=" + messageId + ", articleId=" + articleId + ", memberId=" + memberId
				+ ", memberNicknName=" + memberNicknName + ", memberBigPhoto=" + memberBigPhoto + ", title=" + title
				+ ", postTime=" + postTime + ", lookmessage=" + lookmessage + "]";
	}
	
	
	
}
