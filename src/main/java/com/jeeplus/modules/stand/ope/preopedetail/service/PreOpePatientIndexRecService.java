/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.preopedetail.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.preopedetail.entity.PreOpePatientIndexRec;
import com.jeeplus.modules.stand.ope.preopedetail.mapper.PreOpePatientIndexRecMapper;

/**
 * 术前明细Service
 * @author lpj
 * @version 2019-10-17
 */
@Service
@Transactional(readOnly = true)
public class PreOpePatientIndexRecService extends CrudService<PreOpePatientIndexRecMapper, PreOpePatientIndexRec> {

	public PreOpePatientIndexRec get(String id) {
		return super.get(id);
	}
	
	public List<PreOpePatientIndexRec> findList(PreOpePatientIndexRec preOpePatientIndexRec) {
		return super.findList(preOpePatientIndexRec);
	}
	
	public Page<PreOpePatientIndexRec> findPage(Page<PreOpePatientIndexRec> page, PreOpePatientIndexRec preOpePatientIndexRec) {
		return super.findPage(page, preOpePatientIndexRec);
	}
	
	@Transactional(readOnly = false)
	public void save(PreOpePatientIndexRec preOpePatientIndexRec) {
		super.save(preOpePatientIndexRec);
	}
	
	@Transactional(readOnly = false)
	public void delete(PreOpePatientIndexRec preOpePatientIndexRec) {
		super.delete(preOpePatientIndexRec);
	}
	
}