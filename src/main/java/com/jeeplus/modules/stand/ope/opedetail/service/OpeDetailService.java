/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opedetail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;
import com.jeeplus.modules.stand.ope.opebarchart.mapper.OpeBarChartMapper;
import com.jeeplus.modules.stand.ope.opedetail.mapper.OpeDetailMapper;

/**
 * 字段Service
 * @author lpj
 * @version 2019-09-11
 */
@Service
@Transactional(readOnly = true)
public class OpeDetailService  {
	@Autowired
    private OpeDetailMapper mapper;
	
	
	public List<OpeAllColumn> getOpeDetailList(OpeAllColumn entity) {
		List<OpeAllColumn> stageBarData = mapper.getOpeDetailList(entity);
		if(entity.getChartId()!=null&&!"".equals(entity.getChartId())){
			stageBarData=mapper.getOpeDetailListByChartId(entity);
		}
		return stageBarData;
	}
	
}