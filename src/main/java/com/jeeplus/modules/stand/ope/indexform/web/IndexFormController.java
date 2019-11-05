package com.jeeplus.modules.stand.ope.indexform.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeeplus.common.utils.*;

import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.modules.stand.ope.preopedetail.entity.PreOpePatientIndexRec;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Maps;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.json.AjaxJson;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.security.shiro.session.SessionDAO;
import com.jeeplus.core.servlet.ValidateCodeServlet;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.iim.entity.MailBox;
import com.jeeplus.modules.iim.entity.MailPage;
import com.jeeplus.modules.iim.service.MailBoxService;
import com.jeeplus.modules.oa.entity.OaNotify;
import com.jeeplus.modules.oa.service.OaNotifyService;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitor;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitorStIndex;
import com.jeeplus.modules.stand.ope.monitor.mapper.OpeMonitorMapper;
import com.jeeplus.modules.stand.ope.monitor.service.OpeMonitorService;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.standconfig.service.OpeQcStandConfigService;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;
import com.jeeplus.modules.stand.ope.standmodular.entity.OpeStandModular;
import com.jeeplus.modules.stand.ope.standmodular.service.OpeStandModularService;
import com.jeeplus.modules.sys.security.FormAuthenticationFilter;
import com.jeeplus.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.jeeplus.modules.sys.utils.UserUtils;
import com.jeeplus.modules.stand.ope.indexform.entity.OpeHorizontalHeading;
import com.jeeplus.modules.stand.ope.indexform.entity.OpeLongitudinalHeading;
import com.jeeplus.modules.stand.ope.indexform.service.IndexFormService;

import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 运行监测Controller
 *
 * @author lpj
 * @version 2016-5-31
 */
@Api(value = "IndexFormController", description = "指标表单")
@RequestMapping(value = "${adminPath}/indexForm/indexForm")
@Controller
public class IndexFormController extends BaseController {

    @Autowired
    private OpeStandModularService modularService;


    @Autowired
    private OpeMonitorService monitorService;

    @Autowired
    private IndexFormService indexFormService;

    @Autowired
    private OpeQcStandConfigService configService;

    /**
     * 进入监测页
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "/indexForm")
    public String monitor(HttpServletRequest request, String fromPage, String nodeName, String element, HttpServletResponse response) {
        //指标列表
        List<OpeStIndex> indexList = new ArrayList<OpeStIndex>();

        if ("leftTree".equals(fromPage)) {//点击左侧树进入页面 此时，传入的参数应该是某个节点
            indexList = indexFormService.getIndexByNodeName(nodeName);
        } else if ("monitor".equals(fromPage)) {//监测页面进入，传入的参数是要素
            indexList = indexFormService.getIndexByElementName(element);
        } else {
            indexList = indexFormService.getAllIndex();
        }
        //横标目列表
        List<OpeHorizontalHeading> opeHorizontalHeadingList = indexFormService.getOpeHorizontalHeadingList();
        //纵标目列表
        List<OpeLongitudinalHeading> opeLongitudinalHeadingList = indexFormService.getOpeLongitudinalHeadingList();
        request.setAttribute("indexList", indexList);
        request.setAttribute("opeHorizontalHeadingList", opeHorizontalHeadingList);
        request.setAttribute("opeLongitudinalHeadingList", opeLongitudinalHeadingList);
        request.setAttribute("nodeList", configService.getNodeList());
        return "stand/ope/indexform/indexform";
    }

    /**
     * 标准模块列表数据
     */
    @ResponseBody
    @RequiresPermissions("user")
    @RequestMapping(value = "/indexFormData")
    public Map<String, Object> data(String hbm, String zbm, String indexId, OpeAllColumn c, HttpServletRequest request, HttpServletResponse response, Model model) {
        return indexFormService.getIndexFormData(hbm, zbm, indexId, c);
    }

    /**
     * 标准模块列表数据
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "/export")
    public AjaxJson exportFile(String hbm, String zbm, String indexId, OpeAllColumn c, HttpServletRequest request, HttpServletResponse response, String hbmName,String zbmName,String indexName) throws IOException {
        String fileName = "指标报表" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
        Map<String, Object> map=(Map<String, Object>)indexFormService.getIndexFormData(hbm, zbm, indexId, c);
        QuickOperationWeekReportExcelUtil  eu=new QuickOperationWeekReportExcelUtil();
        eu.exportOrderExcel(map, response,fileName,zbm,hbmName,zbmName,indexName);
        return null;
    }
}
