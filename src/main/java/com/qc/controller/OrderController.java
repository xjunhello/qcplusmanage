package com.qc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.framework.BusinessException;
import com.framework.Constants;
import com.framework.JsonMessage;
import com.framework.PageList;
import com.qc.model.Receiveorder;
import com.qc.model.Receiveordercompany;
import com.qc.model.Orderdesc;
import com.qc.service.OrderService;
import com.qc.service.UserService;
/**
 * 订单管理
* @ClassName: OrderController 
* @Description: 订单管理 
* @author xinjun.zhang
* @date 2016年10月19日 上午9:44:08 
*
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource(name = "orderService")
	private OrderService orderService;
	@Resource(name = "userService")
	private UserService userService;
	private final static Logger logger = Logger.getLogger(OrderController.class);
	

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
		PageList<Orderdesc> page = orderService.findPageList(pageNo, pageSize, null);
		model.addAttribute("page", page);
		model.addAttribute("action", "order/list");
		model.addAttribute("toAddAction", "order/toadd");
		model.addAttribute("addAction", "order/add");
		model.addAttribute("toUpdateAction", "order/toupdate");
		model.addAttribute("updateAction", "order/update");
		model.addAttribute("deleteAction", "order/delete");
		model.addAttribute("batchDeleteAction", "order/batchdelete");
		model.addAttribute("toCheckAction", "order/tocheck");
		model.addAttribute("checkAction", "order/check");
		model.addAttribute("toUpdateDetailAction", "order/todetailupdate");
		model.addAttribute("updateDetailAction", "order/updatedetail");
		model.addAttribute("toDetailAction", "order/detail");
		model.addAttribute("toAllotAction", "order/toallot");
		return "order/orderlist";
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
		Orderdesc order = orderService.findById(Integer.parseInt(id));
		if(order==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("order", order);
		return "order/ordercheck";
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
		Orderdesc order = orderService.findById(Integer.parseInt(id));
		//TODO  审核
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
		Orderdesc order = orderService.findById(Integer.parseInt(id));
		if(order==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("order", order);
		return "order/orderdetail";
	}
	

	@RequestMapping(value = "/toallot/{id}", method = RequestMethod.GET)
	public String toallot(HttpSession httpSession, Model model,@PathVariable String id,HttpServletResponse response) throws NumberFormatException, BusinessException {
		if(id==null)
			return JsonMessage.error(response, "id参数不合法");
		Orderdesc order = orderService.findById(Integer.parseInt(id));
		if(order==null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("order", order);
		List<Receiveorder> recevers = userService.adviceReceiveorders(order.getId());
		List<Receiveordercompany> rececomps = userService.adviceReceiveordercompanys(order.getId());
		model.addAttribute("recevers", recevers);
		model.addAttribute("rececomps", rececomps);
		return "order/orderallot";
	}
	
	/**
	 * 
	* @Title: allotRecever 
	* @Description: 分配 
	* @param @param httpSession
	* @param @param model
	* @param @param orderid
	* @param @param recetype
	* @param @param receid
	* @param @param response
	* @param @return
	* @param @throws NumberFormatException
	* @param @throws BusinessException    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "/allot/{orderid}/{recetype}/{receid}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String allot(HttpSession httpSession, Model model,@PathVariable String orderid,
			@PathVariable String recetype,@PathVariable String receid,
			HttpServletResponse response) throws NumberFormatException, BusinessException {
		if(orderid==null||recetype==null||receid==null){
			return JsonMessage.error(response, "参数错误");
		}else if(orderid.split("_").length!=2||recetype.split("_").length!=2||receid.split("_").length!=2){
			return JsonMessage.error(response, "参数错误");
		}else{
			orderService.allotRecever(Integer.parseInt(orderid.split("_")[1]), Integer.parseInt(recetype.split("_")[1]), Integer.parseInt(receid.split("_")[1]));
		}
		
		return JsonMessage.success(response);
	}
	

	@RequestMapping(value = "/toadd", method = RequestMethod.GET)
	public String toadd(HttpSession httpSession, Model model,HttpServletResponse response) throws NumberFormatException, BusinessException {
		//model.addAttribute("rececomps", rececomps);
		return "order/orderadd";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(HttpSession httpSession, Model model,@RequestParam(value="productfile") MultipartFile productfile,Orderdesc order,HttpServletResponse response) throws NumberFormatException, BusinessException {
		//FileUp
		order.setOrderCode("1");
		
		order.setProductDatum("test");
		orderService.save(order);
		return JsonMessage.success(response);
	}
	
	
}