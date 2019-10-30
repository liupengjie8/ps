/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.indexform.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.indexform.entity.OpeHorizontalHeading;
import com.jeeplus.modules.stand.ope.indexform.entity.OpeLongitudinalHeading;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitor;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;

/**
 * 字段MAPPER接口
 * @author lpj
 * @version 2019-09-11
 */
@MyBatisMapper
public interface IndexFormMapper extends BaseMapper<OpeAllColumn> {
	List<OpeStIndex> getIndexByElementName(String nodeName);
	List<String> getElementList(String hbm);
	List<OpeHorizontalHeading> getOpeHorizontalHeadingList();
	List<OpeLongitudinalHeading> getOpeLongitudinalHeadingList();
	List<HashMap<String,Object>> getIndexFormDataList(Map<String,Object> paramMap);
	List<HashMap<String,Object>> getIndexFormDataListByCenter(Map<String,Object> paramMap);
	List<HashMap<String,Object>> getIndexFormDataListByStat(Map<String,Object> paramMap);
	List<String> getDeptListByStat(String StatName);
	HashMap<String,Object> getIndexFormPatientCount(OpeAllColumn c);
	Integer getAllCount(OpeAllColumn c);
	Integer getNqCount(OpeAllColumn c);
	String getStandContent(OpeAllColumn c);
}