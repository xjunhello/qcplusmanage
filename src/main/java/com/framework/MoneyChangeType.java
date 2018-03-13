package com.framework;

public enum MoneyChangeType {
	SendOrder(1,"发单员汇款"),
	AssignReport(2,"平台分成，验货"),
	AssignCheck(3,"平台分成，审核报告"),
	Cash(4,"提现");
	
	/**
	 * 操作类型
	 */
	public int type;
	/**
	 * 描述
	 */
	public String desc;
	MoneyChangeType(int type,String desc){
		this.type = type;
		this.desc = desc;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
	public static MoneyChangeType getInstance(int type){
		switch(type){
		case 1:return MoneyChangeType.SendOrder;
		case 2:return MoneyChangeType.AssignReport;
		case 3:return MoneyChangeType.AssignCheck;
		case 4:return MoneyChangeType.Cash;
		default:return null;
		}
	}
	
	
}
