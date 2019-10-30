/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opecolumn.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.opecolumn.entity.OpeColumn;
import com.jeeplus.modules.stand.ope.opecolumn.mapper.OpeColumnMapper;
import com.jeeplus.modules.stand.ope.opedetail.mapper.OpeDetailMapper;

/**
 * 手术字段Service
 * @author lpj
 * @version 2019-10-20
 */
@Service
@Transactional(readOnly = true)
public class OpeColumnService extends CrudService<OpeColumnMapper, OpeColumn> {
	@Autowired
    private OpeColumnMapper mapper;
	public OpeColumn get(String id) {
		return super.get(id);
	}
	
	public List<OpeColumn> findList(OpeColumn opeColumn) {
		return super.findList(opeColumn);
	}
	
	public Page<OpeColumn> findPage(Page<OpeColumn> page, OpeColumn opeColumn) {
		return super.findPage(page, opeColumn);
	}
	
	@Transactional(readOnly = false)
	public void save(OpeColumn opeColumn) {
		super.save(opeColumn);
	}
	
	@Transactional(readOnly = false)
	public void delete(OpeColumn opeColumn) {
		super.delete(opeColumn);
	}
	public Map<String,Object> getAllOpeColumn() {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("parentlist", mapper.getParentlist());
		map.put("childlist", mapper.getChildlist());
		return map;
	}
	public List<OpeColumn> getColumnListByIds( String ids){
		List<OpeColumn> list = new ArrayList<OpeColumn>();
		String[] idss = ids.split(",");
		for(String id:idss){
			list.add(super.get(id));
		}
		return list;
	}
}