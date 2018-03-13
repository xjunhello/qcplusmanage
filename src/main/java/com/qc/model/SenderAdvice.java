package com.qc.model;

public class SenderAdvice {
	private static final long serialVersionUID = 4241348510649058266L;
	private int id;
	private String name;
	private String adviceStr;
	/**
	 * 
	* <p>Title: 发单员查询</p> 
	* <p>Description: </p> 
	* @param id id
	* @param name 名称
	* @param adviceStr 字符串
	 */
	public SenderAdvice(int id, String name,
			String adviceStr) {
		super();
		this.id = id;
		this.name = name;
		this.adviceStr = adviceStr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getAdviceStr() {
		return adviceStr;
	}
	public void setAdviceStr(String adviceStr) {
		this.adviceStr = adviceStr;
	}
}
