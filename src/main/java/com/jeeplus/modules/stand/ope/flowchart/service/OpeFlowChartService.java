/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.flowchart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.flowchart.entity.OpeFlowChart;
import com.jeeplus.modules.stand.ope.flowchart.mapper.OpeFlowChartMapper;
import com.jeeplus.modules.stand.ope.flowcharttable.entity.OpeFlowChartTable;
import com.jeeplus.modules.stand.ope.flowcharttable.mapper.OpeFlowChartTableMapper;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;

/**
 * 标准流程Service
 * @author lpj
 * @version 2019-09-20
 */
@Service
@Transactional(readOnly = true)
public class OpeFlowChartService extends CrudService<OpeFlowChartTableMapper, OpeFlowChartTable> {
	@Autowired
	private OpeFlowChartMapper mapper;
    //根据pageId等信息，获取流程图
	public Map<String, Object> getFlowChartData(OpeFlowChart opeFlowChart, OpeAllColumn opeAllColumn){
		//构造返回数据的map
		Map<String, Object> map = new HashMap<String,Object>();
		//构造并添加流程节点数据
		//TODO 遍历nodes，有标准的节点，知道标准表中对应的指标id，通过指标id在患者指标记录表中找是否有不达标数据，如果有，staus改为0
		List<OpeFlowChart> nodes=new ArrayList<OpeFlowChart>();
		nodes=mapper.getFlowChartData(opeFlowChart);
		for(OpeFlowChart o:nodes){
			//如果节点有标准，说明此流程对应有指标，查询所对应指标是否都达标，有不达标则设置状态为0
			if(o.getDescription()!=null&&!"".equals(o.getDescription())){
				//根据流程id在标准表中找指标id
				List<String> idsList = mapper.getIndexIdsByChartId(o);
				String indexIds="";
				if(idsList!=null){
					for(String s:idsList){
						indexIds+=s+",";
					}
					String[] idArray=indexIds.split(",");
					for(String id:idArray){
						//根据指标id找患者指标明细表中不合格的记录
						opeAllColumn.setIndexId(id);
						//只要有一个指标有不合格记录，状态就改为不合格红 0
						if(mapper.getNotQuilifiedRecordCount(opeAllColumn)>0){
							o.setStatus("0");
							break;
						}
					}
				}
				
			}
			if("1".equals(o.getStatus())){
				//如果节点有子节点
				if(o.getNextLowLevel()!=null&&!"".equals(o.getNextLowLevel())){
					OpeFlowChart of= new OpeFlowChart();
					of.setPageId(o.getNextLowLevel());
					o.setStatus(getNodeStaus(opeAllColumn,of));
				}
			}
		}	
		map.put("nodes", nodes);
		//构造并添加流程画线数据
		List<OpeFlowChart> lines=new ArrayList<OpeFlowChart>();
		lines=mapper.getFlowChartLineData(opeFlowChart);
		for(OpeFlowChart o:lines){
			//如果有Y/N，把Y/N数据加到画线数据中
			if(o.getSymbol()!=null&&!"".equals(o.getSymbol())){
				List<Map<String,Object>> l = new ArrayList<Map<String,Object>>();
				Map<String,Object> m = new HashMap<String,Object>();
				
			    m.put("title", o.getSymbol());
			    l.add(m);
			    o.setSymbols(l);
		    }
		}
		map.put("lines", lines);
		return map;
	}
	public String getNodeStaus(OpeAllColumn opeAllColumn,OpeFlowChart opeFlowChart){
		String stutas="1";
		List<OpeFlowChart> nodes=new ArrayList<OpeFlowChart>();
		nodes=mapper.getFlowChartData(opeFlowChart);
		for(OpeFlowChart o:nodes){
			//如果节点有标准，说明此流程对应有指标，查询所对应指标是否都达标，有不达标则设置状态为0
			if(o.getDescription()!=null&&!"".equals(o.getDescription())){
				//根据流程id在标准表中找指标id
				List<String> idsList = mapper.getIndexIdsByChartId(o);
				String indexIds="";
				if(idsList!=null){
					for(String s:idsList){
						indexIds+=s+",";
					}
					String[] idArray=indexIds.split(",");
					for(String id:idArray){
						//根据指标id找患者指标明细表中不合格的记录
						opeAllColumn.setIndexId(id);
						//只要有一个指标有不合格记录，状态就改为不合格红 0
						if(mapper.getNotQuilifiedRecordCount(opeAllColumn)>0){
							stutas="0";
							return stutas;
						}
					}
				}
				
			}
			if("1".equals(stutas)){
				//如果节点有子节点
				if(o.getNextLowLevel()!=null&&!"".equals(o.getNextLowLevel())){
					opeFlowChart.setPageId(o.getNextLowLevel());
					stutas=(getNodeStaus(opeAllColumn,opeFlowChart));
					if("0".equals("s")){
						return stutas;
					}
				}
			}
		}	
		return stutas;
	}
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