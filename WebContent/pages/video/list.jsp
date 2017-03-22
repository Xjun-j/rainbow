<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">视频</li>
		  <li >视频管理</li>
		</ol>
		
<!--         <button id="add" class="btn btn-success" data-toggle="modal" data-target="#add_panel"> -->
<!--             <i class="glyphicon glyphicon-cloud-upload"  ></i> 上传视频 -->
<!--         </button> -->
        
		<div id="toolbar" >
			<select id="search_category" class="form-control" ></select>
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

$(function(){
	//日期字段初始化
	 $('.form_date').datetimepicker({
		weekStart: 1,
      todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		format:'yyyy-mm-dd'
  });
	//初始化日期 默认查询最近10天的数据
	$("#start_date_div").datetimepicker({initialDate: new Date(new Date().getTime() )});;
	$("#start_date").val(getYmdStrByMills(new Date().getTime()));
	
	$.ajax({
		url : contextPath+"/video/category/findCategoryList",
		data:JSON.stringify({"parentId" : "1"}),
		contentType : 'application/json',
		dataType : 'json',
		type : 'post',
		success : function(data){
			var categories = $("#v_category");
			var a_categories = $("#category");
			var s_categories = $("#search_category");
			categories.empty();
			a_categories.empty();
			s_categories.empty();
			var options ="";
			for(var i=0; i<data.rows.length; i++){
				if(data.rows[i].id == 8){
					continue;
				}
				options += "<option value='"+data.rows[i].code+"'>"+data.rows[i].name+"</option>";
			}
			categories.html(options);
			a_categories.html(options);
			categories.selectpicker("refresh");
			a_categories.selectpicker("refresh");
			
			s_categories.append("<option value=''>全部</option>"+options);
// 			s_categories.append("refresh"); 
			
		},
		error: function(xhr){
			if( xhr.status == "200"){
				location.href = "/rainbow/login";
			}
            alert("网络异常,请刷新重试");
        }
	});
	
	// 新增
	$("#btn_new_submit").on("click",function(){
		
		var hasError = $("#add_form").validator('validate').has('.has-error').length;
		hasError += $("#poster_form").validator('validate').has('.has-error').length;
		hasError += $("#video_file_form").validator('validate').has('.has-error').length;

		if(!hasError){
	 		if(!$("#poster_url").val()){
				alert("请上传影片海报");
				return false;
			}
			if(!$("#video_url").val()){
				alert("视频未上传完成");
				return false;
			} 
			var formdata = $("#add_form").serializeArray();
			var params = {};
			for(i in formdata){
				params[formdata[i].name]=formdata[i].value;
			}
			params["scategory"]=$("#category").find("option:selected").text();
			$.ajax({
				url : "save",
				dataType : 'json',
//		 		contentType : 'application/json',
				data:params,
				type : 'post',
				success: function(data) {
					$("#add_panel").modal('hide');
					alert("保存成功！");
					$("#add_form").resetForm();//清空form
					$("#poster_progress").parent(".progress").hide();
					$("#movie_progress").parent(".progress").hide();
					$('#table').bootstrapTable('refresh');
				},
				error: function(xhr){
				   if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
						location.href = "/rainbow/login";
					}
				    alert("保存失败！请重试！");
				}
			});
		}
	});
	
	$("#poster").on('change',function(e){
		var localfile = e.target.value;
		var suffix = localfile.substring(localfile.lastIndexOf("."));
		if(suffix !='.jpg' && suffix!='.png' ){
			alert("请上传 jpg,png 格式的图片！");
			e.target.value="";
			return false;
		}
	});
	
	$("#video_file").on('change',function(e){
		var localfile = e.target.value;
		var suffix = localfile.substring(localfile.lastIndexOf("."));
		if(suffix !='.mp4' && suffix !='.mkv' && suffix !='.rmvb'  ){
			alert(" 亲,请上传 mp4 , mkv , rmvb 格式的视频！");
			e.target.value="";
			return false;
		}
	});
	
	$("#poster_form").submit(function(e){
	    e.preventDefault();
	    if(!$("#poster").val()){
			alert("请选择上传图片！");
			return false;
		}
	    $("#poster_form").ajaxSubmit({
	        url:contextPath+"/upload/oss/img",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	            $("#poster_url").val(data.url);
	            $("#poster_progress").width("100%");
	        },
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	    
	    var progressDiv = $("#poster_progress").parent(".progress");
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
						$("#poster_progress").width("90%");
					}else{
// 						console.log("interval:"+Math.ceil(data.result.uploaded/data.result.total*100));
						$("#g_img_progress").width(Math.ceil(data.result.uploaded/data.result.total*100)+"%");
					}
				},
				error: function(xhr){
		        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
						location.href = "/rainbow/login";
					}
		        	clearInterval(intervalId);
		            alert("保存失败！请重试！");
		        }
			});
	    },1000);
	});
	
	$("#video_file_form").submit(function(e){
	    e.preventDefault();
	    if(!$("#video_file").val()){
			alert("请选择视频！");
			return false;
		}
	    $("#video_file_form").ajaxSubmit({
	        url:contextPath+"/upload/oss/file",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	            $("#video_url").val(data.url);
	        	$("#movie_progress").width("100%");
	        },
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	    
	    var progressDiv = $("#movie_progress").parent(".progress");
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
						$("#movie_progress").width("90%");
					}else{
// 						console.log("interval:"+Math.ceil(data.result.uploaded/data.result.total*100));
						$("#movie_progress").width(Math.ceil(data.result.uploaded/data.result.total*100)+"%");
					}
				},
				error: function(xhr){
		        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
						location.href = "/rainbow/login";
					}
		        	clearInterval(intervalId);
		            alert("保存失败！请重试！");
		        }
			});
	    },1000);
	});
	
	
	//按分类搜索
	$("#search_category").on("change",function(){
		$('#table').bootstrapTable('refresh');
	});
});



$('#table').bootstrapTable({
    url: 'findAll',
//     height:getHeight(),
    showToggle:true,
    toolbarAlign:'right',
    sortable:true,
//     cardView:true,
	search:true,
	searchOnEnterKey:true,
	pagination:true,
	pageList:[10, 20, 50, 100],
	showColumns:true,
	contentType: "application/json",
	paginationLoop:false,
// 	onlyInfoPagination:'true',
// 	showPaginationSwitch:true,
	striped:true,
	dataType:'json',
	method:'post',
	queryParams:function(params){
		params['category'] = $("#search_category").val();
		return params;
	},
    columns: [{
    	width:80,
    	visible:false,
        field: 'idStr',
        title: 'ID'
    }, {
    	width:150,
        field: 'title',
        title: '名称'
    }, {
    	width:50, 
        field: 'scategory',
        title: '分类'
    }, {
    	width:60,
        field: 'tag',
        title: '标签',
        formatter:function(value,row,index){
        	//视频标签(1.全景2D、2.全景3D、3.普通2D、4.普通3D)
        	var tag = "";
        	switch(value){
        		case "1" : tag="全景2D"; break;
        		case "2" : tag="全景3D"; break;
        		case "3" : tag="普通2D"; break;
        		case "4" : tag="普通3D"; break;
        		case "5" : tag="全景图片"; break;
        		default :tag = value;
        	}
        	return tag;
        }
    }, {
    	width:200, 
        field: 'motto',
        title: '简介'
    }, {
    	width:300, 
    	visible:false,
        field: 'introduction',
        title: '描述'
    }, {
    	width:80, 
//     	visible:false,
        field: 'urls',
        title: '视频链接',
        formatter: function(value,row,index){
        	if(value.length > 0 && value[0].url){
        		if(value[0].url.match(".rmvb") || value[0].url.match(".mkv") ){
		        	return "rmvb,mkv格式";
        		}else{
        			return "<a href='#' onclick='window.open(\""+value[0].url+"\")'>观看视频</a>";
        		}
        	}else{
        		return "暂无视频";
        	}
        }
    }, {
    	width:80, 
        field: 'director',
        title: '导演'
    }, {
    	width:80, 
    	visible:false,
        field: 'starring',
        title: '明星'
    }, {
    	width:70, 
    	align:'center',
//     	sortable:true,
        field: 'releaseDate',
        sortable:true,
        title: '上映时间'
    }, {
    	width:50,
        field: 'duration',
        title: '时长'
    }, {
    	width:50,
        field: 'score',
        sortable:true,
        title: '评分'
    }, {
    	width:60, 
        field: 'viewers',
        title: '浏览次数'
    }, {
    	width:60,
        field: 'status',
        title: '状态',
        formatter: function(value,row,index){
        	return value ?  (value==1? "已上线":"下线") :"待审核";
        }
    }, {
    	width:120,
    	visible:false,
        field: 'createTime',
        title: '创建时间',
        formatter:function(value,row,index){
        	return new Date(value).format("yyyy-MM-dd hh:mm:ss");
        }
    }, 
//     {
//     	width:40,
//         field: 'banner',
//         align: 'center',
//         title: 'banner<br>序号',
//         formatter:function(value,row,index){
//         	return value==0? "" : value;
//         }
//     }, 
    {
    	width:70,
        field: 'operate',
        title: '操作',
        align: 'center',
        events: {
            'click .edit': function (e, value, row, index) {
//                 alert('You click like action, row: ' + JSON.stringify(row));
				$("#v_id").val(row.idStr);
				$("#v_title").val(row.title);
// 				$("#v_category").val(row.category);
				$('#v_category').selectpicker('val',row.category);
				$("#v_tag").val(row.tag);
				$("#v_radio").val(row.radio);
				$("#v_date").val(row.releaseDate);
				$("#v_duration").val(row.duration);
				$("#v_area").val(row.area);
				$("#v_director").val(row.director);
				$("#v_star").val(row.starring);
				$("#v_score").val(row.score);
				$("#v_viewer").val(row.viewers);
				$("#v_motto").val(row.motto);
				$("#v_intro").val(row.introduction);
            },
            'click .on_off': function (e, value, row, index) {
            	changeStatus(row.idStr);
            },
//             'click .banner_up_down': function (e, value, row, index) {
//             	if(row.banner){
//             		$("#cancel_banner_id").val(row.idStr);
//             	}else{
// 	            	$("#banner_id").val(row.idStr);
//             	}
// //             	$("#banner_num").val(row.banner==0? "":row.banner);
//             }
            'click .editor_favor': function (e, value, row, index) {
            	if(row.banner){
            		$("#cancel_banner_id").val(row.idStr);
            	}else{
	            	$("#banner_id").val(row.idStr);
            	}
//             	$("#banner_num").val(row.banner==0? "":row.banner);
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
        '<a class="on_off" href="javascript:void(0)" title="'+(row.status==1? '下线':'上线')+'">',
        '<i class="'+(row.status==1? 'glyphicon glyphicon-hand-down':'glyphicon glyphicon-hand-up')+'" data-toggle="modal" ></i>',
        '</a>',
//         '<a class="banner_up_down" href="javascript:void(0)" title="'+(row.banner==0? '设置banner':'取消banner')+'">',
//         '<i class="'+(row.banner==0? 'glyphicon glyphicon-chevron-up':'glyphicon glyphicon-chevron-down'),
//         '" data-toggle="modal" data-target="'+(row.banner==0? '#banner_panel':'#cannel_banner')+'"></i>',
//         '</a>'
        '<a class="editor_favor" href="javascript:void(0)" title="'+(row.banner==0? '设为编辑推荐':'已被编辑推荐')+'">',
        '<i class="'+(row.banner==0? 'glyphicon glyphicon-heart-empty':'glyphicon glyphicon-heart'),
        '" data-toggle="modal" data-target="'+(row.banner==0? '#banner_panel':'#cannel_banner')+'"></i>',
        '</a>'
    ].join('');
}

function updateVideo(){
	var hasError = $("#edit_form").validator('validate').has('.has-error').length;
	if(!hasError){
		var formdata = $("#edit_form").serializeArray();
		var params = {};
		for(i in formdata){
			params[formdata[i].name]=formdata[i].value;
		}
		params["scategory"]=$("#v_category").find("option:selected").text();
		$.ajax({
			url : "update",
			dataType : 'json',
	// 		contentType : 'application/json',
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

function changeStatus(videoId){
	$.ajax({
		url : "changeStatus",
		dataType : 'json',
// 		contentType : 'application/json',
		data:{"videoId":videoId},
		type : 'post',
		success: function(data) {
			$('#table').bootstrapTable('refresh');
		},
		error:function(data){
			$('#table').bootstrapTable('refresh');
		}
	});
}

$("#banner_confrim").on("click",function (){
// 	var hasError = $("#banner_form").validator('validate').has('.has-error').length;
// 	if(!hasError){
		$("#banner_form").ajaxSubmit({
	        url:"updateBanner",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
// 	             console.log("data",data);
		    	$("#banner_panel").modal('hide');
			    if(data.success=="success"){
					alert("banner设置成功！");
					$('#table').bootstrapTable('refresh');
			    }else{
			    	alert(data.msg)
			    }
// 				$("#banner_form").resetForm();
	        },
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
// 	}
});

$("#cancel_confrim").on("click",function(){
	$("#cannel_banner").modal('hide');
// 		$.ajax({
// 	        url:"updateBanner",
// 	        data:{"videoId":$("#cancel_banner_id").val(),"banner":0},
// 			//contentType : 'application/json',
// 			dataType : 'json',
// 			type : 'post',
// 	        success: function(data){
// 		    	$("#cannel_banner").modal('hide');
// 				alert("banner已取消！");
// 				$('#table').bootstrapTable('refresh');
			   
// 	        },
// 	        error: function(xhr){
	        	
// 	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
// 					location.href = "/rainbow/login";
// 				}
// 	            alert("保存失败！请重试！");
// 	        }
// 	    });
});


</script>
