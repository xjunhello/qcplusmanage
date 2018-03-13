package com.framework;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;



public class Constants {
	/**
	 * 用户反馈邮箱地址
	 */
	public static String serviceMailAddress;
	/**
	 * 上下文环境
	 */
	public static  ApplicationContext applicationContext;
	/**
	 * 菜单对象
	 * 
	 */
	public static List< ?> menu;
	public static List<String> years;
	
//	/**
//	 * 前端用户登录标识
//	 */
//	public static final String SESSION_USER_SIGN = "SESSION_USER_SIGN";
	/**
	 * 管理员标识
	 */
	public static final String SESSION_MANAGE_USER_SIGN = "SESSION_MANAGE_USER_SIGN";
	
//	/**
//	 * 后台管理菜单对象
//	 */
//	public static final String SESSION_MANAGE_FUNCTIONS = "SESSION_MANAGE_FUNCTIONS";
//	/**
//	 * 浏览器前端用户标识
//	 */
//	public static final String FRONT_COOKIE_EMAIL = "QCPLUS_FRONT_COOKIE_EMAIL";
//	/**
//	 * 浏览器后台管理对象标识
//	 */
//	public static final String MANAGE_COOKIE_NAME = "QCPLUS_MANAGE_COOKIE_NAME";
	
	/**
	 * 默认分页参数
	 */
	public static final int PAGENO=1;
	public static final int PAGESIZE=50;
	
	/**
	 * 用户 登录类型
	 */
	/**
	 * 发单员
	 */
	public static final int USER_LOGTYPE_SENDER=1;
	/**
	 * 接单员
	 */
	public static final int USER_LOGTYPE_RECEVER=2;
	/**
	 * 发单员和接单员
	 */
	public static final int USER_LOGTYPE_SENDER_AND_RECEVER=3;
	/**
	 * 发单员和接单公司
	 */
	public static final int USER_LOGTYPE_SENDER_AND_RECEVERCOMP=4;
	
	/**
	 * 接单公司
	 */
	public static final int USER_LOGTYPE_RECEVERCOMP=5;
	/**
	 * 用户初始状态
	 */
	public static final int USER_STATUS_ORGIN=0;
	/**
	 * 用户待审核状态
	 */
	public static final int USER_STATUS_CHECK_WAIT=3;
	/**
	 * 用户待审核失败
	 */
	public static final int USER_STATUS_CHECK_FAIL=2;
	/**
	 * 用户正常状态
	 */
	
	public static final int USER_STATUS_NORMAL=1;
	/**
	 * 用户冻结状态
	 */
	public static final int USER_STATUS_DISABLED=0;
	/**
	 * 用户删除状态
	 */
	public static final int USER_STATUS_DELETED=0;
	/**
	 * 服务商类型
	 */
	public static final String ORDER_SERVICEPROVIDERTYPE_1="第三方验货公司";
	public static final String ORDER_SERVICEPROVIDERTYPE_2="个人验货员";
	/**
	 * 消息类型
	 */
	public static final String MESSAGE_TYPE_1="交易提醒";
	public static final String MESSAGE_YPE_2="系统通知";
	
	
	/**
	 * 消息状态
	 */
	public static final Integer MESSAGE_STATUS_UNREAD=0;
	public static final Integer MESSAGE_STATUS_READ=1;
	public static final String MESSAGE_STATUS_UNREAD_TEXT="未读";
	public static final String MESSAGE_STATUS_READ_TEXT="已读";
}
