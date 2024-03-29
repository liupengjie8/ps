<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>

<head>
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
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/reset.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/color.css"/>
	<%-- <%@ include file="/webpage/include/systemInfoSocket-init.jsp"%>
	<%@ include file="/webpage/include/layIM-init.jsp"%> --%>
<style>
	.push-right #sidebar-nav{
	  display:block;
	}
	.navbar-inverse .navbar-toggle:hover, .navbar-inverse .navbar-toggle:focus {
		 background-color: transparent !important;
	}
	.navbar-inverse .navbar-toggle {
		 border-color: transparent !important;
	}
</style>

</head>

<body class="${cookie.white.value}  jp-hr">
<nav class="navbar navbar-inverse display-default opnav-navbar navbar-fixed-top" role="navigation">
	<div class="title title-color"> <img class="title-img" src="${ctxStatic}/common/img/modules/title_icon.svg" > <span class="title-text"> 医疗质量安全标准运行监测系统 </span> </div>
	<div class="topnav-navbar">
		<div class="navbar-header text-center">
			<button type="button" class="navbar-toggle" id="showMenu">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<a class="navbar-brand J_menuItem" href="${ctx}/monitor/monitor/monitor" data-index="0">手术服务</a>
		</div>
	</div>
	<div class="navbar-container container-fluid">
		<div class="collapse navbar-collapse navbar-collapse-toolbar row" id="jpMenu">
			<ul id="o1" class="nav navbar-toolbar nav-tabs  navbar-left" style="width: calc( 100% - 680px)" role="tablist">
			<t:jpMenu  menu="${fns:getTopMenu()}" position="top"></t:jpMenu>
		</ul>
		<ul class="nav navbar-nav pull-right navbar-right">
				<li>
					<a href="${ctx}/home"  class="J_menuItem"><i class="fa fa-home" style="font-size:14px;"></i></a>
				</li>
				<%-- <li class="hidden-xs">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-language"></i></a>
					<ul class="dropdown-menu">
						<li class="${cookie.tab.value!=false?'active':''}">
							<a id="showTab" href="#">开启tab</a>
						</li>
						<li class="${cookie.tab.value==false?'active':''}">
							<a id="closeTab" href="#">关闭tab</a>
						</li>
					</ul>
				</li> --%>
<%-- 
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-envelope-o"></i>
						<span class="label label-info">${noReadCount }</span>
					</a>
					<ul class="dropdown-menu animated fadeIn">
						<li class="messages-top text-center">
							你有  ${noReadCount} 封未读邮件.
						</li>

						<c:forEach items="${mailPage.list}" var="mailBox">

							<li class="dropdown-messages">
								<a class="J_menuItem" title="站内信" href="${ctx}/iim/mailBox/detail?id=${mailBox.id}">

									<div class="message-sender">
											${mailBox.sender.name }<small class="pull-right">${fns:getTime(mailBox.sendtime)}前</small>
									</div>
									<div class="message-header">
											${mailBox.mail.overview} <small class="pull-right">
										<fmt:formatDate value="${mailBox.sendtime}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
									</div>

								</a>
							</li>

						</c:forEach>
						<li class=" text-center">
							<a class="J_menuItem" href="${ctx}/iim/mailBox/list?orderBy=sendtime desc">
								<font color='gray'> <i class="fa fa-envelope"></i>  查看所有邮件</font>
							</a>
						</li>
					</ul>
				</li> --%>
			<%-- 	<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-bell-o"></i>
						<span class="label label-info">${count }</span>
					</a>
					<ul class="dropdown-menu animated fadeIn">
						<li class="messages-top text-center">
							你有 ${count } 条新通知.
						</li>
						<c:forEach items="${page.list}" var="oaNotify">
							<li class="dropdown-notifications">
								<a class="J_menuItem" href="${ctx}/oa/oaNotify/form?id=${oaNotify.id}&isSelf=true">
									<div class="notification">
										<i class="fa fa-bell-o"></i> ${fns:abbr(oaNotify.title,50)}
										<span class="pull-right text-muted small">${fns:getTime(oaNotify.updateDate)}前</span>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</li> --%>

		<!-- 		<li class="dropdown color-picker">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<span><i class="fa fa-gears"></i></span>
					</a>
					<ul class="dropdown-menu pull-right animated fadeIn" role="menu" style="width:250px; padding-left: 10px;">
						<li class="padder-h-xs">

							<div class="theme-icons">
								<label data-theme="white_blue" class="ng-star-inserted" style="background:#3ca2e0;">
									<div class="areas">
										<span class="nav" style="background: rgb(255, 255, 255);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="white_green" class="ng-star-inserted" style="background: #27ae60;">
									<div class="areas">
										<span class="nav" style="background: rgb(255, 255, 255);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>

								</label>
								<label data-theme="white_red" class="ng-star-inserted" style="background:  #D24D57;">
									<div class="areas">
										<span class="nav" style="background: rgb(255, 255, 255);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="white_purple" class="ng-star-inserted" style="background:  #957BBD;">
									<div class="areas">
										<span class="nav" style="background: rgb(255, 255, 255);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="white_midnight-blue" class="ng-star-inserted" style="background:  #2c3e50;">
									<div class="areas">
										<span class="nav" style="background: rgb(255, 255, 255);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="white_lynch" class="ng-star-inserted" style="background: #6C7A89;">
									<div class="areas">
										<span class="nav" style="background: rgb(255, 255, 255);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>


								-黑色主题
								<label data-theme="black_blue" class="ng-star-inserted" style="background:#3ca2e0;">
									<div class="areas">
										<span class="nav" style="background: rgb(64, 64, 64);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="black_green" class="ng-star-inserted" style="background: #27ae60;">
									<div class="areas">
										<span class="nav" style="background: rgb(64, 64, 64);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>

								</label>
								<label data-theme="black_red" class="ng-star-inserted" style="background:  #D24D57;">
									<div class="areas">
										<span class="nav" style="background: rgb(64, 64, 64);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="black_purple" class="ng-star-inserted" style="background:  #957BBD;">
									<div class="areas">
										<span class="nav" style="background: rgb(64, 64, 64);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="black_midnight-blue" class="ng-star-inserted" style="background:  #2c3e50;">
									<div class="areas">
										<span class="nav" style="background: rgb(64, 64, 64);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>
								<label data-theme="black_lynch" class="ng-star-inserted" style="background: #6C7A89;">
									<div class="areas">
										<span class="nav" style="background: rgb(64, 64, 64);"></span>
										<span class="con" style="background: rgb(245, 247, 250);"></span>
									</div>
								</label>


							</div>
						</li>
					</ul>
				</li> -->
				
				<li class="dropdown color-picker">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<span><i class="fa fa-gears"></i></span>
					</a>
					<ul class="dropdown-menu pull-right animated fadeIn" role="menu" style="width:250px; padding-left: 10px;">
						<li class="padder-h-xs">

							<div class="theme-icons">
							
								
								<!---默认主题-->
								<label data-theme="white_blue" class="ng-star-inserted" style="background:#3ca2e0;">
									<div class="areas">
										<span class="nav" style="background: rgb(0,58,140);"></span>
										<span class="con" style="background: rgb(0,58,140);"></span>
									</div>
								</label>
								

							</div>
						</li>
					</ul>
				</li>
				
				<li class="hidden-xs">
					<a href="#" onClick="toggleFullScreen()" data-toggle="fullscreen"><i class="fa fa-arrows-alt"></i></a>
				</li>


				<li class="dropdown admin-dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<img src="<c:if test="${fns:getUser().photo == null || fns:getUser().photo==''}">${ctxStatic}/common/images/flat-avatar.png</c:if> <c:if test="${fns:getUser().photo != null && fns:getUser().photo!=''}">${fns:getUser().photo}</c:if>" class="topnav-img" style="    width: 30px;
    margin-right: 5px;
    max-height: 30px;" alt=""><span class="hidden-sm">${fns:getUser().name}</span>
					</a>
					<ul class="dropdown-menu animated fadeIn"  role="menu">
						<li><a class="J_menuItem" href="${ctx}/sys/user/imageEdit">修改头像</a>
						</li>
						<li><a class="J_menuItem" href="${ctx }/sys/user/info">个人资料</a>
						</li>
						<li><a class="J_menuItem" href="${ctx }/iim/contact/index">我的通讯录</a>
						</li>
						<li><a class="J_menuItem" href="${ctx }/iim/mailBox/list">信箱</a>
						</li>
						<li><a href="javaScript:changeStyle()">切换成左侧菜单</a>
						<li><a href="${ctx}/logout">安全退出</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<ul class="nav navbar-nav pull-right hidd">
		<li class="dropdown admin-dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
				<img src="<c:if test="${fns:getUser().photo == null || fns:getUser().photo==''}">${ctxStatic}/common/images/flat-avatar.png</c:if> <c:if test="${fns:getUser().photo != null && fns:getUser().photo!=''}">${fns:getUser().photo}</c:if>" class="topnav-img" style="    width: 30px;
    margin-right: 5px;
    max-height: 30px;" alt=""><span class="hidden-sm">${fns:getUser().name}</span>
			</a>

			<ul class="dropdown-menu animated fadeIn"  role="menu">
				<t:jpMenu  menu="${fns:getTopMenu()}" position="top"></t:jpMenu>
				<hr/>
				<li><a href="javaScript:changeStyle()">切换成左侧菜单</a>
				<li><a href="${ctx}/logout">安全退出</a>
				</li>
			</ul>
		</li>
	</ul>

</nav>

<aside id="sidebar">
	<div class="tab-content">
				<div id="page-wrapper"> <!--class="nav-small"-->
						<div id="nav-col" class="nav-col">
							<section id="col-left" class="nano">
								<div id="col-left-inner" class="nano-content">
									<%-- <div id="user-left-box" class="clearfix hidden-sm hidden-xs">
										<a  href="#"><img  src="<c:if test="${fns:getUser().photo == null || fns:getUser().photo==''}">${ctxStatic}/common/images/flat-avatar.png</c:if> <c:if test="${fns:getUser().photo != null && fns:getUser().photo!=''}">${fns:getUser().photo}</c:if>" /></a>
										<div class="user-box">
											<span class="name">
											${fns:getUser().name}
											</span>
											<a id="user-link" href="#" class="dropdown-toggle">
												<font>${fns:getUser().roleNames}<b class="caret"></b></font>
											</a>
										</div>



									</div> --%>
									<div class="collapse navbar-collapse navbar-ex1-collapse tab-content" id="sidebar-nav">
										<ul class="nav nav-pills nav-stacked">
											<li>
												<ul id="user-menu" class="submenu">
													<li><a class="J_menuItem" href="${ctx}/sys/user/imageEdit">修改头像</a>
													</li>
													<li><a class="J_menuItem" href="${ctx }/sys/user/info">个人资料</a>
													</li>
													<li><a class="J_menuItem" href="${ctx }/iim/contact/index">我的通讯录</a>
													</li>
													<li><a class="J_menuItem" href="${ctx }/iim/mailBox/list">信箱</a>
													</li>
													<li><a href="javaScript:changeStyle()">切换成左侧菜单</a>
													</li>
													<li><a href="${ctx}/logout">安全退出</a>
													</li>
												</ul>
											</li>
										</ul>
										<t:jpMenu  menu="${fns:getTopMenu()}" position="left"></t:jpMenu>
									</div>
								</div>
							</section>
						</div>
				</div>

	</div>

</aside>
<section id="body-container" class="animation">


	<!--选项卡  -->
	<div class="main-container" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div id="breadcrumbs" class="${cookie.tab.value!=false?'breadcrumbs':'un-breadcrumbs'}">
					<div class="content-tabs">
						<a id="hideMenu" class="roll-nav roll-left-0 J_tabLeft"><i class="fa fa-align-justify"></i>
						</a>
						<button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
						</button>
						<nav class="page-tabs J_menuTabs">
							<div class="page-tabs-content">
								<a href="javascript:;" class="active J_menuTab" data-id="${ctx}/monitor/monitor/monitor">首页</a>
							</div>
						</nav>
						<button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
						</button>
						<a href="${ctx}/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
					</div>
				</div>

				<div class="J_mainContent"  id="content-main" style="${cookie.tab.value!=false?'height:calc(100% - 40px)':'height:calc(100%)'}">
					<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/monitor/monitor/monitor" frameborder="0" data-id="${ctx}/monitor/monitor/monitor" seamless></iframe>
				</div>
			</div>


		</div>
	</div>

	<div class="footer">
		<div class="pull-left"><a href="http://www.jeeplus.org">http://www.jeeplus.org</a> &copy; 2015-2025</div>
	</div>

</section>




<script>


    $(function(){
        $.addtabs.drop();
        $('#showMenu').click(function() {
            $('body').toggleClass('push-right');
        });
        $('#hideMenu').click(function () {
			$('#page-wrapper').toggleClass('nav-small');
            $('#col-left').toggleClass('nano');
            $('body').removeClass('push-right')
            $('body').toggleClass('push-left');
        });

        $('#showTab').click(function () {
            $('#showTab').parent().toggleClass("active")
            $('#closeTab').parent().toggleClass("active")
            $("#breadcrumbs").attr("class","breadcrumbs");
            $("#content-main").css("height","calc(100% - 40px)")
            $.get('${ctx}/tab/true?url='+window.top.location.href,function(result){  });
        });

        $('#closeTab').click(function () {
            $('#showTab').parent().toggleClass("active")
            $('#closeTab').parent().toggleClass("active")
            $("#breadcrumbs").attr("class","un-breadcrumbs");
            $("#content-main").css("height","calc(100%)")
            $.get('${ctx}/tab/false',function(result){  });
        });

        $(".theme-icons label").click(function () {
            $("#theme-font").remove();
            $(this).append('<i id="theme-font" class=" anticon anticon-check ng-star-inserted fa fa-check "></i>');
            changeTheme($(this).attr('data-theme'));
        })

    });
    /**
     *切换主题
     */
    function changeStyle(){
        $.get('${ctx}/style/default',function(result){
            window.location.reload();
        });
    }
    /**
     * 切换颜色
     * @param theme
     */
    function changeTheme(style_theme) {
    	
        var style = style_theme.split("_")[0];
        var theme = style_theme.split("_")[1];
        alert(style_theme)
        if(style == "black"){
        	 $("body").addClass("theme-whbl");
		}else{
			 $("body").removeClass("theme-whbl");
		}
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

        $.get('${ctx}/theme/'+style_theme,function(result){
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
    $(function ($) {
        $('#sidebar-nav  a').on('click', function (e) {
			  var _this = $(this);
             $('#sidebar-nav  a').each(function(){
                 if($(this) != _this){
                     if($(this).hasClass("active")){
                         $(this).removeClass("active");
					 }
				 }

             });
             if(!_this.hasClass("active")){
                 _this.addClass("active")
                 _this.parent("li.open").find("a").first().addClass("active");
			 }


        });
        $('#sidebar-nav .dropdown-toggle').on('click', function (e) {
            e.preventDefault();
            var $item = $(this).parent();
            if (!$item.hasClass('open')) {
                $item.parent().find('.open .submenu').slideUp('fast');
                $item.parent().find('.open').toggleClass('open');
            }
            $item.toggleClass('open');
            if ($item.hasClass('open')) {
                $item.children('.submenu').slideDown('fast');
            }
            else {
                $item.children('.submenu').slideUp('fast');
            }
            if ($("#user-menu").parent().hasClass('open')) {
                $("#user-menu").slideUp('fast');
                $("#user-menu").parent().toggleClass('open');
            }
        });
        $('#user-link').on('click',function () {
            var $item = $("#user-menu");
            $item.parent().toggleClass('open');
            if ($item.parent().hasClass('open')) {
                $item.slideDown('fast');
            }
            else {
                $item.slideUp('fast');
            }
			$("#sidebar-nav .tab-pane").find('.open .submenu').slideUp('fast');
			$("#sidebar-nav .tab-pane").find('.open').toggleClass('open');


        })
        $('body').on('mouseenter', '#page-wrapper.nav-small #sidebar-nav .dropdown-toggle', function (e) {
            var $sidebar = $(this).parents('#sidebar-nav');
            if ($(document).width() >= 992) {
                var $item = $(this).parent();
                $item.addClass('open');
                $item.children('.submenu').slideDown('fast');
            }
        });
        $('body').on('mouseleave', '#page-wrapper.nav-small #sidebar-nav > div > .nav-pills > li', function (e) {
            var $sidebar = $(this).parents('#sidebar-nav');
            if ($(document).width() >= 992) {
                var $item = $(this);
                if ($item.hasClass('open')) {
                    $item.find('.open .submenu').slideUp('fast');
                    $item.find('.open').removeClass('open');
                    $item.children('.submenu').slideUp('fast');
                }
                $item.removeClass('open');
            }
        });


    });


</script>
</body>
</html>