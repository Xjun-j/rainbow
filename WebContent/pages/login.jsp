<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
	<head>  
		<meta http-equiv="Pragma" content="no-cache">
    	<meta http-equiv="Cache-Control" content="no-cache">
    	<meta charset="utf-8"/>
	    <title>Rainbow</title> 
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="icon" href="static/img/favicon.ico" mce_href="static/img/favicon.ico" type="image/x-icon">
		<link rel="shortcut icon" href="static/img/favicon.ico" mce_href="static/img/favicon.ico" type="image/x-icon"> 
		
    	<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   		
   		<script src="static/jquery/jquery.min.1.12.4.js"></script>
		
		<script src="static/bootstrap/js/bootstrap.min.js"></script>
		<script src="static/bootstrap/js/bootstrapQ.min.js"></script>
		
		<style type="text/css">
			* {
				font-size: 12px;
				font-family: Tahoma, Verdana, 'Microsoft YaHei', NSimSun
			}

/* 			body { */
/*  				background: url(static/img/vr_bg.jpg);  */
/* 				filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";   */
/* 				-moz-background-size:100% 100%;   */
/* 			    background-size:100% 100%;   */
/* 			} */
			.form-control{
				  height: 48px;
				  font-size: 15px;
				  box-shadow: none;
				  border-radius: 0;
				  border: 0;
				  border-bottom: 1px solid #d6d6d6;
				  padding-left: 0;
				  padding-right: 0;
				  background: transparent;
			}
		</style>
	</head>
	<body>
	<!-- 背景图片 -->
	<div id="formbackground" style="position:absolute; width:100%; height:100%; z-index:-10">  
		<img src="static/img/vr_bg.jpg" height="100%" width="100%"/>  
	</div>
	<!-- 顶部 -->
	<div class="navbar navbar-inverse" >
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
	            </button>
				<a class="navbar-brand" style="padding:5px;" href="javascript:location.href = "/rainbow/login";">
		        	<img alt="Brand" style="width:35px;height:35px;" src="static/img/logo.png">
		      	</a>
	      		<a class="navbar-brand" style="font-size:18px;"> VR 运营后台 </a>
			</div>
			<div class="navbar-collapse collapse"  role="navigation">
				 <ul class="nav navbar-nav navbar-right">
				 	<li>
						<a href="#"><span style="font-size:14px;">简体中文  </span></a>
					</li>
					<li>
						<a href="#"><span style="font-size:14px;">English</span></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 中间 -->
	<div class="container" style="width:100%;margin-top:10%;" >
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-2 "></div>
			<div class=" col-lg-4 col-md-4 col-sm-8 col-xs-12 " >
				<div class="panel panel-default" style="background-color:#f7f7f7;border-radius:10px;margin:0;opacity:0.9;">

				  <div class="panel-body" >
				  			<div style="height:60px; width:100%; text-align:center;">
<!-- 				  				<span style="font-size:18px;padding-top:5px;">登</span> -->
				  				<img style="width:40px;height:40px;" src="static/img/logo.png">
<!-- 				  				<span style="font-size:18px">录</span> -->
				  			</div>
							<label id="errorMsgId" style="color:red;text-align:center;width:100%;font-size:14px;"></label>
							<form id="loginForm"  method="post" action="${base }j_spring_security_check" method="post">
								<input  id="login_name" class="form-control" name="j_username" placeholder="用户名..."  required autofocus> 
								<input id="login_pw" type="password" name="j_password" class="form-control"  placeholder='密码...' style="margin-top:5px;" required>
								<input id="remember-me" name="remember-me" type="checkbox" checked="checked"/>
								<lable for="remember-me">Remember Me</lable>
								<div style="margin:30px 0;">
									<button class="btn btn-lg btn-primary  btn-block" type="submit">登          录</button>
								</div>
							</form>
				  </div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-2 "></div>
		</div>
	</div>
	
<!-- 	底部 -->
	<div class="navbar navbar-inverse navbar-fixed-bottom" style="min-height:25px;" >
	  <div class="container container-fluid">
	  	<div class="row">
	  		<div class="col-md-12" >
				<p class="text-center" style="color:#585858;margin-top:10px;">&nbsp;&nbsp;Copyright©2015 VR &nbsp;&nbsp;  All Rights Reserved.</p>
	  		</div>
	  	</div>
	  </div>
	</div>
	
	</body>
</html>
    