/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.preopedetail.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 术前明细Entity
 * @author lpj
 * @version 2019-10-17
 */
public class PreOpePatientIndexRec extends DataEntity<PreOpePatientIndexRec> {
	
	private static final long serialVersionUID = 1L;
	private String indexId;		// 指标id
	private String indexName;		// 指标名称
	private String element;		// 要素
	private Date dataDate;		// 数据时间
	private String patientId;		// 患者id
	private String patientName;		// 患者姓名
	private String visitId;		// 入院次数id
	private String identity;		// 身份
	private String chargeType;		// 费别
	private String birthPlace;		// 出生地
	private String operationNo;		// 手术序号
	private String operationCode;		// 手术编码
	private Date opeStartTime;		// 手术开始时间
	private Date opeEndTime;		// 手术结束时间
	private String isQualified;		// 1合格0不合格
	private String operationDesc;		// 手术
	private String chiefDoctor;		// 主治医师
	private String operator;		// 手术医师
	private String anaesthesiaMethod;		// 麻醉方法
	private Date operatingDate;		// 手术日期
	private Date admissionDateTime;		// 入院日期
	private Date dischargeDateTime;		// 出院日期
	private String deptCode;		// 住院科室
	private String sex;		// 性别
	private String indexIds;
	private String[] indexIdArray;
	private String admissionDateTimeStart;
	private String admissionDateTimeEnd;
	private String dischargeDateTimeStart;
	private String dischargeDateTimeEnd;
	private String name;
    private String opeStartTimeStart;
    private String opeStartTimeEnd;
    private String opeEndTimeStart;
    private String opeEndTimeEnd;
    private String opeartingDateStart;
    private String opeartingDateEnd;
    private String sdate;
    private String edate;
    private String segment;
    private String stage;
    private String node;
    private String chartId;

	public String getChartId() {
		return chartId;
	}

	public void setChartId(String chartId) {
		this.chartId = chartId;
	}

	public String getIndexIds() {
		return indexIds;
	}

	public void setIndexIds(String indexIds) {
		this.indexIds = indexIds;
	}

	public String[] getIndexIdArray() {
		return indexIdArray;
	}

	public void setIndexIdArray(String[] indexIdArray) {
		this.indexIdArray = indexIdArray;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getSegment() {
		return segment;
	}

	public void setSegment(String segment) {
		this.segment = segment;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public String getNode() {
		return node;
	}

	public void setNode(String node) {
		this.node = node;
	}

	public PreOpePatientIndexRec() {
		super();
	}

	public PreOpePatientIndexRec(String id){
		super(id);
	}

	@ExcelField(title="指标id", align=2, sort=1)
	public String getIndexId() {
		return indexId;
	}

	public void setIndexId(String indexId) {
		this.indexId = indexId;
	}
	
	@ExcelField(title="指标名称", align=2, sort=2)
	public String getIndexName() {
		return indexName;
	}

	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}
	
	@ExcelField(title="要素", align=2, sort=3)
	public String getElement() {
		return element;
	}

	public void setElement(String element) {
		this.element = element;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="数据时间", align=2, sort=4)
	public Date getDataDate() {
		return dataDate;
	}

	public void setDataDate(Date dataDate) {
		this.dataDate = dataDate;
	}
	
	@ExcelField(title="患者id", align=2, sort=5)
	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	
	@ExcelField(title="患者姓名", align=2, sort=6)
	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	
	@ExcelField(title="入院次数id", align=2, sort=7)
	public String getVisitId() {
		return visitId;
	}

	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}
	
	@ExcelField(title="身份", align=2, sort=8)
	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}
	
	@ExcelField(title="费别", align=2, sort=9)
	public String getChargeType() {
		return chargeType;
	}

	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	
	@ExcelField(title="出生地", align=2, sort=10)
	public String getBirthPlace() {
		return birthPlace;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	
	@ExcelField(title="手术序号", align=2, sort=11)
	public String getOperationNo() {
		return operationNo;
	}

	public void setOperationNo(String operationNo) {
		this.operationNo = operationNo;
	}
	
	@ExcelField(title="手术编码", align=2, sort=12)
	public String getOperationCode() {
		return operationCode;
	}

	public void setOperationCode(String operationCode) {
		this.operationCode = operationCode;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="手术开始时间", align=2, sort=13)
	public Date getOpeStartTime() {
		return opeStartTime;
	}

	public void setOpeStartTime(Date opeStartTime) {
		this.opeStartTime = opeStartTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="手术结束时间", align=2, sort=14)
	public Date getOpeEndTime() {
		return opeEndTime;
	}

	public void setOpeEndTime(Date opeEndTime) {
		this.opeEndTime = opeEndTime;
	}
	
	@ExcelField(title="1合格0不合格", align=2, sort=15)
	public String getIsQualified() {
		return isQualified;
	}

	public void setIsQualified(String isQualified) {
		this.isQualified = isQualified;
	}
	
	@ExcelField(title="手术", align=2, sort=16)
	public String getOperationDesc() {
		return operationDesc;
	}

	public void setOperationDesc(String operationDesc) {
		this.operationDesc = operationDesc;
	}
	
	@ExcelField(title="主治医师", align=2, sort=17)
	public String getChiefDoctor() {
		return chiefDoctor;
	}

	public void setChiefDoctor(String chiefDoctor) {
		this.chiefDoctor = chiefDoctor;
	}
	
	@ExcelField(title="手术医师", align=2, sort=18)
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	@ExcelField(title="麻醉方法", align=2, sort=19)
	public String getAnaesthesiaMethod() {
		return anaesthesiaMethod;
	}

	public void setAnaesthesiaMethod(String anaesthesiaMethod) {
		this.anaesthesiaMethod = anaesthesiaMethod;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="手术日期", align=2, sort=20)
	public Date getOperatingDate() {
		return operatingDate;
	}

	public void setOperatingDate(Date operatingDate) {
		this.operatingDate = operatingDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="入院日期", align=2, sort=21)
	public Date getAdmissionDateTime() {
		return admissionDateTime;
	}

	public void setAdmissionDateTime(Date admissionDateTime) {
		this.admissionDateTime = admissionDateTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="出院日期", align=2, sort=22)
	public Date getDischargeDateTime() {
		return dischargeDateTime;
	}

	public void setDischargeDateTime(Date dischargeDateTime) {
		this.dischargeDateTime = dischargeDateTime;
	}
	
	@ExcelField(title="住院科室", align=2, sort=23)
	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	
	@ExcelField(title="性别", align=2, sort=24)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
}