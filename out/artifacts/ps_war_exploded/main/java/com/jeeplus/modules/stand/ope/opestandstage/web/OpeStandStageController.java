/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opestandstage.web;

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
import com.jeeplus.modules.stand.ope.opestandstage.entity.OpeStandStage;
import com.jeeplus.modules.stand.ope.opestandstage.service.OpeStandStageService;

/**
 * 阶段Controller
 * @author lpj
 * @version 2019-08-16
 */
@Controller
@RequestMapping(value = "${adminPath}/opestandstage/opeStandStage")
public class OpeStandStageController extends BaseController {

	@Autowired
	private OpeStandStageService opeStandStageService;
	
	@ModelAttribute
	public OpeStandStage get(@RequestParam(required=false) String id) {
		OpeStandStage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeStandStageService.get(id);
		}
		if (entity == null){
			entity = new OpeStandStage();
		}
		return entity;
	}
	
	/**
	 * 阶段列表页面
	 */
	@RequiresPermissions("opestandstage:opeStandStage:list")
	@RequestMapping(value = {"list", ""})
	public String list(OpeStandStage opeStandStage, Model model) {
		model.addAttribute("opeStandStage", opeStandStage);
		return "stand/ope/opestandstage/opeStandStageList";
	}
	
		/**
	 * 阶段列表数据
	 */
	@ResponseBody
	@RequiresPermissions("opestandstage:opeStandStage:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeStandStage opeStandStage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OpeStandStage> page = opeStandStageService.findPage(new Page<OpeStandStage>(request, response), opeStandStage); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑阶段表单页面
	 */
	@RequiresPermissions(value={"opestandstage:opeStandStage:view","opestandstage:opeStandStage:add","opestandstage:opeStandStage:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, OpeStandStage opeStandStage, Model model) {
		model.addAttribute("opeStandStage", opeStandStage);
		model.addAttribute("mode", mode);
		return "stand/ope/opestandstage/opeStandStageForm";
	}

	/**
	 * 保存阶段
	 */
	@ResponseBody
	@RequiresPermissions(value={"opestandstage:opeStandStage:add","opestandstage:opeStandStage:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(OpeStandStage opeStandStage, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(opeStandStage);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		opeStandStageService.save(opeStandStage);//保存
		j.setSuccess(true);
		j.setMsg("保存阶段成功");
		return j;
	}
	
	/**
	 * 删除阶段
	 */
	@ResponseBody
	@RequiresPermissions("opestandstage:opeStandStage:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(OpeStandStage opeStandStage) {
		AjaxJson j = new AjaxJson();
		opeStandStageService.delete(opeStandStage);
		j.setMsg("删除阶段成功");
		return j;
	}
	
	/**
	 * 批量删除阶段
	 */
	@ResponseBody
	@RequiresPermissions("opestandstage:opeStandStage:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			opeStandStageService.delete(opeStandStageService.get(id));
		}
		j.setMsg("删除阶段成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("opestandstage:opeStandStage:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(OpeStandStage opeStandStage, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "阶段"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OpeStandStage> page = opeStandStageService.findPage(new Page<OpeStandStage>(request, response, -1), opeStandStage);
    		new ExportExcel("阶段", OpeStandStage.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出阶段记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("opestandstage:opeStandStage:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OpeStandStage> list = ei.getDataList(OpeStandStage.class);
			for (OpeStandStage opeStandStage : list){
				try{
					opeStandStageService.save(opeStandStage);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条阶段记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条阶段记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入阶段失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入阶段数据模板
	 */
	@ResponseBody
	@RequiresPermissions("opestandstage:opeStandStage:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "阶段数据导入模板.xlsx";
    		List<OpeStandStage> list = Lists.newArrayList(); 
    		new ExportExcel("阶段数据", OpeStandStage.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}