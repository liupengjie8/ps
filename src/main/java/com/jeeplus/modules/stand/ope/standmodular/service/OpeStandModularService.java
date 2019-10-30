/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standmodular.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.flowchart.mapper.OpeFlowChartMapper;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.standmodular.entity.OpeStandModular;
import com.jeeplus.modules.stand.ope.standmodular.mapper.OpeStandModularMapper;

/**
 * 标准模块Service
 * @author lpj
 * @version 2019-08-15
 */
@Service
@Transactional(readOnly = true)
public class OpeStandModularService extends CrudService<OpeStandModularMapper, OpeStandModular> {
	@Autowired
	private OpeStandModularMapper mapper;
	
	@Autowired
	private OpeFlowChartMapper flowChartMapper;
	public OpeStandModular getModularIsQuilified(String modularName){
		boolean isQuilified = true;
		//获取各模块是否有指标不合格
		/*
		 *1.根据模块或者模块id 
		 *2.根据模块id获取有标准（description不为空）流程列表
		 *3.根据流程id获取标准表中的指标id列表 
		 *4.把id列表合并并且拆分为数组 
		 *5.遍历指标列表
		 *6.每一个指标id去患者指标表去查，当日 是否有不合格记录，如果有，返回isQuilified=false，break；
		 * */
		//需要先获取模块有哪些流程  
		//流程有哪些标准
		//标准有哪些指标 得到指标列表
		//遍历指标列表
		//每一个指标id去患者指标表去查，当日 是否有不合格记录，如果有，返回isQuilified=false，break；
		List<String> idsList = mapper.getIndexIdListByModularName(modularName);
		String indexIds="";
		if(idsList!=null){
			for(String s:idsList){
				indexIds+=s+",";
			}
			String[] idArray=indexIds.split(",");
			for(String id:idArray){
				//根据指标id找患者指标明细表中不合格的记录
				OpeAllColumn opeAllColumn = new OpeAllColumn();
				opeAllColumn.setIndexId(id);
				//只要有一个指标有不合格记录，状态就改为不合格红 0
				if(flowChartMapper.getNotQuilifiedRecordCount(opeAllColumn)>0){
					isQuilified=false;
					break;
				}
			}
		}
		OpeStandModular osm = new OpeStandModular();
		osm.setModularName(modularName);
		osm.setIsQuilified(isQuilified);
		return osm;
	}
	public OpeStandModular get(String id) {
		return super.get(id);
	}
	
	public List<OpeStandModular> findList(OpeStandModular opeStandModular) {
		return super.findList(opeStandModular);
	}
	
	public Page<OpeStandModular> findPage(Page<OpeStandModular> page, OpeStandModular opeStandModular) {
		return super.findPage(page, opeStandModular);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeStandModular opeStandModular) {
		super.save(opeStandModular);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeStandModular opeStandModular) {
		super.delete(opeStandModular);
	}
	
}