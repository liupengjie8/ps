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
		<div class="title title-color"> <img class="title-img" width="48px" style="margin-top: 8px" src="${ctxStatic}/common/img/301.png" > <span class="title-text"> 中国人民解放军总医院（301医院） </span><span class="title-text1" style="margin-left: 1120px;margin-top:15px"></span> </div>
		    <div class="navbar-header text-center">
			<button type="button" class="navbar-toggle" id="showMenu">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

		</div>
        <div class="right_head" style="margin-left: 0px">
			<div class="nav_list">
				<ul>
					<li id="m1" class="active"><a href="${ctx}/standmodular/opeStandModular/gradeReview" target="iframe1">评测概况</a></li>
					<li id="m3"><a  href="/ps/a/ope/manageMission" target="iframe1">评测任务</a></li>
					<li id="m6"><a href="/ps/a/ope/systemControlGradeReview">系统设置</a></li>
				</ul>
				<ul class="nav navbar-nav pull-right navbar-right" style="margin-right: 0px">
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
				<li class="dropdown admin-dropdown" style="margin-left: 300px">
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

	
		</div>
	</nav>


	<!--	 菜单 end	-->
	<aside id="sidebar" style="width: 0px">
	</aside>

	<section id="body-container" class="animation" style="margin-left: 0px">

		
		<!--选项卡  -->
		<div class="main-container" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					
					<div class="J_mainContent" id="content-main"
						style="${cookie.tab.value!=false?'height:calc(100% - 40px)':'height:calc(100%)'}">
						<iframe class="J_iframe" name="iframe1" width="100%" height="100%" src="${ctx}/standmodular/opeStandModular/gradeReview" frameborder="0" data-id="${ctx}/standmodular/opeStandModular/gradeReview" seamless></iframe>
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
	$("#m6").click(function(){ // 为ID为toa的标签绑定click事件
		$("#m6").addClass("active");   
		$("#m1").removeClass("active");   
		$("#m3").removeClass("active");   
		$("#m4").removeClass("active");  
		$("#m5").removeClass("active");  
		$("#m2").removeClass("active");   
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