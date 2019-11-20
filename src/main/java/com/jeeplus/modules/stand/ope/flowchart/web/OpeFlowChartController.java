/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.flowchart.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Lists;
import com.jeeplus.common.utils.DateUtils;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.json.AjaxJson;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.modules.stand.ope.flowchart.entity.OpeFlowChart;
import com.jeeplus.modules.stand.ope.flowchart.service.OpeFlowChartService;
import com.jeeplus.modules.stand.ope.flowcharttable.entity.OpeFlowChartTable;
import com.jeeplus.modules.stand.ope.flowcharttable.service.OpeFlowChartTableService;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;

/**
 * 标准流程Controller
 * @author lpj
 * @version 2019-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/flowchart/flowChart")
public class OpeFlowChartController extends BaseController {

	@Autowired
	private OpeFlowChartService opeFlowChartService;
	
	@ModelAttribute
	public OpeFlowChartTable get(@RequestParam(required=false) String id) {
		OpeFlowChartTable entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeFlowChartService.get(id);
		}
		if (entity == null){
			entity = new OpeFlowChartTable();
		}
		return entity;
	}
	
	/**
	 * 标准流程列表页面
	 */
	@RequiresPermissions("flowcharttable:opeFlowChartTable:list")
	@RequestMapping(value = "flowChart")
	public String list(OpeFlowChartTable opeFlowChartTable, Model model,HttpServletRequest request) {
		//获取session中的标准类型
		String standType = (String)request.getSession().getAttribute("standType");
		/*System.out.println(standType);*/
		model.addAttribute("opeFlowChartTable", opeFlowChartTable);
		return "stand/ope/flowcharts/flowchart";
	}
	/**
	 * 标准流程列表页面
	 */
	@RequiresPermissions("flowcharttable:opeFlowChartTable:list")
	@RequestMapping(value = "flowChart1")
	public String list1(OpeFlowChartTable opeFlowChartTable, Model model,HttpServletRequest request) {
		//获取session中的标准类型
		String standType = (String)request.getSession().getAttribute("standType");
		/*System.out.println(standType);*/
		model.addAttribute("opeFlowChartTable", opeFlowChartTable);
		return "stand/ope/flowcharts/flowchart1";
	}
	
		/**
	 * 标准流程列表数据
	 */
	@ResponseBody
	@RequiresPermissions("flowcharttable:opeFlowChartTable:list")
	@RequestMapping(value = "flowChartData")
	public Map<String, Object> data(OpeFlowChart opeFlowChart, OpeAllColumn opeAllColumn,HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> map = new HashMap<String,Object>();
		map=opeFlowChartService.getFlowChartData(opeFlowChart,opeAllColumn);
		return map;
	}

	
}