<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<meta charset="utf-8" />
<title>医疗质量安全标准运行监测系统</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/reset.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/color.css"/>
<script src="${ctxStatic}/common/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div class="wrap">
	<div class="title title-color"> <img class="title-img" src="${ctxStatic}/common/img/modules/title_icon.svg" > <span class="title-text"> 医院流程标准化管理平台 </span> </div>
		<div class="nav_list">
			<ul>
				<li ><a href="/ps/a/ope">首页</a></li>
				<li ><a href="ope/systemManage">运行监测</a></li>
				<li><a href="ope/unaccomplishedjc">监测报告</a></li>
				<li><a href="ope/patientDetail">个案查询</a></li>
				<li><a href="ope/unaccomplishedyx">运行报告</a></li>
				<li><a href="ope/systemControl">系统设置</a></li>
			</ul>
		</div>
	<div class="index_box">
		<h2>手术服务监测</h2>
	</div>
</div>
</body>
<script>
$(function(){
		$('#ope').click(function() {
			window.location.href="a/ope";
		});
		//判断手术服务是否是不合格
})
</script>
</html>
