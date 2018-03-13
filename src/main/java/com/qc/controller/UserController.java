package com.qc.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.BusinessException;
import com.framework.Constants;
import com.framework.DicHelper;
import com.framework.JsonMessage;
import com.framework.PageList;
import com.framework.UploadHelper;
import com.framework.UploadType;
import com.google.gson.Gson;
import com.qc.model.Dicattrgender;
import com.qc.model.Receiveorder;
import com.qc.model.Receiveordercompany;
import com.qc.model.ReceviceAdvice;
import com.qc.model.SenderAdvice;
import com.qc.model.Sendorder;
import com.qc.model.UserLogin;
import com.qc.service.RoleService;
import com.qc.service.Score;
import com.qc.service.ScoreService;
import com.qc.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "roleService")
	private RoleService roleService;
	@Resource(name = "scoreService")
	private ScoreService scoreService;
	
	private final static Logger logger = Logger.getLogger(UserController.class);
	
	

	

	@RequestMapping("/toLogin")
	public String toLogin(HttpSession httpSession, Model model,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "retry", required = false) String retry) {
		model.addAttribute("username",username);
		//model.addAttribute("retry", retry);
		return "login";
	}
	
	/**
	 * lang(这里用一句话描述这个方法的作用)<br/>
	 * (这里描述这个方法适用条件 – 可选)<br/>
	 * @param request
	 * @return String
	 * @since 1.0.0
	 */
	@RequestMapping("/lang")
	public String lang(HttpServletRequest request) {
		String langType = request.getParameter("langType");
		if (langType.equals("zh")) {
			Locale locale = new Locale("zh", "CN");
			request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
		} else if (langType.equals("en")) {
			Locale locale = new Locale("en", "US");
			request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
		} else
			request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
					LocaleContextHolder.getLocale());

		return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/";
	}
	

	/**
	 * 登录提交页面
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpSession httpSession, String username, String password, Model model) {
		ModelAndView mav = new ModelAndView();
		UserLogin user = new UserLogin();
		user.setId(0);
		user.setLoginname(username);
		user.setLogtype(3);
		httpSession.setAttribute(Constants.SESSION_MANAGE_USER_SIGN, user);
		model.addAttribute("loginUserLogin", user);
		// 设置转向的视图名称
		mav.setViewName("/index");
		return mav;
	}

	/**
	  * Logout(退出时清空session)<br/>  
	  * (这里描述这个方法适用条件 – 可选)<br/>  
	  * @param httpSession
	  * @return String  
	  * @since 1.0.0
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String Logout(HttpSession httpSession) {
		httpSession.removeAttribute(Constants.SESSION_MANAGE_USER_SIGN);
		return "/login";
	}
	
	

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
		List<Dicattrgender> glist = DicHelper.getGenderList();
		for(Dicattrgender gender : glist){
			System.out.println("获取字典数据："+gender.getId()+"|"+gender.getName());
		}
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
		PageList<UserLogin> page = userService.findPageList(pageNo, pageSize, params);
		model.addAttribute("page", page);
		model.addAttribute("action", "user/list");
		model.addAttribute("toAddAction", "user/toadd");
		model.addAttribute("addAction", "user/add");
		model.addAttribute("toUpdateAction", "user/toupdate");
		model.addAttribute("updateAction", "user/update");
		model.addAttribute("deleteAction", "user/delete");
		model.addAttribute("batchDeleteAction", "user/batchdelete");
		model.addAttribute("toCheckAction", "user/tocheck");
		model.addAttribute("checkAction", "user/check");
		model.addAttribute("toUpdateDetailAction", "user/todetailupdate");
		model.addAttribute("updateDetailAction", "user/updatedetail");
		model.addAttribute("toDetailAction", "user/detail");
		return "user/userlist";
	}

	
	
	
	/**
	 * 跳转到添加页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd", method = RequestMethod.GET)
	public String toadd(HttpSession httpSession, Model model) {
		return "user/useradd";
	}
	
	/**
	 * 跳转到修改页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toupdate", method = RequestMethod.GET)
	public String toupdate(HttpSession httpSession, Model model) {
		return "user/userupdate";
	}

	
	/**
	 * 
	* @Title: addUser 
	* @Description: 保存基础信息
	* @param @param httpSession
	* @param @param model
	* @param @param user
	* @param @param response
	* @param @param locale
	* @param @return
	* @param @throws BusinessException    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String addUser(HttpSession httpSession, Model model,UserLogin user, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		user.setRole(roleService.findById(2));
		user.setCreateDate(new Date());
		user.setStatus(Constants.USER_STATUS_ORGIN);
		user.setScore(0);
		user.setMoney(0);
		userService.save(user);
		if(user.getId()!=0){
			return JsonMessage.success(response,user.getId()+"");
		}else{
			return JsonMessage.error(response,"500","保存基础信息失败");
		}
	}
	/**
	 * @throws IOException 
	 * 
	* @Title: addSender 
	* @Description: 保存发单员信息
	* @param @param httpSession
	* @param @param model
	* @param @param sender
	* @param @param response
	* @param @param locale
	* @param @return
	* @param @throws BusinessException    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/addSender", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String addSender(HttpSession httpSession, Model model,Sendorder sender,
			@RequestParam(required=true,value="userid") String userid,@RequestParam(required=false,value="cardphotofile") MultipartFile cardphotofile,
			HttpServletResponse response, Locale locale) throws BusinessException, IOException {
		UserLogin userLogin = userService.findById(Integer.parseInt(userid));
		if(sender!=null&&userLogin!=null){
			String ralitivePath = null;
			sender.setUserLogin(userLogin);
			sender.setCreateDate(new Date());
			sender.setCardphoto(ralitivePath);
			userService.save(sender);
			userService.setUserStatus(userLogin.getId(), Constants.USER_STATUS_CHECK_WAIT);
			//更新用户证件照
			if(cardphotofile!=null){
				try{
					UserLogin user = (UserLogin)httpSession.getAttribute(Constants.SESSION_MANAGE_USER_SIGN);
					if(user==null){
						throw new BusinessException("系统异常","没有获取到登录用户");
					}
					ralitivePath = UploadHelper.writeToFile(UploadType.SENDER_CARDPHOTO, cardphotofile.getOriginalFilename(), cardphotofile.getInputStream(), true,
							user.getId(),null,null);
					sender.setCardphoto(ralitivePath);
					userService.update(sender);
				}catch(Exception e){
					logger.error("保存证件照失败！");
				}
			}
			return JsonMessage.success(response);
		}else{
			return JsonMessage.error(response, "500", "参数错误");
		}
		
	}
	/**
	 * @throws IOException 
	 * 
	* @Title: addRecever 
	* @Description: 保存接单员信息
	* @param @param httpSession
	* @param @param model
	* @param @param recever
	* @param @param response
	* @param @param locale
	* @param @return
	* @param @throws BusinessException    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/addRecever", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String addRecever(HttpSession httpSession, Model model,Receiveorder recever, 
			@RequestParam(required=true,value="userid") String userid,
			@RequestParam(required=false,value="cardphotofile") MultipartFile cardphotofile,
			HttpServletResponse response, Locale locale) throws BusinessException, IOException {
		UserLogin userLogin = userService.findById(Integer.parseInt(userid));
		if(recever!=null&&userLogin!=null){
			recever.setUserLogin(userLogin);
			recever.setCreateDate(new Date());
			userService.save(recever);
			userService.setUserStatus(userLogin.getId(), Constants.USER_STATUS_CHECK_WAIT);
			if(cardphotofile!=null){
				try{
					UserLogin user = (UserLogin)httpSession.getAttribute(Constants.SESSION_MANAGE_USER_SIGN);
					if(user==null){
						throw new BusinessException("系统异常","没有获取到登录用户");
					}
					String ralitivePath = UploadHelper.writeToFile(UploadType.RECEVER_CARDPHOTO, cardphotofile.getOriginalFilename(), cardphotofile.getInputStream(), true,
							user.getId(),null,null);
					recever.setCardPhoto(ralitivePath);
					userService.update(recever);
				}catch(Exception e){
					logger.error("保存接单员证件照失败");
				}
			}
			return JsonMessage.success(response);
		}else{
			return JsonMessage.error(response, "500", "参数错误");
		}
	}
	
	/**
	 * @throws IOException 
	 * 
	* @Title: addReceComp 
	* @Description: 保存接单公司信息
	* @param @param httpSession
	* @param @param model
	* @param @param receComp
	* @param @param response
	* @param @param locale
	* @param @return
	* @param @throws BusinessException    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/addReceComp", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String addReceComp(HttpSession httpSession, Model model,Receiveordercompany receComp, 
			@RequestParam(required=true,value="userid") String userid,
			@RequestParam(required=false,value="cardphotofile") MultipartFile cardphotofile,
			@RequestParam(required=false,value="logofile") MultipartFile logofile,
			HttpServletResponse response, Locale locale) throws BusinessException, IOException {
		UserLogin userLogin = userService.findById(Integer.parseInt(userid));
		if(receComp!=null&&userLogin!=null){
			receComp.setUserLogin(userLogin);
			receComp.setCreateDate(new Date());
			userService.save(receComp);
			userService.setUserStatus(userLogin.getId(), Constants.USER_STATUS_CHECK_WAIT);
				UserLogin user = (UserLogin)httpSession.getAttribute(Constants.SESSION_MANAGE_USER_SIGN);
				if(user==null){
					throw new BusinessException("系统异常","没有获取到登录用户");
				}
				if(cardphotofile!=null&&cardphotofile.getSize()>0){
					try{
						receComp.setCardphoto(UploadHelper.writeToFile(UploadType.RECECOMP_CARDPHOTO, cardphotofile.getOriginalFilename(), cardphotofile.getInputStream(), true,
								user.getId(),null,null));
						userService.update(receComp);
					}catch(Exception ex){
						
					}
				}
				if(logofile!=null&&logofile.getSize()>0){
					try{
						receComp.setLogo(UploadHelper.writeToFile(UploadType.RECECOMP_LOGO, logofile.getOriginalFilename(), logofile.getInputStream(), true,
								user.getId(),null,null));
						userService.update(receComp);
					}catch(Exception ex){
						logger.error("保存接单公司Logo失败");
					}
				}
			return JsonMessage.success(response);
		}else{
			return JsonMessage.error(response, "500", "参数错误");
		}
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
		userService.delete(Integer.parseInt(id));
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
				userService.delete(Integer.parseInt(ids[i]));
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
		UserLogin user = userService.findById(Integer.parseInt(id));
		if(user==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("user", user);
		return "user/userupdate";
	}
	
	
	/**
	 * @throws BusinessException 
	 * 
	* @Title: update 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param httpSession
	* @param @param model
	* @param @param user
	* @param @param response
	* @param @param locale
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String update(HttpSession httpSession, Model model,  UserLogin user, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		userService.update(user);
		return JsonMessage.success(response);
	}
	
	/**
	 * 跳转到审核页面
	 * 
	 * @param model
	 * @return
	 * @throws BusinessException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/tocheck/{id}", method = RequestMethod.GET)
	public String tocheck(HttpSession httpSession, Model model,@PathVariable String id,HttpServletResponse response) throws NumberFormatException, BusinessException {
		if(id==null)
			return JsonMessage.error(response, "id参数不合法");
		UserLogin user = userService.findById(Integer.parseInt(id));
		if(user==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("user", user);
		int logtype = user.getLogtype();
		model.addAttribute("logtype", logtype);
		if(logtype==1){
			model.addAttribute("sender", userService.findSendorderByUserId(user.getId()));
		}else if(logtype==2){
			model.addAttribute("recever",userService.findReceiveorderByUserId(user.getId()));
		}else if(logtype==3){
			model.addAttribute("sender", userService.findSendorderByUserId(user.getId()));
			model.addAttribute("recever",userService.findReceiveorderByUserId(user.getId()));
		}else if(logtype==4){
			model.addAttribute("sender", userService.findSendorderByUserId(user.getId()));
			model.addAttribute("receComp", userService.findReceiveordercompanyByUserId(user.getId()));
		}
		return "user/usercheck";
	}
	
	/**
	 * 审核
	 * 
	 * @param id 用户ID
	 * @return
	 * @throws BusinessException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/check/{id}/{reback}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(HttpSession httpSession, Model model,@PathVariable String id,@PathVariable boolean reback,HttpServletResponse response) throws NumberFormatException, BusinessException {
		if(id==null)
			return JsonMessage.error(response, "id参数不合法");
		UserLogin user = userService.findById(Integer.parseInt(id));
		if(user==null)
			return JsonMessage.error(response, "id参数不合法");
		if(reback){
			userService.setUserStatus(user.getId(), Constants.USER_STATUS_NORMAL);
		}else{
			userService.setUserStatus(user.getId(), Constants.USER_STATUS_CHECK_FAIL);
		}
		
		return JsonMessage.success(response);
	}
	
	/**
	 * 详情
	 * 
	 * @param model
	 * @return
	 * @throws BusinessException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(HttpSession httpSession, Model model,@PathVariable String id,HttpServletResponse response) throws NumberFormatException, BusinessException {
		if(id==null)
			return JsonMessage.error(response, "id参数不合法");
		UserLogin user = userService.findById(Integer.parseInt(id));
		if(user==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("user", user);
		int logtype = user.getLogtype();
		model.addAttribute("logtype", logtype);
		if(logtype==1){
			model.addAttribute("sender", userService.findSendorderByUserId(user.getId()));
		}else if(logtype==2){
			model.addAttribute("recever",userService.findReceiveorderByUserId(user.getId()));
		}else if(logtype==3){
			model.addAttribute("sender", userService.findSendorderByUserId(user.getId()));
			model.addAttribute("recever",userService.findReceiveorderByUserId(user.getId()));
		}else if(logtype==4){
			model.addAttribute("sender", userService.findSendorderByUserId(user.getId()));
			model.addAttribute("receComp", userService.findReceiveordercompanyByUserId(user.getId()));
		}
		model.addAttribute("FileSystem", UploadType.HTTP_DIRTECTORY_PREIX);
		return "user/userdetail";
	}
	
	@RequestMapping(value = "/keywordsearch/{keyword}", method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String keywordsearch(HttpSession httpSession, Model model,@PathVariable String keyword, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		List<Receiveorder> recevers = userService.findReceiveordersByKeyword(keyword);
		List<Receiveordercompany> rececomps = userService.findReceiveordercompanysByKeyword(keyword);
		List<ReceviceAdvice> rads = new ArrayList<ReceviceAdvice>();
		for(Receiveorder r :recevers ){
			rads.add(new ReceviceAdvice(r.getId(),2,Constants.ORDER_SERVICEPROVIDERTYPE_2,Constants.ORDER_SERVICEPROVIDERTYPE_2+"|"+r.getName()+"|"+r.getNickname()+"|"+
					r.getEmail()+"|"+r.getServiceCity()+"|"+r.getCity()));
		}
		for(Receiveordercompany r :rececomps ){
			rads.add(new ReceviceAdvice(r.getId(),1,Constants.ORDER_SERVICEPROVIDERTYPE_1,Constants.ORDER_SERVICEPROVIDERTYPE_1+"|"+r.getName()+"|"+r.getNikename()+"|"+
					r.getEmail()+"|"+r.getServiceCity()+"|"+r.getCity()));
		}
		//List<Receiveordercompany> rececomps = userService.findReceiveordercompanysByKeywork(keyword);
		Gson gson = new Gson();
		return gson.toJson(rads);
	}
	
	@RequestMapping(value = "/senderSearch/{keyword}", method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String senderSearch(HttpSession httpSession, Model model,@PathVariable String keyword, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		List<Sendorder> ss = userService.adviceSenders(keyword, null);
		List<SenderAdvice> sads = new ArrayList<SenderAdvice>();
		for(Sendorder s :ss ){
			sads.add(new SenderAdvice(s.getId(), s.getName(),s.getNikename()+"|"
					+s.getEmail()+"|"+s.getTelephone()+"|"+s.getContact()));
		}
		Gson gson = new Gson();
		return gson.toJson(sads);
	}
	
	@RequestMapping(value = "/provinces/{countryCode}", method=RequestMethod.GET)
	public String getProvincesByCountryCode(HttpSession httpSession, Model model,
			@PathVariable String countryCode, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		model.addAttribute("provinces", DicHelper.getProvincesByCountryCode(countryCode));
		return "public/province";
	}
	
	@RequestMapping(value = "/citys/{provinceCode}", method=RequestMethod.GET)
	public String getCitysByProvinceCode(HttpSession httpSession, Model model,
			@PathVariable String provinceCode, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		model.addAttribute("citys", DicHelper.getCitysListByProvinceCode(provinceCode));
		return "public/city";
	}
	

}