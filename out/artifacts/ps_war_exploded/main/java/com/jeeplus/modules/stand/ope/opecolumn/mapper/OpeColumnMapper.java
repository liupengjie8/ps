/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opecolumn.mapper;

import java.util.HashMap;
import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.opecolumn.entity.OpeColumn;

/**
 * 手术字段MAPPER接口
 * @author lpj
 * @version 2019-10-20
 */
@MyBatisMapper
public interface OpeColumnMapper extends BaseMapper<OpeColumn> {
	List<HashMap<String,Object>> getParentlist();
	List<HashMap<String,Object>> getChildlist();
}