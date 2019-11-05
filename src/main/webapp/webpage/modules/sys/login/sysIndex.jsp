<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>${fns:getConfig('productName')}</title>
<meta name="decorator" content="ani" />
<script src="${ctxStatic}/plugin/js-menu/contabs.js"></script>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<title>${fns:getConfig('productName')}</title>
	<meta name="decorator" content="ani"/>
	<link href="${ctxStatic}/common/css/jp-menu.css" rel="stylesheet" />
    <link  rel="stylesheet" href="${ctxStatic}/common/css/flowcharts/tree.css"/>
	<script src="${ctxStatic}/plugin/js-menu/contabs.js"></script>
	<script src="${ctxStatic}/common/js/flowcharts/vue.js"></script>
	<link id="theme-tab" href="${ctxStatic}/plugin/js-menu/menuTab-${cookie.theme.value==null?'blue':cookie.theme.value}.css" rel="stylesheet" />
</head>

<body class="">
	<nav class="navbar topnav-navbar navbar-fixed-top" role="navigation">
			<div class="title title-color"> <img class="title-img" src="${ctxStatic}/common/img/modules/title_icon.svg" > <span class="title-text"> 医疗质量安全标准运行监测系统 </span> </div>
		    <div class="navbar-header text-center">
			<button type="button" class="navbar-toggle" id="showMenu">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

		</div>
        <div class="right_head">
			<div class="nav_list">
				<ul>
					<li id="m1"><a href="/ps/a/ope">首页</a></li>
					<li id="m2" class="active"><a href="/ps/a/monitor/monitor/monitor" target="iframe0">运行监测</a></li>
					<li id="m3"><a  href="/ps/a/unaccomplished/unaccomplished/unaccomplished" target="iframe0">监测报告</a></li>
					<li id="m4"><a href="patientDetail" target="iframe1">个案查询</a></li>
					<li id="m5"><a  href="/ps/a/unaccomplished/unaccomplished/unaccomplished" target="iframe0">运行报告</a></li>
					<li id="m6"><a href="systemControl">系统设置</a></li>
				</ul>
				<ul class="nav navbar-nav pull-right navbar-right">
				<!-- <li class="dropdown color-picker">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<span><i class="fa fa-circle"></i></span>
					</a>
					<ul class="dropdown-menu pull-right animated fadeIn" role="menu">
						<li class="padder-h-xs">
							<table class="table color-swatches-table text-center no-m-b">
								<tr>
									<td class="text-center colorr">
										<a href="#" data-theme="blue" class="theme-picker">
											<i class="fa fa-circle blue-base"></i>
										</a>
									</td>
									<td class="text-center colorr">
										<a href="#" data-theme="green" class="theme-picker">
											<i class="fa fa-circle green-base"></i>
										</a>
									</td>
									<td class="text-center colorr">
										<a href="#" data-theme="default" class="theme-picker">
											<i class="fa fa-circle default-base"></i>
										</a>
									</td>
								</tr>
							</table>
						</li>
					</ul>
				</li> -->
				<li class="dropdown admin-dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<img src="<c:if test="${fns:getUser().photo == null || fns:getUser().photo==''}">${ctxStatic}/common/images/flat-avatar.png</c:if> <c:if test="${fns:getUser().photo != null && fns:getUser().photo!=''}">${fns:getUser().photo}</c:if>" class="topnav-img" alt=""><span class="hidden-sm">${fns:getUser().name}</span>
					</a>
					<ul class="dropdown-menu animated fadeIn" role="menu">
						  <li><a class="J_menuItem" href="${ctx}/sys/user/imageEdit">修改头像</a>
                          </li>
                          <li><a class="J_menuItem" href="${ctx }/sys/user/info">个人资料</a>
                          </li>
                          <li><a href="${ctx}/logout">安全退出</a>
                          </li>
					</ul>
				</li>
			</ul>
			
			</div>
			<div class="title_box ">
				<h2 class="page_title"> 手术服务标准运行监测</h2>
				<div class="ico_list">
					<ul>
						<a href='/ps/a/flowchart/flowChart/flowChart' target="iframe0" title="流程图"><li class="ico"></li></a>
						<a href='/ps/a/indexForm/indexForm/indexForm' target="iframe0" title="指标报表"><li class="ico1"></li>
						<a href='/ps/a//monitor/monitor/monitor' target="iframe0" title="运行监测"><li class="ico2"></li>
						<a href='/ps/a/operadar/operadar/operadar' target="iframe0" title="雷达图"><li class="ico3"></li>
						<a href='/ps/a/opebarchart/opeBarChart/opeBarChart' target="iframe0" title="柱状图"><li class="ico4"></li>
						
					</ul>
				</div>
			</div>
	
		</div>
	</nav>
	<aside id="sidebar"><a href="/ps/a/opebarchart/opeBarChart/opeBarChart" target="iframe0">
			</a><div class="side-widgets"><a href="/ps/a/opebarchart/opeBarChart/opeBarChart" target="iframe0">
				</a><div class="widgets-content"><a href="/ps/a/opebarchart/opeBarChart/opeBarChart" target="iframe0">
					</a><div class="menu"><a href="/ps/a/opebarchart/opeBarChart/opeBarChart" target="iframe0">
						</a><div class="menu-body"><a href="/ps/a/opebarchart/opeBarChart/opeBarChart" target="iframe0">
							</a><ul class="nav nav-pills nav-stacked sidenav" id="1"><a href="/ps/a/opebarchart/opeBarChart/opeBarChart" target="iframe0">
								</a><li class="panel"><a href="/ps/a/opebarchart/opeBarChart/opeBarChart" target="iframe0">
</a><a data-toggle="collapse" data-parent="#1" class="" href="#4cbb0aff499044aba652b5f3d9c96a46" aria-expanded="true"><i class="fa null"></i>&nbsp;&nbsp;术前<span class="pull-right fa fa-angle-toggle"></span></a>
<ul id="4cbb0aff499044aba652b5f3d9c96a46" class="nav collapse in" aria-expanded="true" style="">
<li class="panel">
<a data-toggle="collapse" data-parent="#4cbb0aff499044aba652b5f3d9c96a46" class="" href="#b4e95f3f9fc94c2aa6a8bf9ffa02354b" aria-expanded="true"><i class="fa null"></i>&nbsp;&nbsp;手术评估<span class="pull-right fa fa-angle-toggle"></span></a>
<ul id="b4e95f3f9fc94c2aa6a8bf9ffa02354b" class="nav collapse in" aria-expanded="true" style="">
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=适应证评估" ><i class="fa null"></i>&nbsp;&nbsp;适应证评估</a></li>
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=等级评估" ><i class="fa null"></i>&nbsp;&nbsp;等级评估</a></li>
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=风险评估" ><i class="fa null"></i>&nbsp;&nbsp;风险评估</a></li>
</ul>
</li>
<li class="panel">
<a data-toggle="collapse" data-parent="#4cbb0aff499044aba652b5f3d9c96a46" class="collapsed" href="#763e3bb87f8245b0a711d487c6d837fd" aria-expanded="false"><i class="fa null"></i>&nbsp;&nbsp;手术安排<span class="pull-right fa fa-angle-toggle"></span></a>
<ul id="763e3bb87f8245b0a711d487c6d837fd" class="nav collapse" aria-expanded="false">
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=术前讨论" ><i class="fa null"></i>&nbsp;&nbsp;术前讨论</a></li>
<li><a target="iframe0"  class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=知情同意" ><i class="fa null"></i>&nbsp;&nbsp;知情同意</a></li>
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=手术审批" ><i class="fa null"></i>&nbsp;&nbsp;手术安排</a></li>
</ul>
</li>
<li class="panel">
<a data-toggle="collapse" data-parent="#4cbb0aff499044aba652b5f3d9c96a46" class="collapsed" href="#af8d38d3462b4d7bb2da69771662f2c5" aria-expanded="false"><i class="fa null"></i>&nbsp;&nbsp;术前准备<span class="pull-right fa fa-angle-toggle"></span></a>
<ul id="af8d38d3462b4d7bb2da69771662f2c5" class="nav collapse" aria-expanded="false">
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=术前访视" ><i class="fa null"></i>&nbsp;&nbsp;术前访视</a></li>
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=术前医嘱" ><i class="fa null"></i>&nbsp;&nbsp;术前医嘱</a></li>
<li><a target="iframe0" class="J_menuItem1" href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&amp;nodeName=器械准备" ><i class="fa null"></i>&nbsp;&nbsp;器械准备</a></li>
</ul>
</li>
</ul>
</li>
<li class="panel">
<a data-toggle="collapse" data-parent="#1" class="collapsed" href="#b3fc22077a814c5480750b29cbb18cda" aria-expanded="false"><i class="fa null"></i>&nbsp;&nbsp;术中<span class="pull-right fa fa-angle-toggle"></span></a>
<ul id="b3fc22077a814c5480750b29cbb18cda" class="nav collapse" aria-expanded="false" style="height: 0px;">
</ul>
</li>
<li class="panel">
<a data-toggle="collapse" data-parent="#1" class="collapsed" href="#2f21ac5f49564b1580ca60afd8ebe6b1" aria-expanded="false"><i class="fa null"></i>&nbsp;&nbsp;术后<span class="pull-right fa fa-angle-toggle"></span></a>
<ul id="2f21ac5f49564b1580ca60afd8ebe6b1" class="nav collapse" aria-expanded="false">
</ul>
</li>

</ul>
</li>

							</ul>
						</div>
					</div>
				</div>
			</div>
	</aside>

	<!--	 菜单 end	-->
	

	<section id="body-container" class="animation">

		
		<!--选项卡  -->
		<div class="main-container" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					
					<div class="J_mainContent" id="content-main"
						style="${cookie.tab.value!=false?'height:calc(100% - 40px)':'height:calc(100%)'}">
						<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/monitor/monitor/monitor" frameborder="0" data-id="${ctx}/monitor/monitor/monitor" seamless></iframe>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>

		
$(function(){
	$("#m4").click(function(){ // 为ID为toa的标签绑定click事件
		$("#m4").addClass("active");   
		$("#m1").removeClass("active");   
		$("#m3").removeClass("active");   
		$("#m2").removeClass("active");  
		$("#m5").removeClass("active");  
		$("#m6").removeClass("active");  
	});
	$("#m2").click(function(){ // 为ID为toa的标签绑定click事件
		$("#m2").addClass("active");   
		$("#m1").removeClass("active");   
		$("#m3").removeClass("active");   
		$("#m4").removeClass("active");  
		$("#m5").removeClass("active");  
		$("#m6").removeClass("active");   
	});
	$("#m3").click(function(){ // 为ID为toa的标签绑定click事件
		$("#m3").addClass("active");   
		$("#m1").removeClass("active");   
		$("#m2").removeClass("active");   
		$("#m4").removeClass("active");  
		$("#m5").removeClass("active");  
		$("#m6").removeClass("active");   
	});
	$("#m5").click(function(){ // 为ID为toa的标签绑定click事件
		$("#m5").addClass("active");   
		$("#m1").removeClass("active");   
		$("#m3").removeClass("active");   
		$("#m4").removeClass("active");  
		$("#m2").removeClass("active");  
		$("#m6").removeClass("active");   
	});
	$("#m6").click(function(){ // 为ID为toa的标签绑定click事件
		$("#m6").addClass("active");   
		$("#m1").removeClass("active");   
		$("#m3").removeClass("active");   
		$("#m4").removeClass("active");  
		$("#m5").removeClass("active");  
		$("#m2").removeClass("active");   
	});
		$('.theme-picker').click(function() {
			changeTheme($(this).attr('data-theme'));
		});
		$('#showMenu').click(function() {
		    $('body').toggleClass('push-right');
		});
    $('#hideMenu').click(function () {
           $('body').removeClass('push-right')
        $('body').toggleClass('push-left');
    });
		$("#switchTab").change(function(){
			if($("#switchTab").is(':checked')){
				 $("#breadcrumbs").attr("class","breadcrumbs");
				 $("#content-main").css("height","calc(100% - 40px)")
				 $.get('${ctx}/tab/true?url='+window.top.location.href,function(result){  });
			}else{
				 $("#breadcrumbs").attr("class","un-breadcrumbs");
				 $("#content-main").css("height","calc(100%)")
				 $.get('${ctx}/tab/false?url='+window.top.location.href,function(result){  });
			}
		})
		

});
/**
 *切换主题
 */
function changeStyle(){
    $.get('${ctx}/style/jp?url='+window.top.location.href,function(result){
        window.location.reload();
    });
}
/**
 * 切换颜色
 * @param theme
 */
function changeTheme(theme) {
	var link = $('<link>')
	.appendTo('head')
	.attr({type : 'text/css', rel : 'stylesheet'})
	.attr('href', '${ctxStatic}/common/css/app-'+theme+'.css');


	var tabLink = $('<link>')
	.appendTo('head')
	.attr({type : 'text/css', rel : 'stylesheet'})
	.attr('href', '${ctxStatic}/plugin/js-menu/menuTab-'+theme+'.css');

	var childrenLink= $('<link>').appendTo($(".J_iframe").contents().find("head"))
	.attr({type : 'text/css', rel : 'stylesheet'})
	.attr('href', '${ctxStatic}/common/css/app-'+theme+'.css');

	 $.get('${ctx}/theme/'+theme+'?url='+window.top.location.href,function(result){
         setTimeout(function () {
             $('#theme').remove();
             $('#theme-tab').remove();
             $(".J_iframe").contents().find("#theme").remove();
         }, 500);
		 link.attr("id","theme");
		 childrenLink.attr("id","theme");
		 tabLink.attr("id","theme-tab")
	 });
		
}
</script>

</body>
</html>