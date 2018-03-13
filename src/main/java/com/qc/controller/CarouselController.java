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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ckfinder.connector.utils.FileUtils;
import com.ckfinder.connector.utils.ImageUtils;
import com.framework.BusinessException;
import com.framework.Constants;
import com.framework.DicHelper;
import com.framework.JsonMessage;
import com.framework.PageList;
import com.framework.UploadHelper;
import com.framework.UploadType;
import com.framework.util.MD5Util;
import com.qc.model.Dicattrgender;
import com.qc.model.Receiveorder;
import com.qc.model.Receiveordercompany;
import com.qc.model.Sendorder;
import com.qc.model.Carousel;
import com.qc.model.UserLogin;
import com.qc.service.CarouselService;
import com.qc.service.CarouselService;
import com.qc.service.RoleService;
import com.qc.service.Score;
import com.qc.service.ScoreService;
import com.qc.service.UserService;

/**
 * 热点资讯管理
* @ClassName: CarouselController 
* @Description: 管理热点资讯 和多媒体数据的获取
* @author xinjun.zhang
* @date 2016年10月19日 下午1:44:36 
*
 */
@Controller
@RequestMapping("/carousel")
public class CarouselController {
	
	@Resource(name = "carouselService")
	private CarouselService carouselService;
	
	private final static Logger logger = Logger.getLogger(CarouselController.class);
	
	

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
		PageList<Carousel> page = carouselService.findPageList(pageNo, pageSize, null);
		model.addAttribute("page", page);
		model.addAttribute("action", "carousel/list");
		model.addAttribute("toAddAction", "carousel/toadd");
		model.addAttribute("addAction", "carousel/add");
		model.addAttribute("toUpdateAction", "carousel/toupdate");
		model.addAttribute("updateAction", "carousel/update");
		model.addAttribute("deleteAction", "carousel/delete");
		model.addAttribute("batchDeleteAction", "carousel/batchdelete");
		model.addAttribute("detailAction", "carousel/detail");
		
		model.addAttribute("baseurl", UploadType.HTTP_DIRTECTORY_PREIX);
		return "carousel/carousellist";
	}

	
	
	
	/**
	 * 跳转到添加页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd", method = RequestMethod.GET)
	public String toadd(HttpSession httpSession, Model model) {
		return "carousel/carouseladd";
	}
	


	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String add(HttpSession httpSession, Model model,Carousel carousel, 
			@RequestParam(required=false,value="carouselfile") MultipartFile carouselfile,
			HttpServletResponse response, Locale locale) throws BusinessException {
		//更新图片
		if(carouselfile!=null){
			String ralitivePath = null;
			try{
				UserLogin user = (UserLogin)httpSession.getAttribute(Constants.SESSION_MANAGE_USER_SIGN);
				if(user==null){
					throw new BusinessException("系统异常","没有获取到登录用户");
				}
				if(!ImageUtils.isImage(carouselfile.getOriginalFilename())){
					throw new BusinessException("系统异常","请上传有效的图像文件");
				}
				String extension = FileUtils.getFileExtension(carouselfile.getOriginalFilename());
				String newfilename = MD5Util.MD5(System.currentTimeMillis()+user.getId()+user.getLoginname())+"."+extension;
				 ralitivePath = UploadHelper.writeToFile(UploadType.CAROUSEL, newfilename, carouselfile.getInputStream(), true,
						user.getId(),null,null);
				carousel.setCreateDate(new Date());
				carousel.setImagePath(ralitivePath);
				carouselService.save(carousel);
			}catch(Exception e){
				logger.error("保存轮播图失败！");
				UploadHelper.delete(ralitivePath);
				return JsonMessage.error(response, "系统错误","轮播图保存失败！"+e.getMessage());
			}
		}
		return JsonMessage.success(response,carousel.getId()+"");
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
		Carousel  old = carouselService.findById(Integer.parseInt(id));
		UploadHelper.delete(old.getImagePath());
		carouselService.delete(Integer.parseInt(id));
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
				Carousel  old = carouselService.findById(i);
				UploadHelper.delete(old.getImagePath());
				carouselService.delete(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			logger.error("批量删除轮播图失败",e);
			return JsonMessage.error(response, "批量删除轮播图失败，系统错误！");
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
		Carousel carousel = carouselService.findById(Integer.parseInt(id));
		if(carousel==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("carousel", carousel);
		return "carousel/carouselupdate";
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
		Carousel carousel = carouselService.findById(Integer.parseInt(id));
		if(carousel==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("carousel", carousel);
		return "carousel/carouseldetail";
	}
	
	/**
	 * @throws BusinessException 
	 * 
	* @Title: update 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param httpSession
	* @param @param model
	* @param @param carousel
	* @param @param response
	* @param @param locale
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String update(HttpSession httpSession, Model model,  Carousel carousel, 
			HttpServletResponse response, Locale locale) throws BusinessException {
		carousel.setCreateDate(new Date());
		carouselService.update(carousel);
		return JsonMessage.success(response);
	}
	
	
}