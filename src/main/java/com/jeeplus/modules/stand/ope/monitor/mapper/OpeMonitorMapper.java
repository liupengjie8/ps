/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.monitor.mapper;

import java.util.HashMap;
import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitor;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;

/**
 * 字段MAPPER接口
 * @author lpj
 * @version 2019-09-11
 */
@MyBatisMapper
public interface OpeMonitorMapper extends BaseMapper<OpeAllColumn> {
	List<OpeMonitor> getNodesBySegment(String segment);
	List<String>  getIndexIdByNode(String node);
	String getElementNameByIndexId(String node);
	Integer getAllCountByIndexId(OpeAllColumn opeAllColumn);
}