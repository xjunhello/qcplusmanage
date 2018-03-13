package com.framework.tag;

public class DicServiceProviderType {
	private int id;
	private String name;
	private int orderNo;
	private int isdelete;
	public int getId() {
		return id;
	}
	public DicServiceProviderType(int id, String name, int orderNo, int isdelete) {
		super();
		this.id = id;
		this.name = name;
		this.orderNo = orderNo;
		this.isdelete = isdelete;
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
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
}
