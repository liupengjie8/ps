/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standconfig.entity;

import com.jeeplus.modules.stand.ope.flowcharttable.entity.OpeFlowChartTable;

import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 标准Entity
 * @author lpj
 * @version 2019-09-20
 */
public class OpeQcStandConfig extends DataEntity<OpeQcStandConfig> {
	
	private static final long serialVersionUID = 1L;
	private OpeFlowChartTable opeFlowChartTable;		// 流程
	private String stage;		// 阶段
	private String segment;		// 环节
	private String node;		// 节点
	private String standType;		// 标准类型
	private String sourceChapter;		// 选自章节
	private String standContent;		// 标准内容
	private String indexs;		// 监测要素
	private String indexsId;		// 监测要素id
	
	public OpeQcStandConfig() {
		super();
	}

	public OpeQcStandConfig(String id){
		super(id);
	}

	@ExcelField(title="流程", fieldType=OpeFlowChartTable.class, value="opeFlowChartTable.text", align=2, sort=6)
	public OpeFlowChartTable getOpeFlowChartTable() {
		return opeFlowChartTable;
	}

	public void setOpeFlowChartTable(OpeFlowChartTable opeFlowChartTable) {
		this.opeFlowChartTable = opeFlowChartTable;
	}
	
	@ExcelField(title="阶段", dictType="ope_stage", align=2, sort=7)
	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}
	
	@ExcelField(title="环节", align=2, sort=8)
	public String getSegment() {
		return segment;
	}

	public void setSegment(String segment) {
		this.segment = segment;
	}
	
	@ExcelField(title="节点", align=2, sort=9)
	public String getNode() {
		return node;
	}

	public void setNode(String node) {
		this.node = node;
	}
	
	@ExcelField(title="标准类型", dictType="ope_stand_type", align=2, sort=10)
	public String getStandType() {
		return standType;
	}

	public void setStandType(String standType) {
		this.standType = standType;
	}
	
	@ExcelField(title="选自章节", align=2, sort=11)
	public String getSourceChapter() {
		return sourceChapter;
	}

	public void setSourceChapter(String sourceChapter) {
		this.sourceChapter = sourceChapter;
	}
	
	@ExcelField(title="标准内容", align=2, sort=12)
	public String getStandContent() {
		return standContent;
	}

	public void setStandContent(String standContent) {
		this.standContent = standContent;
	}
	
	@ExcelField(title="监测要素", align=2, sort=13)
	public String getIndexs() {
		return indexs;
	}

	public void setIndexs(String indexs) {
		this.indexs = indexs;
	}
	
	@ExcelField(title="监测要素id", align=2, sort=14)
	public String getIndexsId() {
		return indexsId;
	}

	public void setIndexsId(String indexsId) {
		this.indexsId = indexsId;
	}
	
}