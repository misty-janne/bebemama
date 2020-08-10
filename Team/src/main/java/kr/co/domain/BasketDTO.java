package kr.co.domain;

import java.io.Serializable;

public class BasketDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int bsno;
	private String id;
	private String cname; //sql 내추럴조인용
	private String gname; //sql 내추럴조인용
	private String fullName; //sql 내추럴조인용
	private int price; //sql 내추럴조인용
	private int cno;
	private int gno;
	
	public BasketDTO() {
		// TODO Auto-generated constructor stub
	}

	public BasketDTO(int bsno, String id, int cno, int gno, String cname, String gname, int price, String fullName) {
		super();
		this.bsno = bsno;
		this.id = id;
		this.cno = cno;
		this.gno = gno;
		this.cname = cname;
		this.gname = gname;
		this.price = price;
		this.fullName = fullName;
	}
	
	

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getBsno() {
		return bsno;
	}

	public void setBsno(int bsno) {
		this.bsno = bsno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bsno;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BasketDTO other = (BasketDTO) obj;
		if (bsno != other.bsno)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BasketDTO [bsno=" + bsno + ", id=" + id + ", cno=" + cno +", cname=" + cname + ", gname=" + gname + ", gno=" + gno + ", price=" + price + ", fullName=" + fullName + "]";
	}
	
	
	

}
