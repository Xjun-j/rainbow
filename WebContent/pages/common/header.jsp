<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta charset="utf-8"/>
	<title>Rainbow</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	<link rel="icon" href="<%=request.getContextPath()%>/static/img/favicon.ico" mce_href="<%=request.getContextPath()%>/static/img/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/static/img/favicon.ico" mce_href="<%=request.getContextPath()%>/static/img/favicon.ico" type="image/x-icon"> 
	
	<link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/static/bootstrap/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" >
	<link href="<%=request.getContextPath()%>/static/bootstrap/switch/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet" >
	<link href="<%=request.getContextPath()%>/static/bootstrap/select/css/bootstrap-select.min.css" rel="stylesheet" >
	
	
	<script src="<%=request.getContextPath()%>/static/jquery/jquery.min.1.12.4.js"></script>
	<script src="<%=request.getContextPath()%>/static/jquery/jquery.form.js"></script>
	<script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/bootstrap/js/validator.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrapQ.min.js"></script>
	
	<!--datePicker-->
	<script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
	
	<!-- bootstrap table  -->
	<script src="<%=request.getContextPath()%>/static/bootstrap/bootstrap-table/bootstrap-table.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/bootstrap/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	
	<!-- bootstrap switch -->
	<script src="<%=request.getContextPath()%>/static/bootstrap/switch/js/bootstrap-switch.min.js"></script>
	
	<!-- bootstrap select -->
	<script src="<%=request.getContextPath()%>/static/bootstrap/select/js/bootstrap-select.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/bootstrap/select/js/i18n/defaults-zh_CN.min.js"></script>
	
	<!-- echarts -->
	<script src="<%=request.getContextPath()%>/static/js/echarts/echarts.common.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/echarts/infographic.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/echarts/dark.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/echarts/vintage.js"></script>
	
	<!-- custom js -->
	<script src="<%=request.getContextPath()%>/static/custom/common.js"></script>
	
	<style type="text/css">
		body {
			font-family: Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;
			font-weight: 
		}
		.redstar{
			color:red;
 		}
 		.form-group{
 			margin-bottom:5px;
 		}
        .navbar .nav > li .dropdown-menu {  
            margin: 0;  
        }  
        .navbar .nav > li:hover .dropdown-menu {  
            display: block;  
        }
	</style>

</head>
<body>
<!-- 顶部 -->
<div id="top-div" class="navbar navbar-default navbar-fixed-top" role="navigation" >
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
	            </button>
				<a class="navbar-brand" style="padding:5px;" href="javascript:location.href = "/rainbow/login";">
		        	<img alt="Brand" style="width:35px;height:35px;" src="<%=request.getContextPath()%>/static/img/logo.png">
		      	</a>
	      		<a class="navbar-brand"> RAINBOW </a>
			</div>
			<div class="navbar-collapse collapse"  role="navigation">
				 <ul class="nav navbar-nav">
<!-- 				 	<li class="dropdown"> -->
<!-- 				          <a href="" class="dropdown-toggle" data-toggle="dropdown">视频<span class="caret"></span></a> -->
<!-- 				          <ul class="dropdown-menu" role="menu"> -->
<%-- 				            <li><a href="<%=request.getContextPath()%>/video/list">视频管理</a></li> --%>
<%-- 				            <li><a href="<%=request.getContextPath()%>/video/editorRecommend">编辑推荐</a></li> --%>
<%-- 				            <li><a href="<%=request.getContextPath()%>/video/biliurl">B站指定抓取</a></li> --%>
<!-- 				          </ul> -->
<!-- 					</li> -->
<!-- 					<li> -->
<%-- 						<a href="<%=request.getContextPath()%>/game/list">游戏管理</a> --%>
<!-- 					</li> -->
<!-- 					<li> -->
<%-- 						<a href="<%=request.getContextPath()%>/video/category/list">分类管理</a> --%>
<!-- 					</li> -->
					<li>
						<a href="<%=request.getContextPath()%>/version/list">版本管理</a>
					</li>
<!-- 					<li> -->
<%-- 						<a href="<%=request.getContextPath()%>/channel/list">渠道管理</a> --%>
<!-- 					</li> -->
<!-- 					<li> -->
<%-- 						<a href="<%=request.getContextPath()%>/product/list">产品型号</a> --%>
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						 <a  class="dropdown-toggle" data-toggle="dropdown">防伪码<span class="caret"></span></a> -->
<!-- 				         <ul class="dropdown-menu" role="menu"> -->
<%-- 				            <li><a href="<%=request.getContextPath()%>/product/securenumber">生成</a></li> --%>
<%-- 				            <li><a href="<%=request.getContextPath()%>/product/securenumber/download">文件下载</a></li> --%>
<!-- 				         </ul> -->
<!-- 					</li> -->
<%--					<li>
							<a href="<%=request.getContextPath()%>/product/securenumber">防伪码</a>
					    </li> -->
<!-- 					<li> -->
<%-- 						  <a href="<%=request.getContextPath()%>/report/user" class="dropdown-toggle" data-toggle="dropdown">报表<span class="caret"></span></a> --%>
<!-- 				          <ul class="dropdown-menu" role="menu"> -->
<%-- 				            <li><a href="<%=request.getContextPath()%>/report/user">用户</a></li> --%>
<%-- 				            <li><a href="<%=request.getContextPath()%>/report/user/retention">留存</a></li> --%>
<!-- 				          </ul> -->
<!-- 					</li> -->
<!-- 					<li> -->
<%-- 						<a href="<%=request.getContextPath()%>/user/suggestion">用户反馈</a> --%>
<!-- 					</li> -->
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="<%=request.getContextPath()%>/j_spring_security_logout"><span class="glyphicon glyphicon-log-out"></span> 退出</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		//绝对路径
		var contextPath = "<%=request.getContextPath()%>";
		$(function(){
			//控制navbar 上的标签选中
			var current_menu = $("#current_menu");
			var menus = $(".navbar-nav li a");
			for(var i=0;i<menus.length;i++){
				if($(menus[i]).text().trim() === current_menu.text().trim()){
					$(menus[i]).parent("li").addClass("active");
					break;
				}
			}
		});
	</script>