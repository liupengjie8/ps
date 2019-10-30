/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opecolumnset.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.opecolumnset.entity.OpeColumnSet;
import com.jeeplus.modules.stand.ope.opecolumnset.mapper.OpeColumnSetMapper;

/**
 * 字段Service
 * @author lpj
 * @version 2019-09-11
 */
@Service
@Transactional(readOnly = true)
public class OpeColumnSetService extends CrudService<OpeColumnSetMapper, OpeColumnSet> {

	public OpeColumnSet get(String id) {
		return super.get(id);
	}
	
	public List<OpeColumnSet> findList(OpeColumnSet opeColumnSet) {
		return super.findList(opeColumnSet);
	}
	
	public Page<OpeColumnSet> findPage(Page<OpeColumnSet> page, OpeColumnSet opeColumnSet) {
		return super.findPage(page, opeColumnSet);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeColumnSet opeColumnSet) {
		super.save(opeColumnSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeColumnSet opeColumnSet) {
		super.delete(opeColumnSet);
	}
	
}