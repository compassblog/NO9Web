<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-有点</title>
<link rel="stylesheet" type="text/css" href="css/public.css" />
<link rel="stylesheet" type="text/css" href="css/page.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body>

	<!-- 登录页面头部 -->
	<div class="logHead">
		<img src="img/logLOGO.png" />
	</div>
	<!-- 登录页面头部结束 -->

	<!-- 登录body -->
	<form action="/P2P/login/logCon.do" method="post">
	
	
		<div class="logDiv">
			<img class="logBanner" src="img/logBanner.png" />
			<div class="logGet">
				<!-- 头部提示信息 -->
				<div class="logD logDtip">
					<p class="p1">登录</p>
					<p class="p2">有点人员登录</p>
				</div>
				<!-- 输入框 -->
				<div class="lgD">
					<img class="img1" src="img/logName.png" /><input type="text"
					id="accounts"	placeholder="输入用户名" name="accounts" />
				</div>
				<div class="lgD">
					<img class="img1" src="img/logPwd.png" /><input type="password"
					id="passwords"placeholder="输入用户密码" name="passwords"/>
				</div>
				<div class="logC">
					<button id="submit">登 录</button>
				</div>
			</div>
		</div>
		
	</form>
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<div class="logFoot">
		
	</div>
	<!-- 登录页面底部end -->
</body>
</html>
<script>

/* $("#submit").click(function() {
	var data = {
			accounts:$("#accounts").val(),
			passwords : $("#passwords").val(),
	};
	//alert($("#accounts").val());
	$.ajax({
		type : "post", 
		dataType : "json",
		data:data,
		url : "/P2P/login/logCon.do",//要访问的后台地址  
		contentType :"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success : function(result) {//data为返回的数据，在这里做数据绑定  
			if(data=="true"){
				window.location.href="http://localhost:9088/P2P/jsp/background/index.jsp"
			}else{
				alert("登录失败");
			}
		},error : function() {
			alert("error");
		}
	});
}) */
</script>