/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opebarchart.mapper;

import java.util.HashMap;
import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;

/**
 * 字段MAPPER接口
 * @author lpj
 * @version 2019-09-11
 */
@MyBatisMapper
public interface OpeBarChartMapper extends BaseMapper<OpeAllColumn> {
	List<OpeBarChart> stageBarData(OpeAllColumn entity);
	Integer getStagLastYearDate(OpeAllColumn entity);
	List<String> getSegmentByStage(OpeAllColumn entity);
	List<String> getNodesBySegment(OpeAllColumn entity);
	Integer segmentBarData(OpeAllColumn entity);
	Integer segmentBarLastYearData(OpeAllColumn entity);
	Integer nodeBarData(OpeAllColumn entity);
	Integer nodeBarLastYearData(OpeAllColumn entity);
}