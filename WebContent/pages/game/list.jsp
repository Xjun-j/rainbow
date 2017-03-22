<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 顶部 -->
<jsp:include page="/pages/common/header.jsp"  />

	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">游戏管理</li>
		</ol>
		<div id="toolbar">
	        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#add_panel">
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
	
<jsp:include page="new.jsp"/>

<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>
	

<script type="text/javascript">
	$('#table').bootstrapTable({
	    url: 'findAll',
	//  height:getHeight(),
	    showToggle:true,
	//     cardView:true,
		search:true,
		searchOnEnterKey:true,
		pagination:true,
		showColumns:true,
		pageList:[10, 20, 50, 100],
		contentType: "application/json",
	// 	onlyInfoPagination:'true',
	// 	showPaginationSwitch:true,
		striped:true,
		dataType:'json',
		method:'post',
	    columns: [{
	    	visible:false,
	        field: 'idStr',
	        title: 'ID'
	    }, {
	        field: 'title',
	        title: '名称'
	    }, {
	        field: 'scategory',
	        title: '分类'
	    }, {
	        field: 'tag',
	        title: '标签'
	    }, {
	        field: 'os',
	        title: '操作系统'
	    }, 
	    {
	    	visible:false,
	        field: 'gameUrl',
	        title: '下载链接'
	    } , 
	    {
	        field: 'motto',
	        title: '简介'
	    }, {
	    	visible:false,
	        field: 'introduction',
	        title: '描述'
	    }, {
	        field: 'device',
	        title: '设备'
	    }, {
	        field: 'feature',
	        title: '特点'
	    }, {
	        field: 'updateDate',
	        title: '更新时间'
	    }, {
	        field: 'version',
	        title: '版本'
	    }, {
	        field: 'pkgName',
	        title: '包名'
	    }, {
	    	visible:false,
	        field: 'downloaders',
	        title: '下载量'
	    }, {
	        field: '',
	        title: '操作',
	        width:80,
	        align: 'center',
	        events: {
	            'click .edit': function (e, value, row, index) {
	//                 alert('You click like action, row: ' + JSON.stringify(row));
					$("#v_id").val(row.idStr);
					$("#v_title").val(row.title);
					$("#v_motto").val(row.motto);
					$("#v_intro").val(row.introduction);
					$("#v_url").val(row.gameUrl);
					$("#v_category").val(row.category);
					$("#v_tag").val(row.tag);
					$("#v_plat").val(row.plat);
					$("#v_pkg_size").val(row.pkgSize);
					$("#v_pkg_name").val(row.pkgName);
					$("#v_os").val(row.os);
					$("#v_device").val(row.device);
					$("#v_operate").val(row.operate);
					$("#v_feature").val(row.feature);
					$("#v_guide").val(row.guide);
					$("#v_update_date").val(row.updateDate);
					$("#v_author").val(row.author);
					$("#v_version").val(row.version);
					$("#v_downloaders").val(row.downloaders);
					
	            },
	            'click .delete': function (e, value, row, index) {
//	              alert('You click like action, row: ' + JSON.stringify(row));
					$("#delete_id").val(row.idStr);
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
	        '<i class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#edit_panel"></i>',
	        '</a>  ',
	        '<a class="delete" href="javascript:void(0)" title="删除">',
	        '<i class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#delete_panel"></i>',
	        '</a>  '
	    ].join('');
	}
	
	function updateGame(){
		
		var hasError = $("#edit_form").validator('validate').has('.has-error').length;
		if(!hasError){
			var formdata = $("#edit_form").serializeArray();
			var params = {};
			for(i in formdata){
				params[formdata[i].name]=formdata[i].value;
			};
			params["scategory"]=$("#v_category").find("option:selected").text();
			$.ajax({
				url : "update",
				dataType : 'json',
				data:params,
				type : 'post',
				success: function(data) {
					$("#edit_panel").modal('hide');
					alert("保存成功！");
					$("#btn_reset").trigger("click");//清空form
					$('#table').bootstrapTable('refresh');
				}
			});
		}
		
	}
	
	
	function addGame(){
		var hasError = $("#add_form").validator('validate').has('.has-error').length;
		if(!hasError){
			if($("#a_os").val()=="android" &&  !$("#g_app_filepath").val()){
				alert("请上安装包！");
				return false;
			}
			if($("#a_os").val()=="ios" && !$("#g_ios_filepath").val()  ){
				alert("请填写下载链接!");
				return false;
			}
			if($("#a_os").val()=="ios" && !$("#a_ios_pkgsize").val()  ){
				alert("请填写安装包大小!");
				return false;
			}
			if(!$("#g_img_filepath").val()){
				alert("请上传缩略图！");
				return false;
			}
			if( !$("#g_sh_filepath0").val() && !$("#g_sh_filepath1").val() && !$("#g_sh_filepath2").val()  ){
				alert("请上传游戏截图！");
				return false;
			}
			
			var formdata = $("#add_form").serializeArray();
			var params = {};
			var sshots = new Array();
			for(i in formdata){
				if(formdata[i].name=='screenshotAddrs'){
					if(formdata[i].value){
						sshots.push(formdata[i].value);
					}
				}else{
					params[formdata[i].name] = formdata[i].value;
				}
			};
			params["scategory"]=$("#a_category").find("option:selected").text();
			params["screenshotAddrs"]=sshots;
			params = $.param( params, true );//阻止数据深度序列化
			
			$.ajax({
				url : "add",
				dataType : 'json',
		// 		contentType : 'application/json',
				data:params,
				type : 'post',
				success: function(data) {
					$("#add_panel").modal('hide');
					alert("保存成功！");
					$("#btn_add_reset").trigger("click");//清空form
					$("#g_img_form").resetForm();
					$("#g_img_screenshots").resetForm();
					$("#g_app_form").resetForm();
					$('#table').bootstrapTable('refresh');
					//恢复成默认android 上传包
					$("#g_ios_url").hide();
					$("#g_ios_filepath").attr("disabled","disabled");
					$("#g_app_form").show();
					$("#g_app_filepath").removeAttr("disabled");
					$("#g_img_progress").parent(".progress").hide();
					$("#g_screenshot_progress").parent(".progress").hide();
					$("#g_app_progress").parent(".progress").hide();
				},
				error:function(xhr){
					if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
						location.href = "/rainbow/login";
					}
					alert("保存失败");
				}
			});
		}
		
	}
	
	$("#g_img_form").submit(function(e){
	    e.preventDefault();
	    if(!$("#g_img").val()){
			alert("请选择图片！");
			return false;
		}
	    $("#g_img_form").ajaxSubmit({
	        url:contextPath+"/upload/img",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	            $("#g_img_filepath").val(data.imgUrl);
	        },
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	    
	    var progressDiv = $("#g_img_progress").parent(".progress");
	    progressDiv.show();
	    var intervalId = setInterval(function(){
	    	$.ajax({
				url : contextPath+"/upload/progress",
				data:{},
				dataType : 'json',
				type : 'post',
				success : function(data) {
					if(data.result.uploaded == data.result.total){
// 						console.log("finish:"+data.result);
						clearInterval(intervalId);
						$("#g_img_progress").width("100%");
					}else{
// 						console.log("interval:"+Math.ceil(data.result.uploaded/data.result.total*100));
						$("#g_img_progress").width(Math.ceil(data.result.uploaded/data.result.total*100)+"%");
					}
				},
				error: function(xhr){
		        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
						location.href = "/rainbow/login";
					}
		            alert("保存失败！请重试！");
		        }
			});
	    },1000);
	});
	
	
	$("#g_app_form").submit(function(e){
	    e.preventDefault();
	    if(!$("#g_app").val()){
			alert("请选择安装包！");
			return false;
		}
	    $("#g_app_form").ajaxSubmit({
	        url: contextPath+"/upload/file",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	            console.log(new Date() + "data",data);
	            $("#g_app_filepath").val(data.url);
	            $("#a_pkg_size").val(data.size);
// 	            alert("保存成功！");
	        },
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	//             console.log("error",error);
	            alert("保存失败！请重试！");
	        }
	    });
	    
	    $("#g_app_progress").parent(".progress").show();
	    var intervalId = setInterval(function(){
	    	$.ajax({
				url : contextPath+"/upload/progress",
				data:{},
				dataType : 'json',
				type : 'post',
				success : function(data){
					if(data.result.uploaded == data.result.total){
						console.log(new Date() + "finish:"+data.result);
						clearInterval(intervalId);
						$("#g_app_progress").width("100%");
					}else{
						console.log(new Date() + "interval:"+Math.ceil(data.result.uploaded/data.result.total*100));
						$("#g_app_progress").width(Math.ceil(data.result.uploaded/data.result.total*100)+"%");
					}
				},
				error: function(xhr){
		        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
						location.href = "/rainbow/login";
					}
		            alert("保存失败！请重试！");
		        }
			});
	    },100);
	    
	});
	
	
	$("#g_img_screenshots").submit(function(e){
	    e.preventDefault();
	    if( !$("#g_screenshot1").val() && !$("#g_screenshot2").val() && !$("#g_screenshot3").val()  ){
			alert("还未选择游戏截图图片！");
			return false;
		}
	    
	    $("#g_img_screenshots").ajaxSubmit({
	        url:contextPath+"/upload/screenshot",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	            console.log("data",data);
	            for(var i=0;i<data.imgUrl.length;i++){
		            $("#g_sh_filepath"+i).val(data.imgUrl[i]);
	            }
// 	            alert("保存成功！");
	        },
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	    
	   $("#g_screenshot_progress").parent(".progress").show();
	    var intervalId = setInterval(function(){
	    	$.ajax({
				url : contextPath+"/upload/progress",
				data:{},
				dataType : 'json',
				type : 'post',
				success : function(data){
					if(data.result.uploaded == data.result.total){
// 						console.log("finish:"+data.result);
						clearInterval(intervalId);
						$("#g_screenshot_progress").width("100%");
					}else{
						console.log("interval:"+Math.ceil(data.result.uploaded/data.result.total*100));
						$("#g_screenshot_progress").width(Math.ceil(data.result.uploaded/data.result.total*100)+"%");
					}
				},
				error: function(xhr){
		        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
						location.href = "/rainbow/login";
					}
		            alert("保存失败！请重试！");
		        }
			});
	    },1000);
	    
	    
	});
	
	$("#a_os").on("change",function(e){
		var os = e.target.value;
		if(os == "android"){
			$("#g_ios_url").hide();
			$("#g_ios_filepath").attr("disabled","disabled");
			$("#a_pkgsize_div").hide();
			$("#a_ios_pkgsize").attr("disabled","disabled");
			
			$("#g_app_form").show();
			$("#g_app_filepath").removeAttr("disabled");
			$("#a_pkg_size").removeAttr("disabled");
		}else if(os=="ios"){
			$("#g_ios_url").show();
			$("#g_ios_filepath").removeAttr("disabled");
			$("#a_pkgsize_div").show();
			$("#a_ios_pkgsize").removeAttr("disabled");
			
			
			$("#g_app_form").hide();
			$("#g_app_filepath").attr("disabled","disabled");
			$("#a_pkg_size").attr("disabled","disabled");
			
		}
	});
	
	$(".imgfile").on('change',function(e){
		var localfile = e.target.value;
		var suffix = localfile.substring(localfile.lastIndexOf("."));
		if(suffix !='.jpg' && suffix!='.png' ){
			alert("请上传 jpg,png 格式的图片！");
			e.target.value="";
			return false;
		}
	});
	
	$("#g_app").on('change',function(e){
		var localfile = e.target.value;
		var suffix = localfile.substring(localfile.lastIndexOf("."));
		if($("#a_os").val() == "android"){
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

// 	$.ajax({
// 		url : "findAll",
// 		dataType : 'json',
// 		data:{'videoVo.page':1,'videoVo.pageSize':10},
// 		type : 'post',
// 		success : function(data) {
// 			$("#list").text(data);
// 		}
// 	});
</script>
