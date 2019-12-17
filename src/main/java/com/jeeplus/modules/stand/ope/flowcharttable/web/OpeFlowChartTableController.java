/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.flowcharttable.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import com.jeeplus.modules.stand.ope.flowcharttable.entity.OpeFlowChartTable;
import com.jeeplus.modules.stand.ope.flowcharttable.service.OpeFlowChartTableService;

/**
 * 标准流程Controller
 * @author lpj
 * @version 2019-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/flowcharttable/opeFlowChartTable")
public class OpeFlowChartTableController extends BaseController {

	@Autowired
	private OpeFlowChartTableService opeFlowChartTableService;
	
	@ModelAttribute
	public OpeFlowChartTable get(@RequestParam(required=false) String id) {
		OpeFlowChartTable entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeFlowChartTableService.get(id);
		}
		if (entity == null){
			entity = new OpeFlowChartTable();
		}
		return entity;
	}
	
	/**
	 * 标准流程列表页面
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = {"list", ""})
	public String list(OpeFlowChartTable opeFlowChartTable, Model model) {
		model.addAttribute("opeFlowChartTable", opeFlowChartTable);
		return "stand/ope/flowcharttable/opeFlowChartTableList";
	}
	
		/**
	 * 标准流程列表数据
	 */
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeFlowChartTable opeFlowChartTable, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OpeFlowChartTable> page = opeFlowChartTableService.findPage(new Page<OpeFlowChartTable>(request, response), opeFlowChartTable); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑标准流程表单页面
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, OpeFlowChartTable opeFlowChartTable, Model model) {
		model.addAttribute("opeFlowChartTable", opeFlowChartTable);
		model.addAttribute("mode", mode);
		return "stand/ope/flowcharttable/opeFlowChartTableForm";
	}

	/**
	 * 保存标准流程
	 */
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "save")
	public AjaxJson save(OpeFlowChartTable opeFlowChartTable, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(opeFlowChartTable);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		opeFlowChartTableService.save(opeFlowChartTable);//保存
		j.setSuccess(true);
		j.setMsg("保存标准流程成功");
		return j;
	}
	
	/**
	 * 删除标准流程
	 */
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "delete")
	public AjaxJson delete(OpeFlowChartTable opeFlowChartTable) {
		AjaxJson j = new AjaxJson();
		opeFlowChartTableService.delete(opeFlowChartTable);
		j.setMsg("删除标准流程成功");
		return j;
	}
	
	/**
	 * 批量删除标准流程
	 */
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			opeFlowChartTableService.delete(opeFlowChartTableService.get(id));
		}
		j.setMsg("删除标准流程成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("user")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(OpeFlowChartTable opeFlowChartTable, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "标准流程"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OpeFlowChartTable> page = opeFlowChartTableService.findPage(new Page<OpeFlowChartTable>(request, response, -1), opeFlowChartTable);
    		new ExportExcel("标准流程", OpeFlowChartTable.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出标准流程记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("user")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OpeFlowChartTable> list = ei.getDataList(OpeFlowChartTable.class);
			for (OpeFlowChartTable opeFlowChartTable : list){
				try{
					opeFlowChartTableService.save(opeFlowChartTable);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条标准流程记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条标准流程记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入标准流程失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入标准流程数据模板
	 */
	@ResponseBody
	@RequiresPermissions("user")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "标准流程数据导入模板.xlsx";
    		List<OpeFlowChartTable> list = Lists.newArrayList(); 
    		new ExportExcel("标准流程数据", OpeFlowChartTable.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}