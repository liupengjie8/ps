/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.operadar.mapper;

import java.util.HashMap;
import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;
import com.jeeplus.modules.stand.ope.operadar.entity.OpeAllColumnRadar;

/**
 * 字段MAPPER接口
 * @author lpj
 * @version 2019-09-11
 */
@MyBatisMapper
public interface OpeRadarMapper{
	List<String> getIndexIdByStage(String param);
	String getIndexQualifiedRate(OpeAllColumnRadar param);
	String getIndexQualifiedRateLastYear(OpeAllColumnRadar param);
}