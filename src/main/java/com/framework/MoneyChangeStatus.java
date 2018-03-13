package com.framework;

public enum MoneyChangeStatus {
	Start(1,"发起"),Running(2,"操作中"),Success(4,"成功"),Fail(3,"失败");
	
	public int type;
	public String desc;
	MoneyChangeStatus(int type,String desc){
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
	
	public static MoneyChangeStatus getInstance(int type){
		switch(type){
		case 1:return MoneyChangeStatus.Start;
		case 2:return MoneyChangeStatus.Running;
		case 3:return MoneyChangeStatus.Fail;
		case 4:return MoneyChangeStatus.Success;
		default:return null;
		}
	}
}
