/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.unaccomplished.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
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
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;
import com.jeeplus.modules.stand.ope.opebarchart.service.OpeBarChartService;
import com.jeeplus.modules.stand.ope.opedetail.service.OpeDetailService;
import com.jeeplus.modules.stand.ope.operadar.entity.OpeAllColumnRadar;
import com.jeeplus.modules.stand.ope.operadar.service.OpeRadarService;
import com.jeeplus.modules.stand.ope.standconfig.service.OpeQcStandConfigService;

/**
 * 雷达图Controller
 * @author lpj
 * @version 2019-09-11
 */
@Controller
@RequestMapping(value = "${adminPath}/unaccomplished/unaccomplished")
public class UnaccomplishedController extends BaseController {

	
	/**
	 * 页面
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "unaccomplished")
	public String operadar(OpeAllColumn entity, Model model) {
		return "stand/ope/unaccomplished/unaccomplished";
	}

}