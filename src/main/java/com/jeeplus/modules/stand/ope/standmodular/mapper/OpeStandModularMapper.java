/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standmodular.mapper;

import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.standmodular.entity.OpeStandModular;

/**
 * 标准模块MAPPER接口
 * @author lpj
 * @version 2019-08-15
 */
@MyBatisMapper
public interface OpeStandModularMapper extends BaseMapper<OpeStandModular> {
	List<String> getIndexIdListByModularName(String modularName);
}