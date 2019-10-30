/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opeparameters.web;

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
import com.jeeplus.modules.stand.ope.opeparameters.entity.OpeParamaters;
import com.jeeplus.modules.stand.ope.opeparameters.service.OpeParamatersService;

/**
 * 参数维护Controller
 * @author lpj
 * @version 2019-08-20
 */
@Controller
@RequestMapping(value = "${adminPath}/opeparameters/opeParamaters")
public class OpeParamatersController extends BaseController {

	@Autowired
	private OpeParamatersService opeParamatersService;
	
	@ModelAttribute
	public OpeParamaters get(@RequestParam(required=false) String id) {
		OpeParamaters entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeParamatersService.get(id);
		}
		if (entity == null){
			entity = new OpeParamaters();
		}
		return entity;
	}
	
	/**
	 * 参数列表页面
	 */
	@RequiresPermissions("opeparameters:opeParamaters:list")
	@RequestMapping(value = {"list", ""})
	public String list(OpeParamaters opeParamaters, Model model) {
		model.addAttribute("opeParamaters", opeParamaters);
		return "stand/ope/opeparameters/opeParamatersList";
	}
	
		/**
	 * 参数列表数据
	 */
	@ResponseBody
	@RequiresPermissions("opeparameters:opeParamaters:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeParamaters opeParamaters, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OpeParamaters> page = opeParamatersService.findPage(new Page<OpeParamaters>(request, response), opeParamaters); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑参数表单页面
	 */
	@RequiresPermissions(value={"opeparameters:opeParamaters:view","opeparameters:opeParamaters:add","opeparameters:opeParamaters:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, OpeParamaters opeParamaters, Model model) {
		model.addAttribute("opeParamaters", opeParamaters);
		model.addAttribute("mode", mode);
		return "stand/ope/opeparameters/opeParamatersForm";
	}

	/**
	 * 保存参数
	 */
	@ResponseBody
	@RequiresPermissions(value={"opeparameters:opeParamaters:add","opeparameters:opeParamaters:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(OpeParamaters opeParamaters, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(opeParamaters);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		opeParamatersService.save(opeParamaters);//保存
		j.setSuccess(true);
		j.setMsg("保存参数成功");
		return j;
	}
	
	/**
	 * 删除参数
	 */
	@ResponseBody
	@RequiresPermissions("opeparameters:opeParamaters:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(OpeParamaters opeParamaters) {
		AjaxJson j = new AjaxJson();
		opeParamatersService.delete(opeParamaters);
		j.setMsg("删除参数成功");
		return j;
	}
	
	/**
	 * 批量删除参数
	 */
	@ResponseBody
	@RequiresPermissions("opeparameters:opeParamaters:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			opeParamatersService.delete(opeParamatersService.get(id));
		}
		j.setMsg("删除参数成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("opeparameters:opeParamaters:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(OpeParamaters opeParamaters, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "参数"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OpeParamaters> page = opeParamatersService.findPage(new Page<OpeParamaters>(request, response, -1), opeParamaters);
    		new ExportExcel("参数", OpeParamaters.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出参数记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("opeparameters:opeParamaters:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OpeParamaters> list = ei.getDataList(OpeParamaters.class);
			for (OpeParamaters opeParamaters : list){
				try{
					opeParamatersService.save(opeParamaters);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条参数记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条参数记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入参数失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入参数数据模板
	 */
	@ResponseBody
	@RequiresPermissions("opeparameters:opeParamaters:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "参数数据导入模板.xlsx";
    		List<OpeParamaters> list = Lists.newArrayList(); 
    		new ExportExcel("参数数据", OpeParamaters.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}