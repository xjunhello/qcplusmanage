package com.qc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.framework.BusinessException;
import com.framework.Constants;
import com.framework.JsonMessage;
import com.framework.PageList;
import com.qc.model.Role;
import com.qc.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	/**                   公共部分 start                    **/
	/**
	 * 当前Controller的视图目录
	 */
	private String viewBasePath="user";
	/**
	 * 日志
	 */
	private final static Logger logger = Logger.getLogger(RoleController.class);
	/**                   公共部分 end                    **/
	
	
	@Resource(name = "roleService")
	private RoleService roleService;
	

	

	/**
	 * @throws BusinessException 
	 * 
	* @Title: list 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param httpSession
	* @param @param model
	* @param @param pageNo
	* @param @param pageSize
	* @param @param orderBy
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping({"/list"})
	public String list(HttpSession httpSession, Model model,
			@RequestParam(value = "pageNo", required = false) Integer  pageNo,
			@RequestParam(value = "pageSize", required = false) Integer  pageSize, 
			@RequestParam(value = "orderBy", required = false) String orderBy,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "descrtion", required = false) String descrtion) throws BusinessException {
		if(pageNo==null){
			pageNo=Constants.PAGENO;
		}
		if(pageSize==null){
			pageSize=Constants.PAGESIZE;
		}
		Map<String,Object> params = new HashMap<String,Object>();
		if(!StringUtils.isEmpty(StringUtils.trim(name))){
			params.put("name", StringUtils.trim(name));
		}
		if(!StringUtils.isEmpty(StringUtils.trim(descrtion))){
			params.put("descrtion", StringUtils.trim(descrtion));
		}
//		if(!StringUtils.isEmpty(StringUtils.trim(orderBy))){
//			params.put("orderby", StringUtils.trim(orderBy));
//		}
		PageList<Role> page = roleService.findPageList(pageNo, pageSize, params);
		model.addAttribute("page", page);
		model.addAttribute("action", "role/list");
		model.addAttribute("toAddAction", "role/toadd");
		model.addAttribute("addAction", "role/add");
		model.addAttribute("toUpdateAction", "role/toupdate");
		model.addAttribute("updateAction", "role/update");
		model.addAttribute("deleteAction", "role/delete");
		model.addAttribute("batchDeleteAction", "role/batchdelete");
		return "user/rolelist";
	}

	
	
	
	/**
	 * 跳转到添加页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd", method = RequestMethod.GET)
	public String toadd(HttpSession httpSession, Model model) {
		return "user/roleadd";
	}
	
	/**
	 * 跳转到修改页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toupdate", method = RequestMethod.GET)
	public String toupdate(HttpSession httpSession, Model model) {
		return "user/roleupdate";
	}

	/**
	 * @throws BusinessException 
	 * 
	* @Title: add 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param httpSession
	* @param @param model
	* @param @param role
	* @param @param response
	* @param @param locale
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String add(HttpSession httpSession, Model model,  Role role, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		role.setIsdelete(0);
		roleService.save(role);
		return JsonMessage.success(response);
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
		
		roleService.delete(Integer.parseInt(id));
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
				roleService.delete(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			logger.error("批量删除角色失败",e);
			return JsonMessage.error(response, "批量删除角色失败，系统错误！");
		}
		return JsonMessage.success(response);
	}
	
	/**
	 * 跳转到添加页面
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
		Role role = roleService.findById(Integer.parseInt(id));
		if(role==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("role", role);
		return "user/roleupdate";
	}
	
	/**
	 * @throws BusinessException 
	 * 
	* @Title: update 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param httpSession
	* @param @param model
	* @param @param role
	* @param @param response
	* @param @param locale
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String update(HttpSession httpSession, Model model,  Role role, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		roleService.update(role);
		return JsonMessage.success(response);
	}
}