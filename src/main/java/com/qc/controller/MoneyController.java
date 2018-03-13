package com.qc.controller;

import java.io.IOException;
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

import com.framework.BusinessException;
import com.framework.Constants;
import com.framework.JsonMessage;
import com.framework.MoneyChangeStatus;
import com.framework.MoneyChangeType;
import com.framework.PageList;
import com.framework.Pair;
import com.framework.ParameterHelper;
import com.framework.UploadHelper;
import com.framework.UploadType;
import com.qc.model.Moneychange;
import com.qc.model.UserLogin;
import com.qc.service.MoneyService;

/**
 * 财务管理 需要细化权限
 * 
 * @ClassName: MoneychangeController
 * @Description:
 * @author xinjun.zhang
 * @date 2016年10月19日 下午1:44:36
 *
 */
@Controller
@RequestMapping("/money")
public class MoneyController {

	@Resource(name = "moneyService")
	private MoneyService moneyService;

	private final static Logger logger = Logger
			.getLogger(MoneyController.class);

	@RequestMapping({ "/list" })
	public String list(
			HttpSession httpSession,
			Model model,
			@RequestParam(value = "pageNo", required = false) Integer pageNo,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			@RequestParam(value = "orderBy", required = false) String orderBy,
			@RequestParam(value = "type", required = false) Integer type,
			@RequestParam(value = "status", required = false) Integer status,
			@RequestParam(value = "userid", required = false) Integer userid,
			@RequestParam(value = "orderid", required = false) Integer orderid)
			throws BusinessException {
		if (pageNo == null) {
			pageNo = Constants.PAGENO;
		}
		if (pageSize == null) {
			pageSize = Constants.PAGESIZE;
		}
		
		Map<String,Object> params = ParameterHelper.generateParameters(new Pair<String,Object>("type",type),
				new Pair<String,Object>("status",status),
				new Pair<String,Object>("userid",userid),
				new Pair<String,Object>("orderid",orderid));
		PageList<Moneychange> page = moneyService.findPageList(pageNo,
				pageSize, params,orderBy);
		page.setParams(params);
		model.addAttribute("page", page);
		model.addAttribute("action", "money/list");
		model.addAttribute("toAddAction", "money/toadd");
		model.addAttribute("addAction", "money/add");
		model.addAttribute("toUpdateAction", "money/toupdate");
		model.addAttribute("updateAction", "money/update");
		model.addAttribute("deleteAction", "money/delete");
		model.addAttribute("batchDeleteAction", "money/batchdelete");
		model.addAttribute("detailAction", "money/detail");
		model.addAttribute("reviewAction", "money/review");
		return "money/moneylist";
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd", method = RequestMethod.GET)
	public String toadd(HttpSession httpSession, Model model) {
		return "money/moneyadd";
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
	public String delete(HttpSession httpSession, @PathVariable String id,
			HttpServletResponse response, Locale locale)
			throws NumberFormatException, BusinessException {
		if (id == null) {
			return JsonMessage.error(response, "deleteerror", "参数错误");
		}
		moneyService.delete(Integer.parseInt(id));
		return JsonMessage.success(response);
	}

	/**
	 * deleteBatch(批量删除)<br/>
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
	public String batchdelete(HttpSession httpSession, String id,
			HttpServletResponse response, Locale locale) {
		if (id == null) {
			return JsonMessage.error(response, "deleteerror", "参数错误");
		}

		String[] ids = id.split(",");
		try {
			for (int i = 0; i < ids.length; i++) {
				moneyService.delete(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			logger.error("批量删除失败", e);
			return JsonMessage.error(response, "批量删除失败，系统错误！");
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
	public String toupdate(HttpSession httpSession, Model model,
			@PathVariable String id, HttpServletResponse response)
			throws NumberFormatException, BusinessException {
		if (id == null)
			return JsonMessage.error(response, "id参数不合法");
		Moneychange money = moneyService.findById(Integer.parseInt(id));
		if (money == null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("money", money);
		return "money/moneyupdate";
	}

	/**
	 * 详情
	 * 
	 * @Title:
	 * @Description: 跳转到详情
	 * @param @param httpSession
	 * @param @param model
	 * @param @param id
	 * @param @param response
	 * @param @return
	 * @param @throws NumberFormatException
	 * @param @throws BusinessException 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(HttpSession httpSession, Model model,
			@PathVariable String id, HttpServletResponse response)
			throws NumberFormatException, BusinessException {
		if (id == null)
			return JsonMessage.error(response, "id参数不合法");
		Moneychange money = moneyService.findById(Integer.parseInt(id));
		if (money == null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("entity", money);
		return "money/moneydetail";
	}

	// public void log(int userid,String username,String optype,String
	// message,String )
	/**
	 * 付款审核，提现确认
	 * 
	 * @param httpSession
	 * @param model
	 * @param id
	 *            申请的ID
	 * @param type
	 *            类型
	 * @param desc
	 *            描述
	 * @param acctchfile
	 *            附件
	 * @param response
	 * @param locale
	 * @return
	 * @throws BusinessException
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String update(
			HttpSession httpSession,
			Model model,
			@RequestParam(required = true, value = "userid") Integer userid,
			@RequestParam(required = true, value = "orderCode") String orderCode,
			@RequestParam(required = true, value = "id") Integer id,
			@RequestParam(required = true, value = "type") Integer type,
			@RequestParam(required = false, value = "desc") String desc,
			@RequestParam(required = false, value = "attachfile") MultipartFile attachfile,
			@RequestParam(required = false, value = "status") Integer status,
			HttpServletResponse response, Locale locale)
			throws BusinessException {
		// 校验
		Moneychange dbEntity = moneyService.findById(id);
		// 日志
		UserLogin user = (UserLogin) httpSession
				.getAttribute(Constants.SESSION_MANAGE_USER_SIGN);
		if (dbEntity == null) {
			throw new BusinessException("参数错误", "找不到对应的金额变更记录！");
		}
		if (userid != dbEntity.getUserLogin().getId()) {
			throw new BusinessException("参数错误", "传入的用户参数非法！");
		}
		if (orderCode != null
				&& !orderCode.equals(dbEntity.getOrderdesc().getOrderCode())) {
			throw new BusinessException("参数错误", "传入的订单参数非法！");
		}
		MoneyChangeType mtype = MoneyChangeType.getInstance(type);
		if (mtype == null || mtype.type != dbEntity.getType()) {
			throw new BusinessException("参数错误", "传入的变更类型参数非法！");
		}

		MoneyChangeStatus mstatus = MoneyChangeStatus.getInstance(status);
		if (mstatus == null) {
			throw new BusinessException("参数错误", "传入的操作参数非法！");
		}
		String filepath = null;
		try {
			filepath = UploadHelper.writeToFile(UploadType.MONEY_ATTACH,
					attachfile.getOriginalFilename(),
					attachfile.getInputStream(), true, userid, orderCode, null);

		} catch (IOException e) {
			logger.error("保存金额变更附件失败", e);
		} catch (Exception e) {
			logger.error("保存金额变更附件失败", e);
		} finally {
			moneyService.update(id, mstatus, desc, filepath);
		}
		return JsonMessage.success(response);
	}

	@RequestMapping(value = "/review/{id}", method = RequestMethod.GET)
	public String review(HttpSession httpSession, Model model,
			@PathVariable String id, HttpServletResponse response)
			throws NumberFormatException, BusinessException {
		if (id == null)
			return JsonMessage.error(response, "id参数不合法");
		Moneychange money = moneyService.findById(Integer.parseInt(id));
		if (money == null)
			return JsonMessage.error(response, "id参数不合法");
		model.addAttribute("entity", money);

		model.addAttribute("desc", moneyService.findMoneychangeDescList(
				ParameterHelper.generateParameters(new Pair<String, Object>(
						"moneychangeid", Integer.parseInt(id))), null));
		return "money/moneyreview";
	}
	
	@RequestMapping(value = "/deletedesc", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deletedesc(HttpSession httpSession, String id,
			HttpServletResponse response, Locale locale)
			throws NumberFormatException, BusinessException {
		if (id == null) {
			return JsonMessage.error(response, "deleteerror", "参数错误");
		}
		moneyService.deleteDesc(Integer.parseInt(id));
		return JsonMessage.success(response);
	}

}