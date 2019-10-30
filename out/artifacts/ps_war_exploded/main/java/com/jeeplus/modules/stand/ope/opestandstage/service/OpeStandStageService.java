/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opestandstage.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.opestandstage.entity.OpeStandStage;
import com.jeeplus.modules.stand.ope.opestandstage.mapper.OpeStandStageMapper;

/**
 * 阶段Service
 * @author lpj
 * @version 2019-08-16
 */
@Service
@Transactional(readOnly = true)
public class OpeStandStageService extends CrudService<OpeStandStageMapper, OpeStandStage> {

	public OpeStandStage get(String id) {
		return super.get(id);
	}
	
	public List<OpeStandStage> findList(OpeStandStage opeStandStage) {
		return super.findList(opeStandStage);
	}
	
	public Page<OpeStandStage> findPage(Page<OpeStandStage> page, OpeStandStage opeStandStage) {
		return super.findPage(page, opeStandStage);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeStandStage opeStandStage) {
		super.save(opeStandStage);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeStandStage opeStandStage) {
		super.delete(opeStandStage);
	}
	
}