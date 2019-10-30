<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>字段管理</title>
	<meta name="decorator" content="ani"/>
	<script type="text/javascript">

		$(document).ready(function() {
			jp.ajaxForm("#inputForm",function(data){
				if(data.success){
				    jp.success(data.msg);
					jp.go("${ctx}/opecolumnset/opeColumnSet");
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
				<a class="panelButton" href="${ctx}/opecolumnset/opeColumnSet"><i class="ti-angle-left"></i> 返回</a>
			</h3>
		</div>
		<div class="panel-body">
		<form:form id="inputForm" modelAttribute="opeColumnSet" action="${ctx}/opecolumnset/opeColumnSet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
				<div class="form-group">
					<label class="col-sm-2 control-label">阶段id：</label>
					<div class="col-sm-10">
						<form:input path="stageId" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">来源表：</label>
					<div class="col-sm-10">
						<form:input path="tableName" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">来源字段：</label>
					<div class="col-sm-10">
						<form:input path="columnName" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">字段类型：</label>
					<div class="col-sm-10">
						<form:input path="columnType" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">下拉选项（|隔开）：</label>
					<div class="col-sm-10">
						<form:radiobuttons path="columnSelections" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">是否选入默认查询集合：</label>
					<div class="col-sm-10">
						<sys:gridselect url="${ctx}/opestandstage/opeStandStage/data" id="isDefaultSelected" name="isDefaultSelected" value="${opeColumnSet.isDefaultSelected}" labelName="" labelValue="${opeColumnSet.isDefaultSelected}"
							 title="选择是否选入默认查询集合" cssClass="form-control " fieldLabels="阶段" fieldKeys="stageName" searchLabels="阶段" searchKeys="stageName" ></sys:gridselect>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">是否有效：</label>
					<div class="col-sm-10">
						<form:input path="isActive" htmlEscape="false"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">阶段：</label>
					<div class="col-sm-10">
						<form:input path="stageName" htmlEscape="false"    class="form-control "/>
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