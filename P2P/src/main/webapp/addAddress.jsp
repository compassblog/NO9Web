<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- <link href="assets/css/bootstrap-responsive.css" rel="stylesheet"> -->
	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="jq/jquery.cookie1.4.1.js"/></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>

   <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	table{
  		margin-top:40px;
  		margin-left:100px;
  	}
  	#tdone{
  		font-size:22px;
  		
  	}
  	input{	
  		margin-top:12px;
  		height:40px;
  	}
  	#addAddress{
  		margin-left:100px;
  	}
  	span{
  		font-size:28px;
  	}
  </style>
  </head>
  
  <body>
  	<a href="address.jsp"><span class = "glyphicon glyphicon-arrow-left"> </span></a>
  	<table class = "has-feedback">
  		<tr>
  			<td id = "tdone">收货人姓名:</td>
  			<td>
  				<input type="text" id="Name" placeholder="姓名"/>
  				<span class="help-block"></span>
  			</td>
  		</tr>
  		<tr>
  			<td id = "tdone">手机号:</td><td><input type="text" id="Phone" placeholder="联系电话" onkeyup="value=value.replace(/[^\d]/g,'')"/>
  				<span class="help-block"></span>
  			</td>
  		</tr>
  		<tr>
  			<td id = "tdone">邮编:</td><td><input type = "text" id ="postCodes" placeholder="邮政编码" onkeyup="value=value.replace(/[^\d]/g,'')"/>
  				<span class="help-block"></span>
  			</td>
  		</tr>
  		<tr>
  			<td id = "tdone">详细地址:</td>
  			<td>
  				<input type="text" placeholder="详细地址" id="AddressInfo" />
  				<span class="help-block"></span>
  			</td>
  		</tr>
		<tr>
			<td rowspan=2><input type="button" value="添加" id="addAddress" class = "btn btn-danger"/></td>
		</tr>
		
	</table>	
  </body>
</html>

<script>
//--------------校验数据----------------------------
		function checkTable(){
			//拿到要校验的数据			
			var addName =$("#Name").val();
			//校验姓名
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,6})/;
			//alert(regName.test(addName));
			if(!regName.test(addName)){
				show_address_msg("#Name", "error", "用户名必须是2-6位汉字");
				return false;
			}else{
				show_address_msg("#Name", "success", "");
			};
			
			//验证手机号
			var Phone = $("#Phone").val();
			var regPhone = /^1[34578]\d{9}$/;
			if(!regPhone.test(Phone)){
				show_address_msg("#Phone", "error", "手机号格式不正确！");
				return false;
			}else{
				show_address_msg("#Phone", "success", "");
			} 
			//验证邮编
			var postCodes = $("#postCodes").val();
			var regPostCodes = /\d{6}/;
			if(!regPostCodes.test(postCodes)){
				show_address_msg("#postCodes", "error", "邮箱格式不正确");
				return false;
			}else{
				show_address_msg("#postCodes", "success", "");
			}
			//校验地址
			var Address = $("#AddressInfo").val();
			var regAddress = /(^[a-zA-Z0-9_-]{6,96}$)|(^[\u2E80-\u9FFF]{2,36})/;
			if(!regAddress.test(Address)){
				show_address_msg("#AddressInfo", "error", "请填写详细地址");
				return false;
			}else{
				show_address_msg("#AddressInfo", "success", "");
			}
			return true;
		}
//-------------------------显示校验效果的提示信息---函数------------------
		function show_address_msg(ele,status,msg){
			//清除当前元素的父类状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else{
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//点击保存地址---------------------------------------------
		$("#addAddress").click(function(){
			if(!checkTable()){
				return false;
			}
			var data = {};
				data["AddressId"] = $("#AddressId").val();
				data["Name"] = $("#Name").val();
				data["Phone"] = $("#Phone").val();
				data["postCodes"] = parseInt($("#postCodes").val());
				data["AddressInfo"] = $("#AddressInfo").val();
				data["empid"] = $.cookie("empid");
	
				//alert($("#postCodes").val()+"==========="+data["postCodes"]);
				$.ajax({
					type : "post",//使用post方法访问后台  
					/*dataType : "json",//返回json格式的数据   */ 
					url:"/P2P/zhubin/addAddress.do",//要访问的后台地址
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					success : function(data1) {//data为返回的数据，在这里做数据绑定  
						
						alert("添加成功");
						window.location.href="address.jsp"
						
					},
					error : function() {
						
						alert("error");
						
					}
				});
			
		});
</script>