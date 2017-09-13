<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>角色管理</title>
<script type="text/javascript"
	src="../../bootstrap/jquery/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<script type="text/javascript"
	src="../../bootstrap/dist/bootstrap-table.js"></script>

<link rel="stylesheet" href="../../bootstrap/dist/bootstrap-table.css"
	type="text/css"></link>
<script type="text/javascript" src="js/jquery.cookie1.4.1.js"></script>
</head>
<body>


	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-body">项目筹资管理</div>
		</div>

		<!--表格  -->
		<table id="tb_departments">

		</table>
		
<!-- 编辑模态框（Modal） -->
<div class="modal fade" id="selectinfoModal" tabindex="-1" role="dialog" aria-labelledby="selectinfoModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" >
					项目详细支持记录
				</h4>
			</div>
			<div class="modal-body" id="infotbale">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	</div>
	
	
	<!-- 编辑账号模态框（Modal） -->

</body>
</html>

<script>
var temp={};
$("#submit").click(function() {
	var data = {
		rolename : $("#rolename").val(),
	};
	alert($("#rolename").val());
	$.ajax({
		type : "post",
		dataType : "json",
		data:data,
		url : "/P2P/back/addRoleTable.do",//要访问的后台地址  
		contentType :"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success : function(result) {//data为返回的数据，在这里做数据绑定  
			if(result.resultType=="true"){
				alert("添加成功");
				$('#addRoleTable').modal('hide');
			}else{
				alert("添加失败");
			}
		},error : function() {
			alert("error");
		}
	});
})

 
	$(function () {
	    //1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();
	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	    
		/* 
		 var selectoTable = new selectinfoTable();
		 selectoTable.Init(); */
	});
	/* function formatOperat(row,index,value){
	      return ["<input type=\"radio\" name=\"name"+index.EVAID+"\" value=\"5\" />"];
	} */
	
	var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
	    $('#tb_departments').bootstrapTable({
	        url: '/P2P/projectmoney/queryProjectMoney.do'  ,  //请求后台的URL（*）
	        method: 'post',                      //请求方式（*）
	        toolbar: '#toolbar',                //工具按钮用哪个容器
	        striped: true,                      //是否显示行间隔色
	        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        pagination: true,                   //是否显示分页（*）
	        sortable: false,                     //是否启用排序
	        sortOrder: "asc",                   //排序方式
	        queryParams: oTableInit.queryParams,//传递参数（*）
	        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
	        pageNumber:1,                       //初始化加载第一页，默认第一页
	        pageSize: 10,                       //每页的记录行数（*）
	        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
	        singleSelect: false,
	        search: false,                      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	        strictSearch: false,
	        showColumns: true,                  //是否显示所有的列
	        showRefresh: true,                  //是否显示刷新按钮
	        minimumCountColumns: 2,             //最少允许的列数
	        clickToSelect: true,                //是否启用点击选中行
	       // height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "PROJECTSID",                     //每一行的唯一标识，一般为主键列
	        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	        cardView: false,                    //是否显示详细视图
	        detailView: false,                   //是否显示父子表
	        columns: [{
	            field: 'PROJECTSID',
	            title: '项目序列号'
	        },{
	            field: 'ADDTIME',
	            title: '发起时间'
	        },{
	            field: 'ORIGINATORTYPE',
	            title: '发起人类型'
	        },{
	            field: 'EMPID',
	            title: '发起人序列号'
	        },{
	            field: 'RAISE_MONEY',
	            title: '已筹集金额'
	        },{
	            field: 'TARGE_MONEY',
	            title: '目标筹集金额'
	        },{
	            field: 'PROJECTSSTATE',
	            title: '项目状态'
	        },{       
	        	title: '操作',
                events:operateEvents,
                formatter:function(value,row,index){ 
                	return ['<button class=" selectinfo btn btn-danger " > 查看详细记录  </button>',
                	        '<button class=" updata btn btn-warning " > 完成项目 </button>'
              			  ].join('');
                }
	            }
	        
	        ]
	    });
	};
	//绑定点击事件
	window.operateEvents = {
			//查看详细记录按钮事件
				 'click .selectinfo': function (e, value, row, index) {
					 $("#selectinfoModal").modal();
					
					 $('#infotbale').bootstrapTable("refresh");
					 alert(2222)
					$("#infotbale").bootstrapTable('load');
					alert(111);
					
				
				
				} ,
	 'click .remove': function (e, value, row, index) {
		 var	data={
				 roleid:row.ROLEID, 
				 rolename:row.ROLENAME,
				 rolestate:19
		 }
		   $.ajax({
				type : "post",
				dataType : "json",
				data:JSON.stringify(data),
				url : "/P2P/back/updateRoletable.do",//要访问的后台地址  
				contentType :"application/json;charset=utf-8",
				success : function(data1) {//data为返回的数据，在这里做数据绑定  
					if(data1.resultType){
						alert("删除成功");
						 $('#tb_departments').bootstrapTable("refresh");
					}else{
						alert("删除失败");
					} 
								
				},error : function() {
					alert("error");
				}	
			}); 
	 } 
	    };
	
	//得到查询的参数
	oTableInit.queryParams = function (params) {
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		   		
		    };
		    return temp;	 
		};
		return oTableInit;
	};
	
	var ButtonInit = function () {
		var oInit = new Object();
		var postdata = {};
		oInit.Init = function () {
		    //初始化页面上面的按钮事件
		};
			return oInit;
	};
	
	
		

	/* var selectinfoTable = function () {
	var selectinfoTableInit = new Object();
	//初始化Table
	selectinfoTableInit.Init = function () {
	    $('#infotbale').bootstrapTable({
	        url: '/P2P/projectmoney/queryProjectMoneyinfo.do'  ,  //请求后台的URL（*）
	        method: 'post',                      //请求方式（*）
	        toolbar: '#toolbar',                //工具按钮用哪个容器
	        striped: true,                      //是否显示行间隔色
	        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        pagination: true,                   //是否显示分页（*）
	        sortable: false,                     //是否启用排序
	        sortOrder: "asc",                   //排序方式
	        queryParams: queryParams ,           //传递参数（*）
	        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
	        pageNumber:1,                       //初始化加载第一页，默认第一页
	        pageSize: 10,                       //每页的记录行数（*）
	        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
	        singleSelect: false,
	        search: false,                      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	        strictSearch: false,
	        showColumns: true,                  //是否显示所有的列
	        showRefresh: true,                  //是否显示刷新按钮
	        minimumCountColumns: 2,             //最少允许的列数
	        clickToSelect: true,                //是否启用点击选中行
	       // height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "PROJECTSID",                     //每一行的唯一标识，一般为主键列
	        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	        cardView: false,                    //是否显示详细视图
	        detailView: false,                   //是否显示父子表
	        columns: [{
	            field: 'PROJECTSID',
	            title: '项目序列号'
	        },{
	            field: 'ADDTIME',
	            title: '发起时间'
	        },{
	            field: 'ORIGINATORTYPE',
	            title: '发起人类型'
	        },{
	            field: 'EMPID',
	            title: '发起人序列号'
	        },{
	            field: 'RAISE_MONEY',
	            title: '已筹集金额'
	        },{
	            field: 'TARGE_MONEY',
	            title: '目标筹集金额'
	        },{
	            field: 'PROJECTSSTATE',
	            title: '项目状态'
	        },{       
	        	title: '操作',
                events:operateEvents,
                formatter:function(value,row,index){ 
                	return ['<button class=" selectinfo btn btn-danger " > 查看详细记录  </button>',
                	        '<button class=" updata btn btn-warning " > 完成项目 </button>'
              			  ].join('');
                }
	            }
	        
	        ]
	    });
	};
	queryParams = function (params) {
	    var projectsLjl = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	   		projectsid:100052
	    };
	    return projectsLjl;	 
	};
	return selectinfoTableInit;
 }; */

</script>