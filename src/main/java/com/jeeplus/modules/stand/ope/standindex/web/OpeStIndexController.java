/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standindex.web;

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
import com.jeeplus.modules.stand.ope.standconfig.service.OpeQcStandConfigService;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;
import com.jeeplus.modules.stand.ope.standindex.service.OpeStIndexService;

/**
 * 指标Controller
 * @author lpj
 * @version 2019-08-22
 */
@Controller
@RequestMapping(value = "${adminPath}/standindex/opeStIndex")
public class OpeStIndexController extends BaseController {

	@Autowired
	private OpeStIndexService opeStIndexService;
	
	@Autowired
	private OpeQcStandConfigService configService;
	
	@ModelAttribute
	public OpeStIndex get(@RequestParam(required=false) String id) {
		OpeStIndex entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = opeStIndexService.get(id);
		}
		if (entity == null){
			entity = new OpeStIndex();
		}
		return entity;
	}
	
	/**
	 * 指标列表页面
	 */
	@RequiresPermissions("standindex:opeStIndex:list")
	@RequestMapping(value = {"list", ""})
	public String list(OpeStIndex opeStIndex, Model model) {
		model.addAttribute("opeStIndex", opeStIndex);
		return "stand/ope/standindex/opeStIndexList";
	}
	
		/**
	 * 指标列表数据
	 */
	@ResponseBody
	@RequiresPermissions("standindex:opeStIndex:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(OpeStIndex opeStIndex, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OpeStIndex> page = opeStIndexService.findPage(new Page<OpeStIndex>(request, response), opeStIndex); 
		return getBootstrapData(page);
	}
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "getIndexListByNode")
	public List<OpeStIndex> getIndexListByNode(String node){
		return configService.getIndexListByNode(node);
	}
    
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "getIndexList")
	public Map<String,Object> getIndexList(){
		return configService.getIndexList();
	}
	
	/**
	 * 查看，增加，编辑指标表单页面
	 */
	@RequiresPermissions(value={"standindex:opeStIndex:view","standindex:opeStIndex:add","standindex:opeStIndex:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, OpeStIndex opeStIndex, Model model) {
		model.addAttribute("opeStIndex", opeStIndex);
		model.addAttribute("mode", mode);
		return "stand/ope/standindex/opeStIndexForm";
	}

	/**
	 * 保存指标
	 */
	@ResponseBody
	@RequiresPermissions(value={"standindex:opeStIndex:add","standindex:opeStIndex:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(OpeStIndex opeStIndex, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(opeStIndex);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		opeStIndexService.save(opeStIndex);//保存
		j.setSuccess(true);
		j.setMsg("保存指标成功");
		return j;
	}
	
	/**
	 * 删除指标
	 */
	@ResponseBody
	@RequiresPermissions("standindex:opeStIndex:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(OpeStIndex opeStIndex) {
		AjaxJson j = new AjaxJson();
		opeStIndexService.delete(opeStIndex);
		j.setMsg("删除指标成功");
		return j;
	}
	
	/**
	 * 批量删除指标
	 */
	@ResponseBody
	@RequiresPermissions("standindex:opeStIndex:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			opeStIndexService.delete(opeStIndexService.get(id));
		}
		j.setMsg("删除指标成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("standindex:opeStIndex:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(OpeStIndex opeStIndex, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "指标"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OpeStIndex> page = opeStIndexService.findPage(new Page<OpeStIndex>(request, response, -1), opeStIndex);
    		new ExportExcel("指标", OpeStIndex.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出指标记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("standindex:opeStIndex:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OpeStIndex> list = ei.getDataList(OpeStIndex.class);
			for (OpeStIndex opeStIndex : list){
				try{
					opeStIndexService.save(opeStIndex);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条指标记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条指标记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入指标失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入指标数据模板
	 */
	@ResponseBody
	@RequiresPermissions("standindex:opeStIndex:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "指标数据导入模板.xlsx";
    		List<OpeStIndex> list = Lists.newArrayList(); 
    		new ExportExcel("指标数据", OpeStIndex.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}