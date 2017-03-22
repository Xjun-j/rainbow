<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">版本管理</li>
		</ol>
		
		<div id="toolbar">
	        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#version_panel">
	            <i class="glyphicon glyphicon-plus"  ></i> 新增
	        </button>
		</div>
		<table id="table"
		   data-toolbar="#toolbar"
           data-search="true"
           data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-minimum-count-columns="2"
           data-pagination="true"
           data-id-field="idStr"
           data-page-list="[10, 25, 50, 100, ALL]"
           data-show-footer="false"
           data-side-pagination="server"
		 >
		</table>
	</div>


	
<!-- 编辑 新增 窗口 -->	
	<div class="modal fade" id="version_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span></b></span>
	      </div>
	      <div class="modal-body">
	        <form id="version_form" class="form-horizontal"   onsubmit="return false;" data-toggle="validator" role="form">
	        	  <input type="hidden" name="id" id="id">
	        	  <input type="hidden" name="url" id="apk_url">
	        	  <input type="hidden" name="size" id="size">
	        	  <input type="hidden" name="md5" id="md5">
	        	  
       			  <div class="form-group">
				    <label for="vcode" class="col-sm-2 control-label">版本代号<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="number" name="vcode" maxlength="12" class="form-control" id="vcode" required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="upv" class="col-sm-2 control-label">版本号<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="upv"  class="form-control" id="upv" maxlength="100"  required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="os" class="col-md-2 control-label">操作系统<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				       <select type="text" name="os" class="form-control" id="os" required>
				      		<option value="android">android</option>
				      		<option value="ios">ios</option>
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="desc"  class="col-sm-2 control-label" >升级详情</label>
				    <div class="col-md-8">
				      <textarea name="desc"   class="form-control" rows="5" id="desc" maxlength="2048"  ></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="force"  class="col-sm-2 control-label" >强制升级</label>
				    <div class="col-md-8">
				     <select type="text" name="force" class="form-control" id="force" required>
				      		<option value="0">否</option>
				      		<option value="1">是</option>
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group" id="ios_url_div" style="display:none">
				    <label for="url" class="col-sm-2 control-label">下载链接<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="url"  class="form-control" id="ios_url" disabled="disabled" required>
				    </div>
				  </div>
				  
<!-- 				  <div class="form-group"> -->
<!-- 	  			      <div class="col-md-offset-2 col-md-8"> -->
				      	<button type="submit" style="display:none" id="hide_submit"></button>
<!-- 				      </div> -->
<!-- 			      </div> -->
	        </form>
<!-- 	        APK上传 -->
		      <form id="apk_form" enctype="multipart/form-data" method="post"   class="form-horizontal"  >
		      		 <div class="form-group">
		      		 	<label for="apk" class="col-md-2 control-label">安装包<span id="zip_redstar" class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
					    	 <input type="file" name="file"  class="form-control" id="apk" required>
					    	 <div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
								  <div id="app_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="2"  
								  aria-valuemin="0" aria-valuemax="100" style="min-width:1%;">
								  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <input type="submit" value="上传" > </div>
					  </div>
			  </form>
		        
			  <div class="row" style="margin-top:15px;">
			    <div class="col-md-offset-2 col-md-8">
			      <button type="submit" onclick="updateOrSaveVersion()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
<!-- 			      <input id="btn_reset" type="reset" style="display:none;" />  -->
			    </div>
		  	  </div>
		        
	      </div>
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-default" data-dismiss="关闭">Close</button> -->
<!-- 	        <button type="button" class="btn btn-success">上传</button> -->
<!-- 	      </div> -->
	    </div>
	  </div>
	</div>
	
	
	<!-- 删除modal start********************************************************** -->
	<div class="modal fade" id="delete_panel" tabindex="-1" role="dialog" aria-labelledby="deleteDesigner" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="deleteDesigner"><b>友情提示</b></h4>
	      </div>
	      <div class="modal-body">
	     		<p class="text-center" style="font-size:18px;"> <span class="glyphicon glyphicon-exclamation-sign" style="color:red"></span>&nbsp; &nbsp;确定删除 ? </p>
	     		<input type="hidden" id="delete_id">
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="delete_confrim" type="button" class="btn btn-info">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 删除modal end********************************************************** -->
	
	
<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript">
$('#table').bootstrapTable({
    url: 'findAll',
//     height:getHeight(),
    showToggle:true,
//     cardView:true,
	search:true,
	searchOnEnterKey:true,
	pagination:true,
	pageList:[10, 20, 50, 100],
	showColumns:true,
	contentType: "application/json",
// 	onlyInfoPagination:'true',
// 	showPaginationSwitch:true,
	striped:true,
	dataType:'json',
	method:'post',
    columns: [{
    	visible:false,
        field: 'id',
        title: 'ID'
    }, {
        field: 'vcode',
        align:'center',
        width:80,
        title: '版本代号'
        
    }, {
        field: 'upv',
        align:'center',
        width:80,
        title: '版本号'
    }, {
    	visible:false,
        field: 'url',
        title: '下载链接'
    }, {
    	visible:false,
        field: 'md5',
        title: 'MD5'
    }, {
        field: 'size',
        align:'center',
        width:80,
        title: '文件大小'
    }, {
        field: 'desc',
        width:500,
        title: '升级详情'
    }, {
        field: 'os',
        width:80,
        title: '操作系统'
    }, {
//     	visible:false,
        field: 'force',
        title: '强制升级',
        align:'center',
        width:80,
        formatter: function(value,row,index){
        	return value? "是" : "否";
        }
    }, {
//     	visible:false,
        field: 'createTime',
        align:'center',
        title: '创建日期',
        width:100,
        formatter: function(value,row,index){
        	return new Date(value).format("yyyy-MM-dd hh:mm:ss");
        }
    }, {
//         field: 'operate',
		width:60,
        title: '操作',
        align: 'center',
        events: {
            'click .edit': function (e, value, row, index) {
//                 alert('You click like action, row: ' + JSON.stringify(row));
				$("#zip_redstar").hide();
				if(row.os && row.os=="android" ){
					enableAndroid();
				}else{
					$("#ios_url").val(row.url);
					enableIos();
				}
				$("#id").val(row.id);
				$("#vcode").val(row.vcode);
				$("#upv").val(row.upv);
				$("#desc").val(row.desc);
				$("#force").val(row.force);
				$("#size").val(row.size);
				$("#apk_url").val(row.url);
				$("#os").val(row.os);
            },
            'click .delete': function (e, value, row, index) {
//              alert('You click like action, row: ' + JSON.stringify(row));
				$("#delete_id").val(row.id);
         }
        },
        formatter: operateFormatter
    } ]
});

function getHeight() {
    return $(window).height() - 150;
}

function operateFormatter(value, row, index) {
    return [
        '<a class="edit" href="javascript:void(0)" title="编辑">',
        '<i class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#version_panel"></i>',
        '</a>&nbsp;&nbsp;',
        '<a class="delete" href="javascript:void(0)" title="删除">',
        '<i class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#delete_panel"></i>',
        '</a>  '
    ].join('');
}

function isUploading(){
	var width = $("#app_progress").width();
	var total = $("#app_progress").parent(".progress").width();
	var rate = width/total*100;
	if( rate >2 && rate <100){
		return true;
	}else{
		return false;
	}
}

function updateOrSaveVersion(){
	
// 	$("#hide_submit").click();
	
// 	if( !$("#vcode").val() || !$("#upv").val()  ){
// 		return false;
// 	}
// 	if( $("#os").val()=="ios" && !$("#ios_url").val() ){
// 		return false;
// 	}

	var hasError = $("#version_form").validator('validate').has('.has-error').length;
	if(!hasError){
		if( $("#os").val()=="android" && !$("#apk_url").val() ){
			if(isUploading()){
				alert("正在上传中...请稍等...");
			}else{
				alert("请上传安装包！");
			}
			return false;
		}
		if( $("#os").val()=="android" && $("#id").val() ){
			if(isUploading()){
				alert("正在上传中...请稍等...");
				return false;
			}
		}
		
		$("#version_form").ajaxSubmit({
	        url:"save",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	//             console.log("data",data);
				$("#version_panel").modal('hide');
	            alert("保存成功！");
	            $("#version_form").resetForm();
				$('#table').bootstrapTable('refresh');
				$("#ios_url_div").hide();
				$("#ios_url").attr("disabled","disabled");
				$("#apk_form").show();
				$("#apk_form").resetForm();
				$("#app").removeAttr("disabled");
				$("#app_progress").parent(".progress").hide();
	        },
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	}

}



$("#os").on("change",function(e){
	var os = e.target.value;
	if(os == "android"){
		enableAndroid();
	}else if(os=="ios"){
		enableIos();
	}
});

function enableIos(){
	$("#ios_url_div").show();
	$("#ios_url").removeAttr("disabled");
	$("#apk_form").hide();
	$("#apk").attr("disabled","disabled");
}
function enableAndroid(){
	$("#ios_url_div").hide();
	$("#ios_url").attr("disabled","disabled");
	$("#apk_form").show();
	$("#apk").removeAttr("disabled");
}


$("#apk_form").submit(function(e){
    e.preventDefault();
    if(!$("#apk").val()){
		alert("请选择安装包！");
		return false;
	}
    $("#apk_form").ajaxSubmit({
//         url:"upload/app",
        url:contextPath+"/upload/oss/file",
        dataType:"json",
        type:"POST",
        success: function(data){
        	console.log(new Date()+data.url);
            $("#app_progress").width("100%");
            $("#apk_url").val(data.url);
            $("#size").val(data.size);
//             alert("保存成功！");
        },
        error: function(xhr){
        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
				location.href = "/rainbow/login";
			}
            alert("保存失败！请重试！");
        }
    });
    
    
    $("#app_progress").parent(".progress").show();
    var intervalId = setInterval(function(){
    	$.ajax({
			url : contextPath+"/upload/progress",
			data:{},
			dataType : 'json',
			type : 'post',
			success : function(data){
				if(data.result.uploaded == data.result.total){
					console.log(new Date()+"finish:"+data.result.uploaded);
					$("#app_progress").width("90%");
					clearInterval(intervalId);
				}else{
					var progress = Math.ceil(data.result.uploaded/data.result.total*100);
					console.log("interval:"+progress);
					$("#app_progress").width( (progress>90? 90:progress )+"%");
				}
			},
			error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("上传失败！请重试！");
	        }
		});
    },500);
    
});


$("#apk").on('change',function(e){
	var localfile = e.target.value;
	var suffix = localfile.substring(localfile.lastIndexOf("."));
	$("#app_progress").width("0%");
	if($("#os").val() == "android"){
		if(suffix !='.apk'  ){
			alert(" 亲,android操作系统请上传 apk 安装包！");
			e.target.value="";
			return false;
		}
	}
});


$("#delete_confrim").on("click",function(){
	var id = $("#delete_id").val();
	$.ajax({
		url : "delete",
		dataType : 'json',
		data:{'id':id},
		type : 'post',
		success : function(data) {
			$("#delete_panel").modal("hide");
			$('#table').bootstrapTable('refresh');
		},
		error: function(xhr){
        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
				location.href = "/rainbow/login";
			}
            alert("保存失败！请重试！");
        }
	});
});

$("#add").on("click",function(){
	$("#zip_redstar").show();
});


</script>
