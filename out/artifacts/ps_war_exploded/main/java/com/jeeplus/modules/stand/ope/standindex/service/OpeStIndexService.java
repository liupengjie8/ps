/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standindex.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;
import com.jeeplus.modules.stand.ope.standindex.mapper.OpeStIndexMapper;

/**
 * 指标Service
 * @author lpj
 * @version 2019-08-22
 */
@Service
@Transactional(readOnly = true)
public class OpeStIndexService extends CrudService<OpeStIndexMapper, OpeStIndex> {

	public OpeStIndex get(String id) {
		return super.get(id);
	}
	
	public List<OpeStIndex> findList(OpeStIndex opeStIndex) {
		return super.findList(opeStIndex);
	}
	
	public Page<OpeStIndex> findPage(Page<OpeStIndex> page, OpeStIndex opeStIndex) {
		return super.findPage(page, opeStIndex);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeStIndex opeStIndex) {
		super.save(opeStIndex);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeStIndex opeStIndex) {
		super.delete(opeStIndex);
	}
	
}