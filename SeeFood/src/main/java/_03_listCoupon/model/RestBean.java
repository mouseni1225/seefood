package _03_listCoupon.model;

import java.io.Serializable;
// 本類別封裝單筆出版社資料
public class RestBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int     id ;
	private String  name;
	private String  address;
	private String  url;
	
    public RestBean(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public RestBean() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}	
	
}