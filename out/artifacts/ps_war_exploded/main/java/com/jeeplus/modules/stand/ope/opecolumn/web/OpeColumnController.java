/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opecolumn.web;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.jeeplus.modules.stand.ope.opecolumn.entity.OpeColumn;
import com.jeeplus.modules.stand.ope.opecolumn.service.OpeColumnService;

/**
 * 手术字段Controller
 * @author lpj
 * @version 2019-10-20
 */
@Controller
@RequestMapping(value = "${adminPath}/opecolumn/opeColumn")
public class OpeColumnController extends BaseController {

	@Autowired
	private OpeColumnService opeColumnService;
	
	@ModelAttribute
	public OpeColumn get(@RequestParam(required=false) String id) {
		OpeColumn entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeColumnService.get(id);
		}
		if (entity == null){
			entity = new OpeColumn();
		}
		return entity;
	}
	
	/**
	 * 字段列表页面
	 */
	@RequiresPermissions("opecolumn:opeColumn:list")
	@RequestMapping(value = {"list", ""})
	public String list(OpeColumn opeColumn, Model model) {
		model.addAttribute("opeColumn", opeColumn);
		return "ope/opecolumn/opeColumnList";
	}
	
		/**
	 * 字段列表数据
	 */
	@ResponseBody
	@RequiresPermissions("opecolumn:opeColumn:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeColumn opeColumn, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OpeColumn> page = opeColumnService.findPage(new Page<OpeColumn>(request, response), opeColumn); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑字段表单页面
	 */
	@RequiresPermissions(value={"opecolumn:opeColumn:view","opecolumn:opeColumn:add","opecolumn:opeColumn:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, OpeColumn opeColumn, Model model) {
		model.addAttribute("opeColumn", opeColumn);
		model.addAttribute("mode", mode);
		return "ope/opecolumn/opeColumnForm";
	}

	/**
	 * 保存字段
	 */
	@ResponseBody
	@RequiresPermissions(value={"opecolumn:opeColumn:add","opecolumn:opeColumn:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(OpeColumn opeColumn, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(opeColumn);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		opeColumnService.save(opeColumn);//保存
		j.setSuccess(true);
		j.setMsg("保存字段成功");
		return j;
	}
	
	/**
	 * 删除字段
	 */
	@ResponseBody
	@RequiresPermissions("opecolumn:opeColumn:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(OpeColumn opeColumn) {
		AjaxJson j = new AjaxJson();
		opeColumnService.delete(opeColumn);
		j.setMsg("删除字段成功");
		return j;
	}
	
	/**
	 * 批量删除字段
	 */
	@ResponseBody
	@RequiresPermissions("opecolumn:opeColumn:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			opeColumnService.delete(opeColumnService.get(id));
		}
		j.setMsg("删除字段成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("opecolumn:opeColumn:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(OpeColumn opeColumn, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "字段"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OpeColumn> page = opeColumnService.findPage(new Page<OpeColumn>(request, response, -1), opeColumn);
    		new ExportExcel("字段", OpeColumn.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出字段记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("opecolumn:opeColumn:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OpeColumn> list = ei.getDataList(OpeColumn.class);
			for (OpeColumn opeColumn : list){
				try{
					opeColumnService.save(opeColumn);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条字段记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条字段记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入字段失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入字段数据模板
	 */
	@ResponseBody
	@RequiresPermissions("opecolumn:opeColumn:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "字段数据导入模板.xlsx";
    		List<OpeColumn> list = Lists.newArrayList(); 
    		new ExportExcel("字段数据", OpeColumn.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }
	@ResponseBody
	@RequiresPermissions("user")
    @RequestMapping(value = "getAllColumnList")
   	public Map<String,Object> getAllOpeColumn(){
		return opeColumnService.getAllOpeColumn();
	}
	@ResponseBody
	@RequiresPermissions("user")
    @RequestMapping(value = "getColumnListByIds")
   	public List<OpeColumn> getColumnListByIds(String ids){
		return opeColumnService.getColumnListByIds(ids);
	}
	
}