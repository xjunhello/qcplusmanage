package com.framework;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.ckfinder.connector.configuration.ConfigurationFactory;
import com.ckfinder.connector.utils.FileUtils;
import com.framework.util.MD5Util;
import com.qc.controller.UserController;

public enum UploadType {

	ORDER, REPORT, FILE, IMAGE, USER_ICON,SENDER_CARDPHOTO,RECEVER_PHOTO,RECEVER_CARDPHOTO,RECECOMP_CARDPHOTO,RECECOMP_LOGO,TEMP,
	CAROUSEL,MONEY_ATTACH;
	private final static Logger logger = Logger.getLogger(UploadType.class);
	/**
	 * 真实路径
	 */
	public static  String ROOT_DIRTECTORY = "d://upload";
	/**
	 * 相对路径
	 */
	public static  String HTTP_DIRTECTORY_PREIX = "http://127.0.0.1:8888/qcsystem/";
	
	public static void init(){
		try {
			ROOT_DIRTECTORY = ConfigurationFactory.getInstace().getConfiguration().getBaseDir();
			HTTP_DIRTECTORY_PREIX = ConfigurationFactory.getInstace().getConfiguration().getBaseDir();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("初始化上传路径失败！");
		}
		
	}
	// file/日期/用户ID/文件名
	public static final String DIRECTORY_FILE = "file";
	// image/日期/用户ID/文件名
	public static final String DIRECTORY_IMAGE = "image";
	// order/日期/用户ID/订单编号/文件名
	public static final String DIRECTORY_ORDER = "order";
	// report/日期/用户ID/订单编号_报告编号/文件名
	public static final String DIRECTORY_REPORT = "report";
	// temp/日期/用户ID/文件名
	public static final String DIRECTORY_TEMP = "temp";
	
	public static final String DIRECTORY_USER = "user";
	
	
	/**
	 * 
	* @Title: generateSavePath 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param type
	* @param @param filename
	* @param @param userid
	* @param @param orderCode
	* @param @param reportCode
	* @param @return
	* @param @throws BusinessException    设定文件 
	* @return Pair<String,String>    返回类型 first 相对路径 second 实际路径
	* @throws
	 */
	public static Pair<String,String> generateSavePath(UploadType type,String filename, Integer userid,
			String orderCode, String reportCode) throws BusinessException {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String path = null;
		if(userid==null){
			throw new BusinessException("系统错误","用户ID为空");
		}
		switch (type) {
		case ORDER:
			if(orderCode==null||StringUtils.isEmpty(StringUtils.trim(orderCode))){
				throw new BusinessException("系统错误","文件上传：订单编码为空！");	
			}
			path = DIRECTORY_ORDER + File.separator + date
					+ File.separator + userid + File.separator + orderCode
					+ File.separator+filename;
			break;
		case REPORT:
			if(orderCode==null||StringUtils.isEmpty(StringUtils.trim(orderCode))){
				throw new BusinessException("系统错误","文件上传：订单编码为空！");	
			}
			if(reportCode==null||StringUtils.isEmpty(StringUtils.trim(reportCode))){
				throw new BusinessException("系统错误","文件上传：报告编码为空！");	
			}
			path = DIRECTORY_REPORT + File.separator + date
					+ File.separator + userid + File.separator + orderCode
					+ File.separator+reportCode+File.separator+filename;
			break;
		case FILE:
			path = DIRECTORY_FILE + File.separator + date
					+ File.separator + userid + File.separator+filename;
			break;
		case IMAGE:
			path = DIRECTORY_IMAGE + File.separator + date
					+ File.separator + userid + File.separator+filename ;
			break;
		case TEMP:
			path = DIRECTORY_TEMP + File.separator + date
					+ File.separator + userid + File.separator+filename ;
			break;
		case SENDER_CARDPHOTO:
			path = DIRECTORY_USER + File.separator + date
					+ File.separator + userid + File.separator+"scard"+filename ;
			break;
		case RECEVER_PHOTO:
			path = DIRECTORY_USER + File.separator + date
					+ File.separator + userid + File.separator +"rephoto_"+filename;
			break;
		case RECEVER_CARDPHOTO:
			path = DIRECTORY_USER + File.separator + date
					+ File.separator + userid + File.separator +"recard_"+filename;
			break;

		case RECECOMP_CARDPHOTO:
			path = DIRECTORY_USER + File.separator + date
					+ File.separator + userid + File.separator+"rpcard_"+filename ;
			break;

		case RECECOMP_LOGO:
			path = DIRECTORY_USER + File.separator + date
					+ File.separator + userid + File.separator+"rplogo_"+filename ;
			break;
		case CAROUSEL:
			path = DIRECTORY_IMAGE + File.separator + "carousel"
					+ File.separator +filename ;
			break;
		case MONEY_ATTACH:
			path = DIRECTORY_USER+File.separator+"moneychange"
		+File.separator+MD5Util.MD5(filename+System.currentTimeMillis())+"."+FileUtils.getFileExtension(filename);
			break;
		default:
			path = "tmp";
			break;
		}
		return new Pair<String, String>(path,ROOT_DIRTECTORY+File.separator+path);
	}
	
}

