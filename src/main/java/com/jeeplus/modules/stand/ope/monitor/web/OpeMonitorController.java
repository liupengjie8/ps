package com.jeeplus.modules.stand.ope.monitor.web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeeplus.common.utils.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Maps;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.json.AjaxJson;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.security.shiro.session.SessionDAO;
import com.jeeplus.core.servlet.ValidateCodeServlet;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.iim.entity.MailBox;
import com.jeeplus.modules.iim.entity.MailPage;
import com.jeeplus.modules.iim.service.MailBoxService;
import com.jeeplus.modules.oa.entity.OaNotify;
import com.jeeplus.modules.oa.service.OaNotifyService;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitor;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitorStIndex;
import com.jeeplus.modules.stand.ope.monitor.service.OpeMonitorService;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opecolumn.entity.OpeColumn;
import com.jeeplus.modules.stand.ope.standmodular.entity.OpeStandModular;
import com.jeeplus.modules.stand.ope.standmodular.service.OpeStandModularService;
import com.jeeplus.modules.sys.security.FormAuthenticationFilter;
import com.jeeplus.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.jeeplus.modules.sys.utils.UserUtils;

import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 运行监测Controller
 * @author lpj
 * @version 2016-5-31
 */
@Api(value = "OpeMonitorController", description = "运行监测控制器")
@RequestMapping(value = "${adminPath}/monitor/monitor")
@Controller
public class OpeMonitorController extends BaseController{
	
	@Autowired
	private OpeStandModularService modularService;
	
	@Autowired
	private OpeMonitorService monitorService;
	
	/**
	 * 进入监测页
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "/monitor")
	public String monitor(HttpServletRequest request,OpeAllColumn entity, HttpServletResponse response) {
		//return "modules/sys/login/home";
		//跳转过来，默认当日。
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY,-24);
		String yesterdayDate=dateFormat.format(calendar.getTime());
		entity.setDataDateStart(yesterdayDate);
		entity.setDataDateEnd(yesterdayDate);
		entity.setSegment("手术评估");
		request.setAttribute("sspgData", monitorService.getNodesBySegment(entity));
		entity.setSegment("手术安排");
		request.setAttribute("ssapData", monitorService.getNodesBySegment(entity));
		entity.setSegment("术前准备");
		request.setAttribute("sqzbData", monitorService.getNodesBySegment(entity));
		//字段
		entity.setDataDateStart(null);
		entity.setDataDateEnd(null);
		entity.setSegment("手术评估");
		request.setAttribute("sspgDataHis", monitorService.getNodesBySegment(entity));
		entity.setSegment("手术安排");
		request.setAttribute("ssapDataHis", monitorService.getNodesBySegment(entity));
		entity.setSegment("术前准备");
		request.setAttribute("sqzbDataHis", monitorService.getNodesBySegment(entity));
		return "stand/ope/monitor/monitor";
	}
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeAllColumn entity,HttpServletRequest request, HttpServletResponse response, Model model) {
		return monitorService.getData(entity);
	}
}
