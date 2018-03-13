package com.qc.service;
/**
 * 积分模型
* @ClassName: Score 
* @Description: 
* 积分规则为
签到送积分：2分
分享送积分：5分
邀请好友成功注册送积分：20分
评价送积分：5星好评20分、4星好评10分、3星2星1星0分。
1 为签到；2为分享；3为邀请好友；4，评价

* @author xinjun.zhang
* @date 2016年10月18日 下午2:51:33 
*
 */
public enum Score {
	Signin(2,"签到",1),Share(5,"分享",2),Invite(20,"邀请好友成功注册",3),Evaluation5Star(20,"5星好评",4),
	Evaluation4Star(10,"4星好评",5),EvaluationOtherStar(0,"3星2星1星评价",6);
	public int getDbtype() {
		return dbtype;
	}
	public void setDbtype(int dbtype) {
		this.dbtype = dbtype;
	}
	/**
	 * 分值
	 */
	private int scoreNumber;
	/**
	 * 类型
	 */
	private String type;
	/**
	 * 数据库类型
	 */
	private int dbtype;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 根据类型返回积分值
	* @Title: getScore 
	* @Description: 
	* @param @param score
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	public static int getScore(Score score){
		return score.getScoreNumber();
	}
	Score(int scoreNumber,String type,int dbtype){
		this.scoreNumber = scoreNumber;
		this.type=type;
		this.dbtype = dbtype;
	}
	public int getScoreNumber() {
		return scoreNumber;
	}
	public void setScoreNumber(int scoreNumber) {
		this.scoreNumber = scoreNumber;
	}
	
}
