/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opecolumnset.entity;

import com.jeeplus.modules.stand.ope.opestandstage.entity.OpeStandStage;
import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 字段Entity
 * @author lpj
 * @version 2019-09-11
 */
public class OpeColumnSet extends DataEntity<OpeColumnSet> {
	
	private static final long serialVersionUID = 1L;
	private String indexName;
	private String element;
	private String stageId;		// 阶段id
	private String tableName;		// 来源表
	private String columnName;		// 来源字段
	private String columnType;		// 字段类型
	private String columnSelections;		// 下拉选项（|隔开）
	private OpeStandStage isDefaultSelected;		// 是否选入默认查询集合
	private String isActive;		// 是否有效
	private String stageName;		// 阶段
	private String indexId;//指标id
	private String admissionDateTimeStart;
	private String admissionDateTimeEnd;
	private String dischargeDateTimeStart;
	private String dischargeDateTimeEnd;
	private String operator;
	private String patientId;
	private String visitId;
	private String name;
	private String birthPlace;
    private String identity;
    private String chargeType;
    private String operationNo;
    private String operationCode;
    private String operationDesc;
    private String opeStartTimeStart;
    private String opeStartTimeEnd;
    private String opeEndTimeStart;
    private String opeEndTimeEnd;
    private String chiefDoctor;
    private String anaesthesiaMethod;
    private String opeartingDateStart;
    private String opeartingDateEnd;
    private String sdate;
    private String edate;
    
	public String getIndexName() {
		return indexName;
	}
	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}
	public String getElement() {
		return element;
	}
	public void setElement(String element) {
		this.element = element;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getAdmissionDateTimeStart() {
		return admissionDateTimeStart;
	}
	public void setAdmissionDateTimeStart(String admissionDateTimeStart) {
		this.admissionDateTimeStart = admissionDateTimeStart;
	}
	public String getAdmissionDateTimeEnd() {
		return admissionDateTimeEnd;
	}
	public void setAdmissionDateTimeEnd(String admissionDateTimeEnd) {
		this.admissionDateTimeEnd = admissionDateTimeEnd;
	}
	public String getDischargeDateTimeStart() {
		return dischargeDateTimeStart;
	}
	public void setDischargeDateTimeStart(String dischargeDateTimeStart) {
		this.dischargeDateTimeStart = dischargeDateTimeStart;
	}
	public String getDischargeDateTimeEnd() {
		return dischargeDateTimeEnd;
	}
	public void setDischargeDateTimeEnd(String dischargeDateTimeEnd) {
		this.dischargeDateTimeEnd = dischargeDateTimeEnd;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	public String getVisitId() {
		return visitId;
	}
	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public String getOperationNo() {
		return operationNo;
	}
	public void setOperationNo(String operationNo) {
		this.operationNo = operationNo;
	}
	public String getOperationCode() {
		return operationCode;
	}
	public void setOperationCode(String operationCode) {
		this.operationCode = operationCode;
	}
	public String getOperationDesc() {
		return operationDesc;
	}
	public void setOperationDesc(String operationDesc) {
		this.operationDesc = operationDesc;
	}
	public String getChiefDoctor() {
		return chiefDoctor;
	}
	public void setChiefDoctor(String chiefDoctor) {
		this.chiefDoctor = chiefDoctor;
	}
	public String getAnaesthesiaMethod() {
		return anaesthesiaMethod;
	}
	public void setAnaesthesiaMethod(String anaesthesiaMethod) {
		this.anaesthesiaMethod = anaesthesiaMethod;
	}
	public String getOpeStartTimeStart() {
		return opeStartTimeStart;
	}
	public void setOpeStartTimeStart(String opeStartTimeStart) {
		this.opeStartTimeStart = opeStartTimeStart;
	}
	public String getOpeStartTimeEnd() {
		return opeStartTimeEnd;
	}
	public void setOpeStartTimeEnd(String opeStartTimeEnd) {
		this.opeStartTimeEnd = opeStartTimeEnd;
	}
	public String getOpeEndTimeStart() {
		return opeEndTimeStart;
	}
	public void setOpeEndTimeStart(String opeEndTimeStart) {
		this.opeEndTimeStart = opeEndTimeStart;
	}
	public String getOpeEndTimeEnd() {
		return opeEndTimeEnd;
	}
	public void setOpeEndTimeEnd(String opeEndTimeEnd) {
		this.opeEndTimeEnd = opeEndTimeEnd;
	}
	public String getOpeartingDateStart() {
		return opeartingDateStart;
	}
	public void setOpeartingDateStart(String opeartingDateStart) {
		this.opeartingDateStart = opeartingDateStart;
	}
	public String getOpeartingDateEnd() {
		return opeartingDateEnd;
	}
	public void setOpeartingDateEnd(String opeartingDateEnd) {
		this.opeartingDateEnd = opeartingDateEnd;
	}
	public String getIndexId() {
		return indexId;
	}
	public void setIndexId(String indexId) {
		this.indexId = indexId;
	}
	public String getStageId() {
		return stageId;
	}
	public void setStageId(String stageId) {
		this.stageId = stageId;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getColumnType() {
		return columnType;
	}
	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	public String getColumnSelections() {
		return columnSelections;
	}
	public void setColumnSelections(String columnSelections) {
		this.columnSelections = columnSelections;
	}
	public OpeStandStage getIsDefaultSelected() {
		return isDefaultSelected;
	}
	public void setIsDefaultSelected(OpeStandStage isDefaultSelected) {
		this.isDefaultSelected = isDefaultSelected;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public String getStageName() {
		return stageName;
	}
	public void setStageName(String stageName) {
		this.stageName = stageName;
	}
	
}