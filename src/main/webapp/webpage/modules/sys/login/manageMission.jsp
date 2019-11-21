<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ include file="/webpage/include/bootstraptable.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" content="ani"/>
<title>医疗质量安全标准运行监测系统</title>

<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<!-- 引入jeeplus ajax版本库文件，该文件压缩了jQuery，datatime等常用js文件以提高加载速度 -->
	<link rel="stylesheet" href="${ctxStatic}/common/css/vendor.css" />
	<script src="${ctxStatic}/common/js/vendor.js"></script>
	<!-- 引入依赖的第三方插件 -->

<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/app-gradereview.css"/>
<script src="${ctxStatic}/common/js/jquery-1.7.2.min.js"></script>
	<style>
		table {
			font-size: x-small;
		}
	</style>
</head>
<body style="font-size:8px">
<div class="wrap"  style="margin-top: 86px">
	<div class="row">
		<div class="col-md-12" style="width:30%;margin-top: 10px">
			<div class="panel panel-primary">
				<div class="panel-heading" >
					<div class="row" style="float:none">
					<div class="col-md-8">
						<h4><img height="20" width="10" style="margin-left:-10px" src="${ctxStatic}/common/img/sekuai.png"/>检查任务</h4>
					</div>
					<div class="col-md-4" style="  margin-top: 10px;  padding-left: 50;">
						<img height="20" width="20" style="margin-left:-10px" src="${ctxStatic}/common/img/plus.png"/><a>创建任务</a>
					</div>
					</div>
				</div>
				<!--表格内容-->
				<div class="panel-body" style="height: 1323px">
					<table id="midTable"  style="border-collapse:separate; border-spacing:0px 8px;">
						<tr><td class="tdTest"><input type="radio">2019/10/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/09/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/08/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/07/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/06/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/05/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/04/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/03/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/02/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2019/01/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2018/12/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
						<tr><td class="tdTest"><input type="radio">2018/11/20日检查任务 9/12</td><td class="td110"><a>编辑 <b style="color:#FF8989 ">删除</b></a></td></tr>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12" style="width:70%;margin-top: 10px">
			<div class="panel panel-primary">
				<div class="panel-heading" >
					<div class="row" style="float:none">
						<div class="col-md-9">
							<h4><img height="20" width="10" style="margin-left:-10px" src="${ctxStatic}/common/img/sekuai.png"/>任务分工</h4>
						</div>
					</div>
				</div>
				<!--表格内容-->
				<div class="panel-body " >
					<div class="span6">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#all" role="tab" data-toggle="tab">全部任务</a></li>
						<li role="presentation"><a href="#myDistribution" role="tab" data-toggle="tab">我分配的</a></li>
						<li role="presentation"><a href="#myExecute" role="tab" data-toggle="tab">我执行的</a></li>
						<li role="presentation"><a href="#statistics" role="tab" data-toggle="tab">统计分析</a></li>
						<li style="margin-top: 10px"><input type="checkbox"/>只显示人工任务</li>
						<div class="col-md-3" style="  margin-top: 10px;  padding-left: 50;float: right">
							<img height="20" width="20" style="margin-left:-10px" src="${ctxStatic}/common/img/plus.png"/><a>创建任务</a>
						</div>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="all">
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/rgrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/rgrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/zdrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/zdrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
						</div>
						<div role="tabpane1" class="tab-pane " id="myDistribution">
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/rgrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/rgrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/zdrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/zdrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
						</div>
						<div role="tabpane1" class="tab-pane " id="myExecute">
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/rgrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/rgrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/zdrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
							<div class="panel panel-primary" style="height: 300px;margin-left: 10px;margin-top: 10px">
								<div class="panel-body " >
									<h5><img src="${ctxStatic}/common/img/rengong.png">任务名称：急诊流程质量评审&nbsp;&nbsp;&nbsp;|<span style="height: 20px;color: white"><img height="20" width="70" style="margin-left:10px;margin-top:-3px" src="${ctxStatic}/common/img/zdrw.png"/></span></h5>
									<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
										<tr><td class="tdNormal">起始时间：2019/06/14——2019/07/14</td><td class="tdNormal1">分配人：<b style="font-weight: bold">张小龙（院长）</b></td></tr>
										<tr><td class="tdNormal">执行角色：急诊护士长</td><td class="tdNormal1">负责人：<b style="font-weight: bold">刘建设（副院长）</b></td></tr>
										<tr><td class="tdNormal">任务描述：评审急诊流程是否完整</td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:34px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查要求：1.2保障患者诊疗过程中诊疗服务的连续性。<br>3.2按照病情紧急程度，会诊分为急会诊和普通会诊。机构内急会诊应当<br>在会诊请求发出后10分钟内到位，普通会诊应当在会诊发出后24小时内完成</td><td class="tdNormal1"><b style="font-weight: bold">岳云龙（急诊科主任）</b></td></tr>
										<tr><td class="tdNormal"></td><td class="tdNormal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30" width="30" style="margin-left:27px;margin-top:-3px" src="${ctxStatic}/common/img/xjt.png"/></td></tr>
										<tr><td class="tdNormal">检查结果：流程完整，患者满意度高</td><td class="tdNormal1"><b style="font-weight: bold">秦晓晓（急诊科医师）</b></td></tr>
									</table>
								</div>
							</div>
						</div>
						<div role="tabpane1" class="tab-pane " id="statistics">
							<div class="row" style="margin-top: 10px;width: 100%">
								<div class="col-md-12" style="width:50%;">
									<div class="panel panel-primary">
										<!--表格内容-->
										<div class="panel-body" style="height:300px">
											<h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>本期已完成任务</h4>
										</div>
									</div>
								</div>
								<div class="col-md-12" style="width:50%;">
									<div class="panel panel-primary">
										<!--表格内容-->
										<div class="panel-body" style="height:300px">
											<h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>本期未完成任务</h4>
										</div>
									</div>
								</div>
							</div>
							<div class="row" style="width:100%;margin-top: 10px">
								<div class="col-md-12" style="width:100%;">
								<div class="panel panel-primary">
									<!--表格内容-->
									<div class="panel-body" style="height:300px;width:100%">
										<h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>所有任务</h4>
									</div>
								</div>

								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>


$(function(){





		$('#ope').click(function() {
			window.location.href="/ps/a/ope";
		});
		//判断手术服务是否是不合格
		$.ajax({
		    type: "post",
		    url: "/ps/a/getModulesIsQuilified",
		    data: {},
		    dataType: "json",
		    success: function(result){
		    	if(result[0].isQuilified){
		    		$("#opeQulified").attr('src',"${ctxStatic}/common/img/modules/Tips-green.png");
		    	}else{
		    		$("#opeQulified").attr('src',"${ctxStatic}/common/img/modules/Tips-red.png");
		    	}
		    }
		});
});
function logOut(){

}
</script>
</html>
