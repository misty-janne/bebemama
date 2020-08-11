package kr.co.domain;

import java.io.Serializable;

public class PurBoardDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pno;
	private int bsno;
	private String id;
	private int cno;
	private int gno;
	private String deliveryCode;
	private String purDate;
	public PurBoardDTO() {
		// TODO Auto-generated constructor stub
	}
	public PurBoardDTO(int pno, String id, int cno, int gno, String deliveryCode, String purDate, int bsno) {
		super();
		this.pno = pno;
		this.id = id;
		this.cno = cno;
		this.gno = gno;
		this.deliveryCode = deliveryCode;
		this.purDate = purDate;
		this.bsno = bsno;
	}
	
	
	
	public int getBsno() {
		return bsno;
	}
	public void setBsno(int bsno) {
		this.bsno = bsno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public String getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	public String getPurDate() {
		return purDate;
	}
	public void setPurDate(String purDate) {
		this.purDate = purDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "PurBoardDTO [pno=" + pno + ", bsno=" + bsno + ", id=" + id + ", cno=" + cno + ", gno=" + gno + ", deliveryCode="
				+ deliveryCode + ", purDate=" + purDate + "]";
	}
	

}
