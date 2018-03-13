package com.framework.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.framework.BusinessException;
import com.framework.DicHelper;
import com.framework.PageList;
import com.framework.UploadType;
import com.qc.dao.BaseDao;
import com.qc.dao.Impl.BaseDaoImpl;
import com.qc.model.Dicattrgender;
import com.qc.model.UserLogin;
import com.qc.service.UserService;



public class ContextInitListener implements ServletContextListener {

	

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		DicHelper.setAc(ac);
		DicHelper.init();
		//初始化文件路径
		UploadType.init();
	}

}
