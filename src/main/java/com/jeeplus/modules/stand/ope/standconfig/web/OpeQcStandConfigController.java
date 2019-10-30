/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standconfig.web;

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
import com.jeeplus.modules.stand.ope.standconfig.entity.OpeQcStandConfig;
import com.jeeplus.modules.stand.ope.standconfig.service.OpeQcStandConfigService;

/**
 * 标准Controller
 * @author lpj
 * @version 2019-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/standconfig/opeQcStandConfig")
public class OpeQcStandConfigController extends BaseController {

	@Autowired
	private OpeQcStandConfigService opeQcStandConfigService;
	
	@ModelAttribute
	public OpeQcStandConfig get(@RequestParam(required=false) String id) {
		OpeQcStandConfig entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeQcStandConfigService.get(id);
		}
		if (entity == null){
			entity = new OpeQcStandConfig();
		}
		return entity;
	}
	
	/**
	 * 标准列表页面
	 */
	@RequiresPermissions("standconfig:opeQcStandConfig:list")
	@RequestMapping(value = {"list", ""})
	public String list(OpeQcStandConfig opeQcStandConfig, Model model) {
		model.addAttribute("opeQcStandConfig", opeQcStandConfig);
		return "stand/ope/standconfig/opeQcStandConfigList";
	}
	
		/**
	 * 标准列表数据
	 */
	@ResponseBody
	@RequiresPermissions("standconfig:opeQcStandConfig:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeQcStandConfig opeQcStandConfig, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OpeQcStandConfig> page = opeQcStandConfigService.findPage(new Page<OpeQcStandConfig>(request, response), opeQcStandConfig); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑标准表单页面
	 */
	@RequiresPermissions(value={"standconfig:opeQcStandConfig:view","standconfig:opeQcStandConfig:add","standconfig:opeQcStandConfig:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, OpeQcStandConfig opeQcStandConfig, Model model) {
		model.addAttribute("opeQcStandConfig", opeQcStandConfig);
		model.addAttribute("mode", mode);
		return "stand/ope/standconfig/opeQcStandConfigForm";
	}

	/**
	 * 保存标准
	 */
	@ResponseBody
	@RequiresPermissions(value={"standconfig:opeQcStandConfig:add","standconfig:opeQcStandConfig:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(OpeQcStandConfig opeQcStandConfig, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(opeQcStandConfig);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		opeQcStandConfigService.save(opeQcStandConfig);//保存
		j.setSuccess(true);
		j.setMsg("保存标准成功");
		return j;
	}
	
	/**
	 * 删除标准
	 */
	@ResponseBody
	@RequiresPermissions("standconfig:opeQcStandConfig:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(OpeQcStandConfig opeQcStandConfig) {
		AjaxJson j = new AjaxJson();
		opeQcStandConfigService.delete(opeQcStandConfig);
		j.setMsg("删除标准成功");
		return j;
	}
	
	/**
	 * 批量删除标准
	 */
	@ResponseBody
	@RequiresPermissions("standconfig:opeQcStandConfig:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			opeQcStandConfigService.delete(opeQcStandConfigService.get(id));
		}
		j.setMsg("删除标准成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("standconfig:opeQcStandConfig:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(OpeQcStandConfig opeQcStandConfig, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "标准"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OpeQcStandConfig> page = opeQcStandConfigService.findPage(new Page<OpeQcStandConfig>(request, response, -1), opeQcStandConfig);
    		new ExportExcel("标准", OpeQcStandConfig.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出标准记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("standconfig:opeQcStandConfig:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OpeQcStandConfig> list = ei.getDataList(OpeQcStandConfig.class);
			for (OpeQcStandConfig opeQcStandConfig : list){
				try{
					opeQcStandConfigService.save(opeQcStandConfig);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条标准记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条标准记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入标准失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入标准数据模板
	 */
	@ResponseBody
	@RequiresPermissions("standconfig:opeQcStandConfig:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "标准数据导入模板.xlsx";
    		List<OpeQcStandConfig> list = Lists.newArrayList(); 
    		new ExportExcel("标准数据", OpeQcStandConfig.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}