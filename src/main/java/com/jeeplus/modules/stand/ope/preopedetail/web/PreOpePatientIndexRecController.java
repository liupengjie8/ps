/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.preopedetail.web;

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
import com.jeeplus.modules.stand.ope.preopedetail.entity.PreOpePatientIndexRec;
import com.jeeplus.modules.stand.ope.preopedetail.service.PreOpePatientIndexRecService;

/**
 * 术前明细Controller
 * @author lpj
 * @version 2019-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/preopedetail/preOpePatientIndexRec")
public class PreOpePatientIndexRecController extends BaseController {

	@Autowired
	private PreOpePatientIndexRecService preOpePatientIndexRecService;
	
	@ModelAttribute
	public PreOpePatientIndexRec get(@RequestParam(required=false) String id) {
		PreOpePatientIndexRec entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = preOpePatientIndexRecService.get(id);
		}
		if (entity == null){
			entity = new PreOpePatientIndexRec();
		}
		return entity;
	}
	
	/**
	 * 术前明细列表页面
	 */
	@RequiresPermissions("preopedetail:preOpePatientIndexRec:list")
	@RequestMapping(value = {"list", ""})
	public String list(PreOpePatientIndexRec preOpePatientIndexRec, Model model) {
		model.addAttribute("preOpePatientIndexRec", preOpePatientIndexRec);
		return "ope/preopedetail/preOpePatientIndexRecList";
	}
	
		/**
	 * 术前明细列表数据
	 */
	@ResponseBody
	@RequiresPermissions("preopedetail:preOpePatientIndexRec:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(PreOpePatientIndexRec preOpePatientIndexRec, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(preOpePatientIndexRec.getIndexIds()!=null&&preOpePatientIndexRec.getIndexIds().split(",")!=null&&!"".equals(preOpePatientIndexRec.getIndexIds().trim())){
			preOpePatientIndexRec.setIndexIdArray(preOpePatientIndexRec.getIndexIds().split(","));
		}
		Page<PreOpePatientIndexRec> page = preOpePatientIndexRecService.findPage(new Page<PreOpePatientIndexRec>(request, response), preOpePatientIndexRec); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑术前明细表单页面
	 */
	@RequiresPermissions(value={"preopedetail:preOpePatientIndexRec:view","preopedetail:preOpePatientIndexRec:add","preopedetail:preOpePatientIndexRec:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, PreOpePatientIndexRec preOpePatientIndexRec, Model model) {
		model.addAttribute("preOpePatientIndexRec", preOpePatientIndexRec);
		model.addAttribute("mode", mode);
		return "ope/preopedetail/preOpePatientIndexRecForm";
	}

	/**
	 * 保存术前明细
	 */
	@ResponseBody
	@RequiresPermissions(value={"preopedetail:preOpePatientIndexRec:add","preopedetail:preOpePatientIndexRec:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(PreOpePatientIndexRec preOpePatientIndexRec, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(preOpePatientIndexRec);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		preOpePatientIndexRecService.save(preOpePatientIndexRec);//保存
		j.setSuccess(true);
		j.setMsg("保存术前明细成功");
		return j;
	}
	
	/**
	 * 删除术前明细
	 */
	@ResponseBody
	@RequiresPermissions("preopedetail:preOpePatientIndexRec:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(PreOpePatientIndexRec preOpePatientIndexRec) {
		AjaxJson j = new AjaxJson();
		preOpePatientIndexRecService.delete(preOpePatientIndexRec);
		j.setMsg("删除术前明细成功");
		return j;
	}
	
	/**
	 * 批量删除术前明细
	 */
	@ResponseBody
	@RequiresPermissions("preopedetail:preOpePatientIndexRec:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			preOpePatientIndexRecService.delete(preOpePatientIndexRecService.get(id));
		}
		j.setMsg("删除术前明细成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("preopedetail:preOpePatientIndexRec:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(PreOpePatientIndexRec preOpePatientIndexRec, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "术前明细"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<PreOpePatientIndexRec> page = preOpePatientIndexRecService.findPage(new Page<PreOpePatientIndexRec>(request, response, -1), preOpePatientIndexRec);
    		new ExportExcel("术前明细", PreOpePatientIndexRec.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出术前明细记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("preopedetail:preOpePatientIndexRec:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<PreOpePatientIndexRec> list = ei.getDataList(PreOpePatientIndexRec.class);
			for (PreOpePatientIndexRec preOpePatientIndexRec : list){
				try{
					preOpePatientIndexRecService.save(preOpePatientIndexRec);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条术前明细记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条术前明细记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入术前明细失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入术前明细数据模板
	 */
	@ResponseBody
	@RequiresPermissions("preopedetail:preOpePatientIndexRec:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "术前明细数据导入模板.xlsx";
    		List<PreOpePatientIndexRec> list = Lists.newArrayList(); 
    		new ExportExcel("术前明细数据", PreOpePatientIndexRec.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}