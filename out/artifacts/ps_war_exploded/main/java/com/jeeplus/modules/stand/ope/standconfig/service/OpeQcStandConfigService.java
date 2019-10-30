/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standconfig.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.operadar.service.OpeRadarService;
import com.jeeplus.modules.stand.ope.standconfig.entity.OpeQcStandConfig;
import com.jeeplus.modules.stand.ope.standconfig.mapper.OpeQcStandConfigMapper;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;

/**
 * 标准Service
 * @author lpj
 * @version 2019-09-20
 */
@Service
@Transactional(readOnly = true)
public class OpeQcStandConfigService extends CrudService<OpeQcStandConfigMapper, OpeQcStandConfig> {
	@Autowired
	private OpeQcStandConfigMapper mapper;
	
	public OpeQcStandConfig get(String id) {
		return super.get(id);
	}
	
	public List<OpeQcStandConfig> findList(OpeQcStandConfig opeQcStandConfig) {
		return super.findList(opeQcStandConfig);
	}
	
	public Page<OpeQcStandConfig> findPage(Page<OpeQcStandConfig> page, OpeQcStandConfig opeQcStandConfig) {
		return super.findPage(page, opeQcStandConfig);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeQcStandConfig opeQcStandConfig) {
		super.save(opeQcStandConfig);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeQcStandConfig opeQcStandConfig) {
		super.delete(opeQcStandConfig);
	}
	public List<String> getNodeList(){
		return mapper.getNodeList();
	}
	public List<OpeStIndex> getIndexListByNode(String node){
		return mapper.getIndexListByNode(node);
	}
	
	public Map<String,Object> getIndexList(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("parentlist", mapper.getParentlist());
		map.put("childlist", mapper.getChildlist());
		return map;
	}
}