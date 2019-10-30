<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>标准管理</title>
	<meta name="decorator" content="ani"/>
	<script type="text/javascript">

		$(document).ready(function() {
			jp.ajaxForm("#inputForm",function(data){
				if(data.success){
				    jp.success(data.msg);
					jp.go("${ctx}/standconfig/opeQcStandConfig");
				}else{
				    jp.error(data.msg);
				    $("#inputForm").find("button:submit").button("reset");
				}
			});

		});
	</script>
</head>
<body>
<div class="wrapper wrapper-content">				
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title"> 
				<a class="panelButton" href="${ctx}/standconfig/opeQcStandConfig"><i class="ti-angle-left"></i> 返回</a>
			</h3>
		</div>
		<div class="panel-body">
		<form:form id="inputForm" modelAttribute="opeQcStandConfig" action="${ctx}/standconfig/opeQcStandConfig/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
				<div class="form-group">
					<label class="col-sm-2 control-label">流程：</label>
					<div class="col-sm-10">
						<sys:gridselect url="${ctx}/flowcharttable/opeFlowChartTable/data" id="opeFlowChartTable" name="opeFlowChartTable.chartId" value="${opeQcStandConfig.opeFlowChartTable.chartId}" labelName="opeFlowChartTable.text" labelValue="${opeQcStandConfig.opeFlowChartTable.text}"
							 title="选择流程" cssClass="form-control " fieldLabels="流程编号|流程名称" fieldKeys="chartId|text" searchLabels="流程编号|流程名称" searchKeys="chartId|text" ></sys:gridselect>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">阶段：</label>
					<div class="col-sm-10">
						<form:radiobuttons path="stage" items="${fns:getDictList('ope_stage')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">环节：</label>
					<div class="col-sm-10">
						<form:input path="segment" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">节点：</label>
					<div class="col-sm-10">
						<form:input path="node" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">标准类型：</label>
					<div class="col-sm-10">
						<form:radiobuttons path="standType" items="${fns:getDictList('ope_stand_type')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">选自章节：</label>
					<div class="col-sm-10">
						<form:input path="sourceChapter" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">标准内容：</label>
					<div class="col-sm-10">
						<form:input path="standContent" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">监测要素：</label>
					<div class="col-sm-10">
						<form:input path="indexs" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">监测要素id：</label>
					<div class="col-sm-10">
						<form:input path="indexsId" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">备注信息：</label>
					<div class="col-sm-10">
						<form:input path="remarks" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
		<c:if test="${mode == 'add' || mode=='edit'}">
				<div class="col-lg-3"></div>
		        <div class="col-lg-6">
		             <div class="form-group text-center">
		                 <div>
		                     <button class="btn btn-primary btn-block btn-lg btn-parsley" data-loading-text="正在提交...">提 交</button>
		                 </div>
		             </div>
		        </div>
		</c:if>
		</form:form>
		</div>				
	</div>
	</div>
</div>
</div>
</body>
</html>