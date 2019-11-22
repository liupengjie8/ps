/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standmodular.web;

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
import com.jeeplus.modules.stand.ope.standmodular.entity.OpeStandModular;
import com.jeeplus.modules.stand.ope.standmodular.service.OpeStandModularService;

/**
 * 标准模块Controller
 * @author lpj
 * @version 2019-08-15
 */
@Controller
@RequestMapping(value = "${adminPath}/standmodular/opeStandModular")
public class OpeStandModularController extends BaseController {

	@Autowired
	private OpeStandModularService opeStandModularService;
	
	@ModelAttribute
	public OpeStandModular get(@RequestParam(required=false) String id) {
		OpeStandModular entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeStandModularService.get(id);
		}
		if (entity == null){
			entity = new OpeStandModular();
		}
		return entity;
	}
	
	/**
	 * 标准模块列表页面
	 */
	@RequiresPermissions("standmodular:opeStandModular:list")
	@RequestMapping(value = {"list", ""})
	public String list(OpeStandModular opeStandModular, Model model) {
		model.addAttribute("opeStandModular", opeStandModular);
		return "stand/ope/standmodular/opeStandModularList";
	}

	/**
	 * 问题库页面
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = {"questionBank"})
	public String questionBank(OpeStandModular opeStandModular, Model model) {
		return "stand/ope/standmodular/questionBankPage";
	}
	/**
	 * 评测概况
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = {"gradeReview", ""})
	public String gradeReview(OpeStandModular opeStandModular, Model model) {
		return "stand/ope/standmodular/gradeReviewPage";
	}
		/**
	 * 标准模块列表数据
	 */
	@ResponseBody
	@RequiresPermissions("standmodular:opeStandModular:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeStandModular opeStandModular, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OpeStandModular> page = opeStandModularService.findPage(new Page<OpeStandModular>(request, response), opeStandModular); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑标准模块表单页面
	 */
	@RequiresPermissions(value={"standmodular:opeStandModular:view","standmodular:opeStandModular:add","standmodular:opeStandModular:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, OpeStandModular opeStandModular, Model model) {
		model.addAttribute("opeStandModular", opeStandModular);
		model.addAttribute("mode", mode);
		return "stand/ope/standmodular/opeStandModularForm";
	}

	/**
	 * 保存标准模块
	 */
	@ResponseBody
	@RequiresPermissions(value={"standmodular:opeStandModular:add","standmodular:opeStandModular:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(OpeStandModular opeStandModular, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(opeStandModular);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		opeStandModularService.save(opeStandModular);//保存
		j.setSuccess(true);
		j.setMsg("保存标准模块成功");
		return j;
	}
	
	/**
	 * 删除标准模块
	 */
	@ResponseBody
	@RequiresPermissions("standmodular:opeStandModular:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(OpeStandModular opeStandModular) {
		AjaxJson j = new AjaxJson();
		opeStandModularService.delete(opeStandModular);
		j.setMsg("删除标准模块成功");
		return j;
	}
	
	/**
	 * 批量删除标准模块
	 */
	@ResponseBody
	@RequiresPermissions("standmodular:opeStandModular:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			opeStandModularService.delete(opeStandModularService.get(id));
		}
		j.setMsg("删除标准模块成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("standmodular:opeStandModular:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(OpeStandModular opeStandModular, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "标准模块"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OpeStandModular> page = opeStandModularService.findPage(new Page<OpeStandModular>(request, response, -1), opeStandModular);
    		new ExportExcel("标准模块", OpeStandModular.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出标准模块记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("standmodular:opeStandModular:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OpeStandModular> list = ei.getDataList(OpeStandModular.class);
			for (OpeStandModular opeStandModular : list){
				try{
					opeStandModularService.save(opeStandModular);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条标准模块记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条标准模块记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入标准模块失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入标准模块数据模板
	 */
	@ResponseBody
	@RequiresPermissions("standmodular:opeStandModular:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "标准模块数据导入模板.xlsx";
    		List<OpeStandModular> list = Lists.newArrayList(); 
    		new ExportExcel("标准模块数据", OpeStandModular.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}