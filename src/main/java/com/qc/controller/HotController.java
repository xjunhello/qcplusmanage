package com.qc.controller;

import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.framework.BusinessException;
import com.framework.Constants;
import com.framework.DicHelper;
import com.framework.JsonMessage;
import com.framework.PageList;
import com.qc.model.Dicattrgender;
import com.qc.model.Receiveorder;
import com.qc.model.Receiveordercompany;
import com.qc.model.Sendorder;
import com.qc.model.Hot;
import com.qc.service.CarouselService;
import com.qc.service.HotService;
import com.qc.service.RoleService;
import com.qc.service.Score;
import com.qc.service.ScoreService;
import com.qc.service.UserService;

/**
 * 热点资讯管理
* @ClassName: HotController 
* @Description: 管理热点资讯 和多媒体数据的获取
* @author xinjun.zhang
* @date 2016年10月19日 下午1:44:36 
*
 */
@Controller
@RequestMapping("/hot")
public class HotController {
	
	@Resource(name = "hotService")
	private HotService hotService;
	
	private final static Logger logger = Logger.getLogger(HotController.class);
	
	

	@RequestMapping({"/list"})
	public String list(HttpSession httpSession, Model model,
			@RequestParam(value = "pageNo", required = false) Integer  pageNo,
			@RequestParam(value = "pageSize", required = false) Integer  pageSize, 
			@RequestParam(value = "orderBy", required = false) String orderBy) throws BusinessException {
		if(pageNo==null){
			pageNo=Constants.PAGENO;
		}
		if(pageSize==null){
			pageSize=Constants.PAGESIZE;
		}
//		Map<String,Object> params = new HashMap<String,Object>();
//		if(!StringUtils.isEmpty(StringUtils.trim(name))){
//			params.put("name", StringUtils.trim(name));
//		}
//		if(!StringUtils.isEmpty(StringUtils.trim(descrtion))){
//			params.put("descrtion", StringUtils.trim(descrtion));
//		}
//		if(!StringUtils.isEmpty(StringUtils.trim(orderBy))){
//			params.put("orderby", StringUtils.trim(orderBy));
//		}
		PageList<Hot> page = hotService.findPageList(pageNo, pageSize, null);
		model.addAttribute("page", page);
		model.addAttribute("action", "hot/list");
		model.addAttribute("toAddAction", "hot/toadd");
		model.addAttribute("addAction", "hot/add");
		model.addAttribute("toUpdateAction", "hot/toupdate");
		model.addAttribute("updateAction", "hot/update");
		model.addAttribute("deleteAction", "hot/delete");
		model.addAttribute("batchDeleteAction", "hot/batchdelete");
		model.addAttribute("detailAction", "hot/detail");
		return "hot/hotlist";
	}

	
	
	
	/**
	 * 跳转到添加页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd", method = RequestMethod.GET)
	public String toadd(HttpSession httpSession, Model model) {
		return "hot/hotadd";
	}
	


	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String add(HttpSession httpSession, Model model,Hot hot, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		hot.setCreateDate(new Date());
		hotService.save(hot);
		//TODO 富文本的保存 转化成路径
		return JsonMessage.success(response,hot.getId()+"");
	}
	/**
	 * 删除操作
	 * 
	 * @param httpSession
	 * @param id
	 * @return
	 * @throws BusinessException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(HttpSession httpSession, @PathVariable String id, HttpServletResponse response,
			Locale locale) throws NumberFormatException, BusinessException {
		if(id==null){
			return JsonMessage.error(response, "deleteerror", "参数错误");
		}
		hotService.delete(Integer.parseInt(id));
		return JsonMessage.success(response);
	}

	/**
	 * deleteBatch(批量删除用户)<br/>
	 * (这里描述这个方法适用条件 – 可选)<br/>
	 * 
	 * @param httpSession
	 * @param id
	 * @return String
	 * @exception 
	 * @since 1.0.0
	 */
	@RequestMapping(value = "/batchdelete", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String batchdelete(HttpSession httpSession,  String id, HttpServletResponse response, Locale locale) {
		if(id==null){
			return JsonMessage.error(response, "deleteerror", "参数错误");
		}
		

		String[] ids = id.split(",");
		try {
			for (int i = 0; i < ids.length; i++) {
				hotService.delete(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			logger.error("批量删除角色失败",e);
			return JsonMessage.error(response, "批量删除角色失败，系统错误！");
		}
		return JsonMessage.success(response);
	}
	
	/**
	 * 
	 * 
	 * @param model
	 * @return
	 * @throws BusinessException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/toupdate/{id}", method = RequestMethod.GET)
	public String toupdate(HttpSession httpSession, Model model,@PathVariable String id,HttpServletResponse response) throws NumberFormatException, BusinessException {
		if(id==null)
			return JsonMessage.error(response, "id参数不合法");
		Hot hot = hotService.findById(Integer.parseInt(id));
		if(hot==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("hot", hot);
		return "hot/hotupdate";
	}
	
	/**
	 * 详情
	* @Title:  
	* @Description: 跳转到详情
	* @param @param httpSession
	* @param @param model
	* @param @param id
	* @param @param response
	* @param @return
	* @param @throws NumberFormatException
	* @param @throws BusinessException    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(HttpSession httpSession, Model model,@PathVariable String id,HttpServletResponse response) throws NumberFormatException, BusinessException {
		if(id==null)
			return JsonMessage.error(response, "id参数不合法");
		Hot hot = hotService.findById(Integer.parseInt(id));
		if(hot==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("hot", hot);
		return "hot/hotdetail";
	}
	
	/**
	 * @throws BusinessException 
	 * 
	* @Title: update 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param httpSession
	* @param @param model
	* @param @param hot
	* @param @param response
	* @param @param locale
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String update(HttpSession httpSession, Model model,  Hot hot, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		hot.setCreateDate(new Date());
		hotService.update(hot);
		return JsonMessage.success(response);
	}
	
	
}