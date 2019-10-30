/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.indexform.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.flowchart.entity.OpeFlowChart;
import com.jeeplus.modules.stand.ope.flowchart.mapper.OpeFlowChartMapper;
import com.jeeplus.modules.stand.ope.flowcharttable.entity.OpeFlowChartTable;
import com.jeeplus.modules.stand.ope.flowcharttable.mapper.OpeFlowChartTableMapper;
import com.jeeplus.modules.stand.ope.indexform.entity.OpeHorizontalHeading;
import com.jeeplus.modules.stand.ope.indexform.entity.OpeLongitudinalHeading;
import com.jeeplus.modules.stand.ope.indexform.mapper.IndexFormMapper;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitor;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitorStIndex;
import com.jeeplus.modules.stand.ope.monitor.mapper.OpeMonitorMapper;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.mapper.OpeBarChartMapper;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;
import com.jeeplus.modules.stand.ope.standindex.service.OpeStIndexService;

/**
 * 标准流程Service
 * @author lpj
 * @version 2019-09-20
 */
@Service
@Transactional(readOnly = true)
public class IndexFormService extends CrudService<OpeFlowChartTableMapper, OpeFlowChartTable> {
	@Autowired
	private IndexFormMapper mapper;
	@Autowired
	private OpeMonitorMapper monitorMapper;
	@Autowired
	private OpeStIndexService indexMapper;
	
	
	public List<OpeStIndex> getIndexByNodeName(String nodeName) {
		List<OpeStIndex> list = new ArrayList<OpeStIndex>();
		List<String> indexIds = monitorMapper.getIndexIdByNode(nodeName);
		String ids="";
		if(indexIds!=null){
			for(String s:indexIds){
				ids+=s+",";
			}
			String[] idArray=ids.split(",");
			for(String id:idArray){
				OpeStIndex o =indexMapper.get(id) ;
				list.add(o);
			}
		}
		return list;
	}
	
	public List<OpeStIndex> getIndexByElementName(String nodeName) {
		return mapper.getIndexByElementName(nodeName);
	}
	public List<OpeStIndex> getAllIndex() {
		return indexMapper.findAllList(new OpeStIndex());
	}
	public List<OpeHorizontalHeading> getOpeHorizontalHeadingList() {
		return mapper.getOpeHorizontalHeadingList();
	}
	public List<OpeLongitudinalHeading> getOpeLongitudinalHeadingList() {
		return mapper.getOpeLongitudinalHeadingList();
	}
	public Map<String, Object> getIndexFormData(String hbm,String zbm,String indexId,OpeAllColumn c) {
		Map<String, Object> map = new HashMap<String, Object>();
		//1查询横标目元素列表  比如 性别：男/女
		List<String> elementList = mapper.getElementList(hbm);
		//2轮询元素列表，生成sql case when 
		String sqlCaseWhen="";
		sqlCaseWhen+="case when "+zbm+" is null then '空' else "+zbm+" end "+zbm+",";
		for(String s:elementList){
			sqlCaseWhen+="sum(case "+hbm+" when '"+s+"' then 1 else 0 end) as "+s+"allCount,";
			sqlCaseWhen+="sum(case  when ("+hbm+"='"+s+"' and is_qualified=0) then 1 else 0 end) as "+s+"nqCount,";
		}
		//3生成group by zbm sql
		String sqlGroupBy="Group by "+zbm;
		//4构造参数map
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sqlCaseWhen", sqlCaseWhen);
		paramMap.put("sqlGroupBy", sqlGroupBy);
		paramMap.put("entity", c);
		paramMap.put("indexId", indexId);
		//5执行sql
		//6表头List
		List<String> btList = elementList;
		//7返回数据List
		List<HashMap<String,Object>> dataList = new ArrayList<HashMap<String,Object>>();
		dataList = mapper.getIndexFormDataList(paramMap);
		map.put("btList", btList);
		map.put("allcount", mapper.getAllCount(c));
		map.put("nqcount", mapper.getNqCount(c));
		map.put("standContent", mapper.getStandContent(c));
		if("dept_code".equals(zbm)){
			List<HashMap<String,Object>> dataListDept = new ArrayList<HashMap<String,Object>>();
			//如果纵标目是科室，做分级,重新整合list
			//按中心和部别分组查询数据
			sqlCaseWhen="";
			sqlCaseWhen+="case when DEPT_CENTER is null then '空' else DEPT_CENTER end "+zbm+",";
			for(String s:elementList){
				sqlCaseWhen+="sum(case "+hbm+" when '"+s+"' then 1 else 0 end) as "+s+"allCount,";
				sqlCaseWhen+="sum(case  when ("+hbm+"='"+s+"' and is_qualified=0) then 1 else 0 end) as "+s+"nqCount,";
			}
			paramMap.put("sqlCaseWhen", sqlCaseWhen);
			List<HashMap<String,Object>> dataListCenter = mapper.getIndexFormDataListByCenter(paramMap);
			dataListDept.addAll(dataListCenter);
			sqlCaseWhen="";
			sqlCaseWhen+="case when DEPT_STAT is null then '空' else DEPT_STAT end "+zbm+",";
			for(String s:elementList){
				sqlCaseWhen+="sum(case "+hbm+" when '"+s+"' then 1 else 0 end) as "+s+"allCount,";
				sqlCaseWhen+="sum(case  when ("+hbm+"='"+s+"' and is_qualified=0) then 1 else 0 end) as "+s+"nqCount,";
			}
			paramMap.put("sqlCaseWhen", sqlCaseWhen);
			List<HashMap<String,Object>> dataListStat = mapper.getIndexFormDataListByStat(paramMap);
			for(HashMap<String,Object> st:dataListStat){
				if("内科临床部".equals(st.get("DEPT_CODE"))){
					dataListDept.add(st);
					for(HashMap<String,Object> dept:dataList){
						String deptName=(String)dept.get("DEPT_CODE");
						//查询内科临床部 科室list
						 List<String> deptListByStat = mapper.getDeptListByStat("内科临床部");
						 if(deptListByStat.contains(deptName)){
							 dataListDept.add(dept);
						 }
					}
				}
			}
			for(HashMap<String,Object> st:dataListStat){
				if("外科临床部".equals(st.get("DEPT_CODE"))){
					dataListDept.add(st);
					for(HashMap<String,Object> dept:dataList){
						String deptName=(String)dept.get("DEPT_CODE");
						//查询外科临床部 科室list
						 List<String> deptListByStat = mapper.getDeptListByStat("外科临床部");
						 if(deptListByStat.contains(deptName)){
							 dataListDept.add(dept);
						 }
					}
				}
			}
			for(HashMap<String,Object> st:dataListStat){
				if("医技部".equals(st.get("DEPT_CODE"))){
					dataListDept.add(st);
					for(HashMap<String,Object> dept:dataList){
						String deptName=(String)dept.get("DEPT_CODE");
						//查询外科临床部 科室list
						 List<String> deptListByStat = mapper.getDeptListByStat("医技部");
						 if(deptListByStat.contains(deptName)){
							 dataListDept.add(dept);
						 }
					}
				}
			}
			
			map.put("dataList", dataListDept);
		}else{
			map.put("dataList", dataList);
		}
		return map;
	}
}