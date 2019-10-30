<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!-- _login_page_ --><!--登录超时标记 勿删-->
<html>

	<head>
	<meta name="decorator" content="ani"/>
		<title>${fns:getConfig('productName')} 登录</title>
		<script>
			if (window.top !== window.self) {
				window.top.location = window.location;
			}
		</script>
		<script type="text/javascript">
				$(document).ready(function() {
					$("#loginForm").validate({
						rules: {
							validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
						},
						messages: {
							username: {required: "请填写用户名."},password: {required: "请填写密码."},
							validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
						},
						errorLabelContainer: "#messageBox",
						errorPlacement: function(error, element) {
							error.appendTo($("#loginError").parent());
						} 
					});
				});
				// 如果在框架或在对话框中，则弹出提示并跳转到首页
				if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0){
					alert('未登录或登录超时。请重新登录，谢谢！');
					top.location = "${ctx}";
				}
		</script>
	
	</head>

	
	<body id="" class="" style="">
		

		<div class="login-page">
		<div class="row">
					<h1 style=" width: 40%; margin: 5% auto 30px"><img width="100%" src="${ctxStatic}/common/images/login_h1.png" /></h1>
			<div class="col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
				<!-- <img class="img-circle" src="./JeePlus 快速开发平台 登录_files/flat-avatar.png"> -->
			
				




<!-- 0:隐藏tip, 1隐藏box,不设置显示全部 -->



				<form id="loginForm" role="form" action="${ctx}/login" method="post" novalidate>
					<div class="form-content">
						<div class="form-group">
							<i class="icon-account"></i>
							<input type="text"  id="username" name="username" class="form-control input-underline input-lg required " value="admin" placeholder="用户名" aria-required="true">
						</div>

						<div class="form-group">
							<i class="icon-password"></i>
							<input type="password" id="password" name="password" value="admin" class="form-control input-underline input-lg required" placeholder="密码" aria-required="true">
						</div>
						
						
						
						<div class="form-group">
							<i class="icon-class-selection"></i>
							<select id="standType" name="standType" class="form-control input-underline input-lg">
							  <option value ="团体标准" selected>团体标准</option>
							  <option value ="三级评审标准（2018版）">三级评审标准（2018版）</option>
							  <option value="JCI">JCI</option>
							</select>
						</div>
						
							
						<label class="inline">
								<input type="checkbox" id="rememberMe" name="rememberMe" class="ace">
								<span class="lbl"> 自动登录 </span>
						</label>
						<input type="submit" class="btn btn-white btn-outline btn-lg btn-rounded progress-login" value="登录">
					</div>
					&nbsp;
				</form>
			</div>			
		</div>
	</div>
	
	<script>

		
$(function(){
		$('.theme-picker').click(function() {
			changeTheme($(this).attr('data-theme'));
		}); 	
	
});

function changeTheme(theme) {
	$('<link>')
	.appendTo('head')
	.attr({type : 'text/css', rel : 'stylesheet'})
	.attr('href', '${ctxStatic}/common/css/app-'+theme+'.css');
	//$.get('api/change-theme?theme='+theme);
	 $.get('${pageContext.request.contextPath}/theme/'+theme+'?url='+window.top.location.href,function(result){  });
}
</script>
<style>
li.color-picker i {
    font-size: 24px;
    line-height: 30px;
}
.red-base {
    color: #D24D57;
}
.blue-base {
    color: #3CA2E0;
}
.green-base {
    color: #27ae60;
}
.purple-base {
    color: #957BBD;
}
.midnight-blue-base {
    color: #2c3e50;
}
.lynch-base {
    color: #6C7A89;
}
</style>
</body>
</html>