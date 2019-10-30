<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>标准流程管理</title>
	<meta name="decorator" content="ani"/>
	<script type="text/javascript">

		$(document).ready(function() {
			jp.ajaxForm("#inputForm",function(data){
				if(data.success){
				    jp.success(data.msg);
					jp.go("${ctx}/flowcharttable/opeFlowChartTable");
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
				<a class="panelButton" href="${ctx}/flowcharttable/opeFlowChartTable"><i class="ti-angle-left"></i> 返回</a>
			</h3>
		</div>
		<div class="panel-body">
		<form:form id="inputForm" modelAttribute="opeFlowChartTable" action="${ctx}/flowcharttable/opeFlowChartTable/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
				<div class="form-group">
					<label class="col-sm-2 control-label">模块：</label>
					<div class="col-sm-10">
						<sys:gridselect url="${ctx}/standmodular/opeStandModular/data" id="opeStandModular" name="opeStandModular.id" value="${opeFlowChartTable.opeStandModular.id}" labelName="opeStandModular.modularName" labelValue="${opeFlowChartTable.opeStandModular.modularName}"
							 title="选择模块" cssClass="form-control " fieldLabels="模块|备注" fieldKeys="modularName|remarks" searchLabels="模块|备注" searchKeys="modularName|remarks" ></sys:gridselect>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">流程页名称：</label>
					<div class="col-sm-10">
						<form:input path="pageName" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">流程页：</label>
					<div class="col-sm-10">
						<form:input path="pageId" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">流程：</label>
					<div class="col-sm-10">
						<form:input path="text" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">下一级流程页：</label>
					<div class="col-sm-10">
						<form:input path="nextLowLevel" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">行：</label>
					<div class="col-sm-10">
						<form:input path="row" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">列：</label>
					<div class="col-sm-10">
						<form:input path="col" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">岗位：</label>
					<div class="col-sm-10">
						<form:input path="title" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">标准信息：</label>
					<div class="col-sm-10">
						<form:input path="description" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">状态：</label>
					<div class="col-sm-10">
						<form:input path="status" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">文档下载链接：</label>
					<div class="col-sm-10">
						<form:input path="documentUrl" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">流程id：</label>
					<div class="col-sm-10">
						<form:input path="chartId" htmlEscape="false"    class="form-control "/>
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