package _03_listCoupon.model;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.Collection;

public interface CouponAccessDAO {
	public int getTotalPages() throws SQLException ;
	public Collection<CouponBean> getPageBooks() throws SQLException ;
	public int getPageNo();
	public void setPageNo(int pageNo);
	public int getRecordsPerPage() ;
	public void setRecordsPerPage(int recordsPerPage);
	public int getRecordCounts() throws SQLException;
	public void setBookId(int bookId);
	public CouponBean getBook() throws SQLException;
	public Collection<CouponBean> getAllBooks() throws SQLException;
	public int updateBook(CouponBean bean, InputStream is, long sizeInBytes) throws SQLException;
	public int updateBook(CouponBean bean) throws SQLException;
	public CouponBean queryBook(int bookID) throws SQLException;
	public int deleteBook(int no) throws SQLException;
	public int insertBook(CouponBean bean, InputStream is, long size) throws SQLException;
	public void createBookTable() throws SQLException;
}
