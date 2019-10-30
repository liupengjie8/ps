/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.flowcharttable.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.flowcharttable.entity.OpeFlowChartTable;
import com.jeeplus.modules.stand.ope.flowcharttable.mapper.OpeFlowChartTableMapper;

/**
 * 标准流程Service
 * @author lpj
 * @version 2019-09-20
 */
@Service
@Transactional(readOnly = true)
public class OpeFlowChartTableService extends CrudService<OpeFlowChartTableMapper, OpeFlowChartTable> {

	public OpeFlowChartTable get(String id) {
		return super.get(id);
	}
	
	public List<OpeFlowChartTable> findList(OpeFlowChartTable opeFlowChartTable) {
		return super.findList(opeFlowChartTable);
	}
	
	public Page<OpeFlowChartTable> findPage(Page<OpeFlowChartTable> page, OpeFlowChartTable opeFlowChartTable) {
		return super.findPage(page, opeFlowChartTable);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeFlowChartTable opeFlowChartTable) {
		super.save(opeFlowChartTable);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeFlowChartTable opeFlowChartTable) {
		super.delete(opeFlowChartTable);
	}
	
}