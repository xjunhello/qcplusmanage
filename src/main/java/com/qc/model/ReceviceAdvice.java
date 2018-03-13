package com.qc.model;

public class ReceviceAdvice {
	private static final long serialVersionUID = 4241348510649058266L;
	private int id;
	private int typeid;
	private String typename;
	private String adviceStr;
	public ReceviceAdvice(int id, int typeid, String typename,
			String adviceStr) {
		super();
		this.id = id;
		this.typeid = typeid;
		this.typename = typename;
		this.adviceStr = adviceStr;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getAdviceStr() {
		return adviceStr;
	}
	public void setAdviceStr(String adviceStr) {
		this.adviceStr = adviceStr;
	}
}
