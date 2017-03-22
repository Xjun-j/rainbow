<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!--底部 -->
<div id="bottom-div" class="navbar navbar-default navbar-fixed-bottom" style="min-height:25px;" >
  <div class="container container-fluid">
  	<div class="row">
  		<div class="col-md-12" >
			<p class="text-center" style="color:#585858;margin-top:10px;">
				&nbsp;&nbsp;©2017 rainbow VR &nbsp;&nbsp;  All Rights Reserved.
			</p>
  		</div>
  	</div>
  </div>
</div>

<!-- 遮罩层 -->
<div id="loading-mask" style="position:absolute;top:0px; left:0px; width:100%; height:100%;display:none;
  background:rgba(100,100,100,0.6); background:#ccc\9;filter:alpha(opacity=60);z-index:20000">
		<div id="pageloading" style="position:fixed; top:45%; left:45%; margin:0;  "> 
 			 <img src="<%=request.getContextPath()%>/static/img/loading.gif" style="width:50px;height:50px;" />
  		</div>
</div>

</body>
</html>