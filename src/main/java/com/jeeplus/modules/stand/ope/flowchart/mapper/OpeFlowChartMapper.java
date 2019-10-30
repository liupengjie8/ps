/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.flowchart.mapper;

import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.flowchart.entity.OpeFlowChart;
import com.jeeplus.modules.stand.ope.flowcharttable.entity.OpeFlowChartTable;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;

/**
 * 标准流程MAPPER接口
 * @author lpj
 * @version 2019-09-20
 */
@MyBatisMapper
public interface OpeFlowChartMapper extends BaseMapper<OpeFlowChartTable> {
	List<OpeFlowChart> getFlowChartData(OpeFlowChart opeFlowChart);
	List<OpeFlowChart> getFlowChartLineData(OpeFlowChart opeFlowChart);
	List<String> getIndexIdsByChartId(OpeFlowChart opeFlowChart);
	Integer getNotQuilifiedRecordCount(OpeAllColumn opeAllColumn);
}