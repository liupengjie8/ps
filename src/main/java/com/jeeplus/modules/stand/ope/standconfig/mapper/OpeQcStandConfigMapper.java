/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standconfig.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.standconfig.entity.OpeQcStandConfig;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;

/**
 * 标准MAPPER接口
 * @author lpj
 * @version 2019-09-20
 */
@MyBatisMapper
public interface OpeQcStandConfigMapper extends BaseMapper<OpeQcStandConfig> {
	List<String> getNodeList();
	List<OpeStIndex> getIndexListByNode(@Param("node")String node);
	List<HashMap<String,Object>> getParentlist();
	List<HashMap<String,Object>> getChildlist();
}