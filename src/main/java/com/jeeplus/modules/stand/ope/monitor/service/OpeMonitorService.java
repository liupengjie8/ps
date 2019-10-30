/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.monitor.service;

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
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitor;
import com.jeeplus.modules.stand.ope.monitor.entity.OpeMonitorStIndex;
import com.jeeplus.modules.stand.ope.monitor.mapper.OpeMonitorMapper;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.mapper.OpeBarChartMapper;

/**
 * 标准流程Service
 * @author lpj
 * @version 2019-09-20
 */
@Service
@Transactional(readOnly = true)
public class OpeMonitorService extends CrudService<OpeFlowChartTableMapper, OpeFlowChartTable> {
	@Autowired
	private OpeMonitorMapper mapper;
	@Autowired
	private OpeFlowChartMapper flowMapper;
    //根据pageId等信息，获取流程图
	
	public List<OpeMonitor> getNodesBySegment(OpeAllColumn entity) {
		String segment = entity.getSegment();
		List<OpeMonitor> nodes = mapper.getNodesBySegment(segment);
		for(OpeMonitor o:nodes){
			List<String> indexIds = mapper.getIndexIdByNode(o.getNode());
			String ids="";
			Integer nodeStatus=1;
			List<OpeMonitorStIndex> indexList = new ArrayList<OpeMonitorStIndex>();
			if(indexIds!=null){
				for(String s:indexIds){
					ids+=s+",";
				}
				String[] idArray=ids.split(",");
				for(String id:idArray){
					OpeMonitorStIndex osi = new OpeMonitorStIndex();
					osi.setId(id);
					osi.setStaus("1");
					//根据id找要素名称
					osi.setElement(mapper.getElementNameByIndexId(id));
					//根据指标id找患者指标明细表中不合格的记录
					entity.setIndexId(id);
					Integer notQuilifiedRecordCount = flowMapper.getNotQuilifiedRecordCount(entity);
					if(notQuilifiedRecordCount>0){//只要任何一个要素不达标，整个节点不达标
						nodeStatus=0;
						osi.setStaus("0");
					}
					osi.setNotQulifiedCount(""+notQuilifiedRecordCount);
					//根据指标id找所有记录数量
					osi.setAllCount(""+mapper.getAllCountByIndexId(entity));
					indexList.add(osi);
				}
			}
			o.setStaus(""+nodeStatus);
			o.setIndexs(indexList);
		}
		return nodes;
	}
	public Map<String, Object> getData(OpeAllColumn entity) {
		Map<String, Object> map = new HashMap<String,Object>();
		entity.setSegment("手术评估");
		map.put("sspgData", getNodesBySegment(entity));
		entity.setSegment("手术安排");
		map.put("ssapData", getNodesBySegment(entity));
		entity.setSegment("术前准备");
		map.put("sqzbData", getNodesBySegment(entity));
		return map;
	}
}