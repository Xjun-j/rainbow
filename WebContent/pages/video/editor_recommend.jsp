<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">视频</li>
		  <li >编辑推荐</li>
		</ol>
		
<!--         <button id="add" class="btn btn-success" data-toggle="modal" data-target="#add_panel"> -->
<!--             <i class="glyphicon glyphicon-cloud-upload"  ></i> 上传视频 -->
<!--         </button> -->
        
<!-- 		<div id="toolbar" > -->
<!-- 			<select id="search_category" class="form-control" ></select> -->
<!-- 		</div> -->
		<table id="table"
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
	
	<!-- 取消编辑推荐窗口 -->
	<div class="modal fade" id="cannel_favor" tabindex="-1" role="dialog" aria-labelledby="c_banner" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="c_banner">友情提示</h4>
	      </div>
	      <div class="modal-body">
	     		<p class="text-center" style="font-size:16px;">
	     			 <span class="glyphicon glyphicon-exclamation-sign" style="color:red"></span>
	     			 &nbsp; &nbsp;确认取消编辑推荐？
	     	    </p>
	     		<input type="hidden" id="cancel_favor_id">
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button id="cancel_confrim" type="button" class="btn btn-info">确定</button>
	      </div>
	    </div>
	  </div>
	</div>	
<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript">

$('#table').bootstrapTable({
    url: 'editorRecomm/list',
//     height:getHeight(),
    showToggle:true,
    toolbarAlign:'right',
    sortable:true,
//     cardView:true,
// 	search:true,
// 	searchOnEnterKey:true,
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
    columns: [{
    	width:80,
    	visible:false,
        field: 'id',
        title: 'ID'
    }, {
    	width:150,
        field: 'videoId',
        title: '视频ID'
    }, {
    	width:150,
        field: 'title',
        title: '视频名称'
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
    	width:80, 
//     	visible:false,
        field: 'recommendDate',
        title: '推荐日期'
    }, {
    	width:80, 
//     	visible:false,
        field: 'url',
        title: '视频链接',
        formatter: function(value,row,index){
        	if(value.length > 0){
        		if(value.match(".rmvb") || value.match(".mkv") ){
		        	return "rmvb,mkv格式";
        		}else{
        			return "<a href='#' onclick='window.open(\""+value+"\")'>观看视频</a>";
        		}
        	}else{
        		return "暂无视频";
        	}
        }
    }, {
    	width:120,
//     	visible:false,
        field: 'createTime',
        title: '创建时间',
        formatter:function(value,row,index){
        	return new Date(value).format("yyyy-MM-dd hh:mm:ss");
        }
    }, {
    	width:70,
        field: 'operate',
        title: '操作',
        align: 'center',
        events: {
            'click .cancelFavorite': function (e, value, row, index) {
           		$("#cancel_favor_id").val(row.id);
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
        '<a class="cancelFavorite" href="javascript:void(0)" title="取消推荐">',
        '<i class="glyphicon glyphicon-trash"',
        '" data-toggle="modal" data-target="#cannel_favor"></i>',
        '</a>'
    ].join('');
}



$("#cancel_confrim").on("click",function(){
	$.ajax({
        url:"editorRecomm/delete",
        data:{"id":$("#cancel_favor_id").val()},
		//contentType : 'application/json',
		dataType : 'json',
		type : 'post',
        success: function(data){
	    	$("#cannel_favor").modal('hide');
			alert("已取消推荐！");
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






</script>
