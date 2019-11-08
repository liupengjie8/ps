/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.operadar.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;
import com.jeeplus.modules.stand.ope.opebarchart.mapper.OpeBarChartMapper;
import com.jeeplus.modules.stand.ope.opedetail.mapper.OpeDetailMapper;
import com.jeeplus.modules.stand.ope.operadar.entity.OpeAllColumnRadar;
import com.jeeplus.modules.stand.ope.operadar.entity.OpeRadar;
import com.jeeplus.modules.stand.ope.operadar.mapper.OpeRadarMapper;
import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;
import com.jeeplus.modules.stand.ope.standindex.mapper.OpeStIndexMapper;

/**
 * 雷达图Service
 * @author lpj
 * @version 2019-09-11
 */
@Service
@Transactional(readOnly = true)
public class OpeRadarService{
	@Autowired
    private OpeRadarMapper mapper;
	@Autowired
	private OpeStIndexMapper indexMapper;
    
	//指标id，指标名称，所属阶段，达标率，去年同期达标率
	public Map<String,Object> getOpeRadarList(OpeAllColumnRadar param) {
		Map<String,Object> map = new HashMap<String,Object>();
		//术前雷达List
		List<OpeRadar> preOpeRadarData = new ArrayList<OpeRadar>();
		//术中雷达List
		List<OpeRadar> opeRadarData = new ArrayList<OpeRadar>();
		//术后雷达List
		List<OpeRadar> aftOpeRadarData = new ArrayList<OpeRadar>();
		//通过阶段查询所有的指标
		List<OpeStIndex> list = new ArrayList<OpeStIndex>();
		List<String> indexIds = new ArrayList<String>();
		indexIds = mapper.getIndexIdByStage("术前");
		String ids="";
		if(indexIds!=null){
			if(param.getIndexIds()==null || "".equals(param.getIndexIds())){//没选择指标
				for(String s:indexIds){
					ids+=s+",";
				}
			}else{//选择了指标，只查询选中的指标
				String[] split = param.getIndexIds().split(",");
				for(String s:split){
					if((","+indexIds+",").contains(","+s+",")){//如果选中的指标属于术前
						ids+=s+",";
					}
				}
				ids=param.getIndexIds();
			}
			String[] idArray=ids.split(",");
			for(String id:idArray){
				OpeStIndex o =indexMapper.get(id) ;
				list.add(o);
			}
		}
		
		for(OpeStIndex s:list){
			OpeRadar or = new OpeRadar();
			or.setId(s.getId());
			or.setStage("术前");
			or.setTitle(s.getIndexName());
			param.setIndexId(s.getId());
			//根据指标id获取合格率
			Double rate1 = Double.parseDouble(mapper.getIndexQualifiedRate(param));
			if(param.getDataDateStart()!=null&&param.getDataDateEnd()!=null&&!"".equals(param.getDataDateEnd())&&!"".equals(param.getDataDateStart())){
				param.setDataDateStart((Integer.parseInt(param.getDataDateStart().substring(0,4))-1)+param.getDataDateStart().substring(4));
				param.setDataDateEnd((Integer.parseInt(param.getDataDateEnd().substring(0,4))-1)+param.getDataDateEnd().substring(4));
			}
			Double rate2 = Double.parseDouble(mapper.getIndexQualifiedRateLastYear(param));
			Double[] value = {rate1,rate2};
			or.setValue(value);
			preOpeRadarData.add(or);
		}
		
		/*List<OpeStIndex> listope = new ArrayList<OpeStIndex>();
		List<String> indexIdsope = mapper.getIndexIdByStage("术中");
		String idsope="";
		if(indexIdsope!=null){
			for(String s:indexIdsope){
				idsope+=s+",";
			}
			String[] idArray=idsope.split(",");
			for(String id:idArray){
				OpeStIndex o =indexMapper.get(id) ;
				listope.add(o);
			}
		}
		
		for(OpeStIndex s:listope){
			OpeRadar or = new OpeRadar();
			or.setId(s.getId());
			or.setStage("术中");
			or.setIndexName(s.getIndexName());
			param.setIndexId(s.getId());
			//根据指标id获取合格率
			or.setQualifiedRate(mapper.getIndexQualifiedRate(param));
			//根据指标id获取去年合格率
			or.setQualifiedRateLastYear(mapper.getIndexQualifiedRateLastYear(param));
			opeRadarData.add(or);
		}
		
		List<OpeStIndex> listaft = new ArrayList<OpeStIndex>();
		List<String> indexIdsaft = mapper.getIndexIdByStage("术后");
		String idsaft="";
		if(indexIdsaft!=null){
			for(String s:indexIds){
				idsaft+=s+",";
			}
			String[] idArray=idsaft.split(",");
			for(String id:idArray){
				OpeStIndex o =indexMapper.get(id) ;
				listaft.add(o);
			}
		}
		
		for(OpeStIndex s:listaft){
			OpeRadar or = new OpeRadar();
			or.setId(s.getId());
			or.setStage("术后");
			or.setIndexName(s.getIndexName());
			param.setIndexId(s.getId());
			//根据指标id获取合格率
			or.setQualifiedRate(mapper.getIndexQualifiedRate(param));
			//根据指标id获取去年合格率
			or.setQualifiedRateLastYear(mapper.getIndexQualifiedRateLastYear(param));
			aftOpeRadarData.add(or);
		}*/
		map.put("preOpeRadarData",preOpeRadarData);
		map.put("opeRadarData",opeRadarData);
		map.put("aftOpeRadarData",aftOpeRadarData);
		return map;
	}
	
}