/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opeparameters.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.opeparameters.entity.OpeParamaters;
import com.jeeplus.modules.stand.ope.opeparameters.mapper.OpeParamatersMapper;

/**
 * 参数维护Service
 * @author lpj
 * @version 2019-08-20
 */
@Service
@Transactional(readOnly = true)
public class OpeParamatersService extends CrudService<OpeParamatersMapper, OpeParamaters> {

	public OpeParamaters get(String id) {
		return super.get(id);
	}
	
	public List<OpeParamaters> findList(OpeParamaters opeParamaters) {
		return super.findList(opeParamaters);
	}
	
	public Page<OpeParamaters> findPage(Page<OpeParamaters> page, OpeParamaters opeParamaters) {
		return super.findPage(page, opeParamaters);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeParamaters opeParamaters) {
		super.save(opeParamaters);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeParamaters opeParamaters) {
		super.delete(opeParamaters);
	}
	
}