/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opebarchart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.stand.ope.opebarchart.entity.BarDrillDownSerieData;
import com.jeeplus.modules.stand.ope.opebarchart.entity.BarSerieData;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeBarChart;
import com.jeeplus.modules.stand.ope.opebarchart.mapper.OpeBarChartMapper;

/**
 * 字段Service
 * @author lpj
 * @version 2019-09-11
 */
@Service
@Transactional(readOnly = true)
public class OpeBarChartService  {
	@Autowired
    private OpeBarChartMapper mapper;

	//条图
	public Map<String,Object> getBarJson(OpeAllColumn entity){
		List<OpeBarChart> stageBarData = mapper.stageBarData(entity);
		List<BarSerieData> list1 = new ArrayList<BarSerieData>();
		List<BarDrillDownSerieData> list11 = new ArrayList<BarDrillDownSerieData>();
		for (OpeBarChart o:stageBarData) {
			BarSerieData rs1 = new BarSerieData();
			rs1.setName(o.getxData());
			rs1.setDrilldown(o.getxData());
			rs1.setY(Integer.parseInt(o.getsData()));
			list1.add(rs1);
			//环节
			entity.setStage(o.getxData());
			List<String> segments = mapper.getSegmentByStage(entity);
			BarDrillDownSerieData rbdds1 = new BarDrillDownSerieData();
			List<BarSerieData> data11 = new ArrayList<BarSerieData>();
			rbdds1.setId(o.getxData());
			rbdds1.setName(o.getxData());
			for(int j=0;j<segments.size();j++){
			   BarSerieData rs11 = new BarSerieData();
			   String segment = segments.get(j);
			   rs11.setDrilldown(segment);
			   rs11.setName(segment);
			   entity.setSegment(segment);
			   rs11.setY(mapper.segmentBarData(entity));
			   data11.add(rs11);
			   //节点
				List<String> nodes = mapper.getNodesBySegment(entity);
				BarDrillDownSerieData rbdds11 = new BarDrillDownSerieData();
				List<BarSerieData> data111 = new ArrayList<BarSerieData>();
				rbdds11.setId(segment);
				rbdds11.setName(segment);
				for(int k=0;k<nodes.size();k++){
					   BarSerieData rs111 = new BarSerieData();
					   String node = nodes.get(k);
					   //rs111.setDrilldown(node);
					   rs111.setName(node);
					   entity.setNode(node);
					   rs111.setY(mapper.nodeBarData(entity));
					   data111.add(rs111);
				}	  
				rbdds11.setData(data111);
				list11.add(rbdds11);
			}
			rbdds1.setData(data11);
			list11.add(rbdds1);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("json1", list1);
		map.put("json2", list11);
      	return map;
	}
		

	
	public OpeBarChart findOpeStageBarChart(OpeAllColumn entity) {
		OpeBarChart chart = new OpeBarChart();
		List<OpeBarChart> stageBarData = mapper.stageBarData(entity);
		List<String> xdataList=new ArrayList<String>();
		List<Integer> sdataList=new ArrayList<Integer>();
		List<Integer> sdataLyList=new ArrayList<Integer>();
		for(OpeBarChart o:stageBarData){
			xdataList.add(o.getxData());
			sdataList.add(Integer.parseInt(o.getsData()));
			if(entity.getDataDateStart()!=null&&entity.getDataDateEnd()!=null&&!"".equals(entity.getDataDateEnd())&&!"".equals(entity.getDataDateStart())){
				entity.setDataDateStart((Integer.parseInt(entity.getDataDateStart().substring(0,4))-1)+entity.getDataDateStart().substring(4));
				entity.setDataDateEnd((Integer.parseInt(entity.getDataDateEnd().substring(0,4))-1)+entity.getDataDateEnd().substring(4));
			}
			entity.setStage(o.getxData());
			sdataLyList.add(mapper.getStagLastYearDate(entity));
		}
		chart.setxAxisData(xdataList);
		chart.setSeriesData(sdataList);
		chart.setSeriesDataLastYear(sdataLyList);
		return chart;
	}
	public OpeBarChart findOpeSegmentBarChart(OpeAllColumn entity) {
		OpeBarChart chart = new OpeBarChart();
		List<String> segments = mapper.getSegmentByStage(entity);
		List<String> xdataList=new ArrayList<String>();
		List<Integer> sdataList=new ArrayList<Integer>();
		List<Integer> sdataLyList=new ArrayList<Integer>();
		for(String s:segments){
			entity.setSegment(s);
			xdataList.add(s);
			sdataList.add(mapper.segmentBarData(entity));
			if(entity.getDataDateStart()!=null&&entity.getDataDateEnd()!=null&&!"".equals(entity.getDataDateEnd())&&!"".equals(entity.getDataDateStart())){
				entity.setDataDateStart((Integer.parseInt(entity.getDataDateStart().substring(0,4))-1)+entity.getDataDateStart().substring(4));
				entity.setDataDateEnd((Integer.parseInt(entity.getDataDateEnd().substring(0,4))-1)+entity.getDataDateEnd().substring(4));
			}
			sdataLyList.add(mapper.segmentBarLastYearData(entity));
		}
		chart.setxAxisData(xdataList);
		chart.setSeriesData(sdataList);
		chart.setSeriesDataLastYear(sdataLyList);
		return chart;
	}
	public OpeBarChart findOpeNodeBarChart(OpeAllColumn entity) {
		OpeBarChart chart = new OpeBarChart();
		List<String> nodes = mapper.getNodesBySegment(entity);
		List<String> xdataList=new ArrayList<String>();
		List<Integer> sdataList=new ArrayList<Integer>();
		List<Integer> sdataLyList=new ArrayList<Integer>();
		for(String s:nodes){
			entity.setNode(s);
			xdataList.add(s);
			sdataList.add(mapper.nodeBarData(entity));
			if(entity.getDataDateStart()!=null&&entity.getDataDateEnd()!=null&&!"".equals(entity.getDataDateEnd())&&!"".equals(entity.getDataDateStart())){
				entity.setDataDateStart((Integer.parseInt(entity.getDataDateStart().substring(0,4))-1)+entity.getDataDateStart().substring(4));
				entity.setDataDateEnd((Integer.parseInt(entity.getDataDateEnd().substring(0,4))-1)+entity.getDataDateEnd().substring(4));
			}
			sdataLyList.add(mapper.nodeBarLastYearData(entity));
		}
		chart.setxAxisData(xdataList);
		chart.setSeriesData(sdataList);
		chart.setSeriesDataLastYear(sdataLyList);
		return chart;
	}
}