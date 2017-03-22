<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 顶部 -->
<jsp:include page="/pages/common/header.jsp"  />

	<!-- 中间 -->
	<div class="container"  style="margin-bottom:30px;padding-top:60px;">
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">视频</li>
		  <li >B站指定抓取</li>
		</ol>
		<div id="toolbar">
	        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#add_panel">
	            <i class="glyphicon glyphicon-plus"  ></i> 新增
	        </button>
		</div>
		<table id="table"
		   data-toolbar="#toolbar"
           data-show-refresh="true"
           data-show-toggle="true"
           data-minimum-count-columns="2"
           data-pagination="true"
           data-id-field="id"
           data-page-list="[10, 25, 50, 100, ALL]"
           data-show-footer="false"
           data-side-pagination="server"
		 >
		</table>
	</div>
	
<!-- 编辑 新增 窗口 -->	
	<div class="modal fade" id="add_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" >
	        	<b><span class="glyphicon glyphicon-edit"></span> 新增视频链接</b>
	        </span>
	      </div>
	      <div class="modal-body">
	        <form id="category_form" class="form-horizontal"   onsubmit="return false;" data-toggle="validator" role="form">
				  
				  <div class="form-group">
				    <div class="col-md-12">
				      <input type="textarea" name="url"   maxlength="2048" pattern="^(?:([A-Za-z]+):)?(//{0,3})([0-9./-A-Za-z]+)(?::(/d+))?(?://([^?#]*))?(?:/?([^#]*))?(?:#(.*))?$" class="form-control" placeholder="输入视频链接地址..."  required >
				    </div>
				  </div>
				  <hr>
				  <div class="form-group ">
						<div class="col-md-12" >
							<button type="submit" onclick="updateOrSave()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
						</div>
				  </div>
				  
			</form>
		        
		        
	      </div>
	    </div>
	  </div>
	</div>

<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>
	

<script type="text/javascript">
	

	$('#table').bootstrapTable({
	    url: 'bili/findAll',
	//  height:getHeight(),
	    showToggle:true,
	//     cardView:true,
// 		search:true,
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
	    	width:50,
	    	align:'center',
	        field: 'id',
	        title: 'ID'
	    }, {
	    	width:100,
	    	align:'center',
	        field: 'url',
	        title: '视频链接'
	    }, {
	    	width:60,
	    	align:'center',
	        field: 'finish',
	        title: '抓取状态',
	        formatter:function(value, row, index){
	        	return value? (value==1? "抓取成功":"抓取失败"):"正在抓取中"; 
	        }
	    }, {
	    	width:60,
	    	align:'center',
	        field: 'videoId',
	        title: '视频ID',
	        formatter:function(value, row, index){
	        	return value? value:""; 
	        }
	    }, {
	        field: 'createTime',
	        width:120,
	        align:'center',
	        title: '创建时间',
	        formatter:function(value,row,index){
				return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	        }
	    }, {
	    	width:120,
	    	align:'center',
	    	visible:false,
	        field: 'updateTime',
	        title: '更新时间',
	        formatter:function(value,row,index){
				return value? new Date(value).format("yyyy-MM-dd hh:mm:ss"):"";
	        }
	    }
// 	    {
// 	    	width:80,
// 	    	align:'center',
// 	        field: '',
// 	        title: '操作',
// 	        align: 'center',
// 	        events: {
// 	            'click .edit': function (e, value, row, index) {
// 	            }
// 	        },
// 	        formatter: operateFormatter
// 	    } 
	    ]
	});
	
	function getHeight() {
	    return $(window).height() - 150;
	}	
	
	function operateFormatter(value, row, index) {
	    return [
	        '<a class="edit" href="javascript:void(0)" title="编辑">',
	        '<i class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#add_panel"></i>',
	        '</a>  '
	    ].join('');
	}
	
	function updateOrSave(){
		var hasError = $("#category_form").validator('validate').has('.has-error').length;
		if(!hasError){
			
			$("#category_form").ajaxSubmit({
		        url:"bili/saveUrl",
		        dataType:"json",
		        type:"POST",
		        success: function(data){
		        	if(data.error){
		        		alert(data.error);
		        		return false;
		        	}
					$("#add_panel").modal('hide');
		            alert("保存成功！");
		            $("#category_form").resetForm();
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
		
	}
	
	$("#add").on("click",function(){
		$("#category_form").resetForm();
		
	});
	
	
	
	
	
</script>