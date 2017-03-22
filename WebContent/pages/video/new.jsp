<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 新增窗口  start-->
	<div class="modal fade" id="add_panel" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;上传视频</b></span>
	      </div>
	      <div class="modal-body">
	        <form id="add_form" class="form-horizontal"  onsubmit="return false;"  data-toggle="validator" role="form">
	        	  <input type="hidden" name="id" id="id">
       			  <div class="form-group">
				    <label for="title" class="col-sm-2 control-label">名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="title" maxlength="256"  class="form-control" id="title" required>
				    </div>
				  </div>
				  
				 <div class="form-group">
				    <label for="category" class="col-sm-2 control-label">分类<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				       <select  name="category" class="form-control" id="category" required>
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="tag" class="col-sm-2 control-label">标签<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <select  name="tag" class="form-control selectpicker" id="tag" required>
				      		<option value='1'>全景2D</option>
				      		<option value='2'>全景3D</option>
				      		<option value='3'>普通2D</option>
				      		<option value='4'>普通3D</option>
				      </select>
				    </div>
				  </div>
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="radio" class="col-sm-2 control-label">分辨率</label> -->
<!-- 				    <div class="col-md-8"> -->
<!-- 				      <input type="text" name="radio"  class="form-control" id="radio" > -->
<!-- 				    </div> -->
<!-- 				  </div> -->
				  
				  <div class="form-group">
				    <label for="motto"  class="col-sm-2 control-label" >简要描述<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <textarea  name="motto"   class="form-control" maxlength="128" rows="1" id="motto" placeholder="一句话描述..."  required></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="intro"  class="col-sm-2 control-label" >描述<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <textarea name="introduction"   class="form-control" rows="5" id="intro" placeholder="详细描述..." required></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="date"  class="col-sm-2 control-label"  >出版年代</label>
				    <div class="col-md-8">
				      <input type="number" name="releaseDate"  maxlength="32"  placeholder="例如: 2016 "  class="form-control" id="date" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="duration"  class="col-sm-2 control-label" >片长<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="number" name="duration" maxlength="10" class="form-control" placeholder="单位:分钟..." id="duration" required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="area"  class="col-sm-2 control-label" >出版地区</label>
				    <div class="col-md-8">
				      <input type="text" name="area" maxlength="32"  class="form-control"  placeholder="有多个时以 | 分隔"  id="area" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="director"  class="col-sm-2 control-label" >导演</label>
				    <div class="col-md-8">
				      <input type="text" name="director" maxlength="256" class="form-control" placeholder="有多个时以 | 分隔"  id="director" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="star"  class="col-sm-2 control-label" >主演</label>
				    <div class="col-md-8">
				      <input type="text" name="starring"  maxlength="256" class="form-control" placeholder="有多个时以 | 分隔" id="star" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="score"  class="col-sm-2 control-label" >得分</label>
				    <div class="col-md-8">
				      <input type="number" value="0.00" name="score" pattern="^[0-9]+(.[0-9]{0,2})?$" maxlength="10" placeholder="可保留两位小数" class="form-control" id="score" required >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="viewer"  class="col-sm-2 control-label" >浏览次数</label>
				    <div class="col-md-8">
				      <input type="number" name="viewers" maxlength="19" class="form-control" id="viewer" >
				    </div>
				  </div>
				  
			      <input id="poster_url" name="posterUrl" type="hidden" />
			      <input id="video_url" name="videoUrl" type="hidden" />
	        </form>
	        
	         <!-- 电影海报 -->
		      <form id="poster_form" enctype="multipart/form-data" method="post"   class="form-horizontal"  data-toggle="validator" role="form">
		      		 <div class="form-group">
		      		 	<label for="poster" class="col-md-2 control-label">影片海报<span class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
					    	<input type="file" id="poster" name="file"  class="form-control" required >
					    	<div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
							  <div id="poster_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" style="min-width:2em;width:2%">
							  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <input type="submit" value="上传" > </div>
					  </div>
			  </form>
	        
	         <!-- 上传电影 -->
		      <form id="video_file_form" enctype="multipart/form-data" method="post"   class="form-horizontal" data-toggle="validator" role="form"  >
		      		 <div class="form-group">
		      		 	<label for="video_file" class="col-md-2 control-label">视频文件<span class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
					    	 <input type="file" id="video_file" name="file"  class="form-control" required>
					    	 <div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
								  <div id="movie_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" style="min-width:2em;width:2%">
								  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <input type="submit" value="上传" > </div>
					  </div>
			  </form>
	        
	        
			<div class="row">
			  	<div class="col-md-offset-2 col-md-8">
			    	<button id="btn_new_submit"  class="btn btn-success" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
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

<!-- 新增窗口  end-->





<!-- 编辑窗口  start-->	
	<div class="modal fade" id="edit_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;编 辑</b></span>
	      </div>
	      <div class="modal-body">
	        <form id="edit_form" class="form-horizontal"  onsubmit="return false;" data-toggle="validator" role="form">
	        	  <input type="hidden" name="id" id="v_id">
       			  <div class="form-group">
				    <label for="v_title" class="col-sm-2 control-label">名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="title"  class="form-control" id="v_title" required >
				    </div>
				  </div>
				  
				 <div class="form-group">
				    <label for="v_category" class="col-sm-2 control-label">分类<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				       <select  name="category" class="form-control" id="v_category" required>
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_tag" class="col-sm-2 control-label">标签<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <select  name="tag" class="form-control" id="v_tag" required>
				      		<option value='1'>全景2D</option>
				      		<option value='2'>全景3D</option>
				      		<option value='3'>普通2D</option>
				      		<option value='4'>普通3D</option>
				      		<option value='5'>全景图片</option>
				      </select>
				    </div>
				  </div>
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="v_radio" class="col-sm-2 control-label">分辨率</label> -->
<!-- 				    <div class="col-md-8"> -->
<!-- 				      <input type="text" name="radio"  class="form-control" id="v_radio" > -->
<!-- 				    </div> -->
<!-- 				  </div> -->
				  
				  <div class="form-group">
				    <label for="v_motto"  class="col-sm-2 control-label" >简要描述</label>
				    <div class="col-md-8">
				      <textarea  name="motto" maxlength="256"  class="form-control" rows="1" id="v_motto" ></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_intro"  class="col-sm-2 control-label" >描述</label>
				    <div class="col-md-8">
				      <textarea name="introduction" maxlength="8192"   class="form-control" rows="5" id="v_intro" ></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_date"  class="col-sm-2 control-label" >出版年代</label>
				    <div class="col-md-8">
				      <input type="number" name="releaseDate"  class="form-control" id="v_date" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_duration"  class="col-sm-2 control-label" >片长</label>
				    <div class="col-md-8">
				      <input type="number" name="duration" maxlength="10"  class="form-control"  placeholder="单位:分钟" id="v_duration" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_area"  class="col-sm-2 control-label" >出版地区</label>
				    <div class="col-md-8">
				      <input type="text" name="area"  class="form-control"  maxlength="64" placeholder="有多个时以 | 分隔"  id="v_area" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_director"  class="col-sm-2 control-label" >导演</label>
				    <div class="col-md-8">
				      <input type="text" name="director"  class="form-control" maxlength="512" placeholder="有多个时以 | 分隔"  id="v_director" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_star"  class="col-sm-2 control-label" >主演</label>
				    <div class="col-md-8">
				      <input type="text" name="starring"  class="form-control" maxlength="512" placeholder="有多个时以 | 分隔" id="v_star" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_score"  class="col-sm-2 control-label" >得分</label>
				    <div class="col-md-8">
				      <input type="text" name="score"  class="form-control" id="v_score" pattern="^[0-9]+(.[0-9]{0,2})?$" maxlength="10" required>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_viewer"  class="col-sm-2 control-label" >浏览次数</label>
				    <div class="col-md-8">
				      <input type="number" name="viewers" maxlength="19"  class="form-control" id="v_viewer" >
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-md-offset-2 col-md-8">
				      <button type="submit" onclick="updateVideo()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
				      <input id="btn_reset" type="reset" style="display:none;" /> 
				    </div>
			  	</div>
	        </form>
	      </div>
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-default" data-dismiss="关闭">Close</button> -->
<!-- 	        <button type="button" class="btn btn-success">上传</button> -->
<!-- 	      </div> -->
	    </div>
	  </div>
	</div>
<!-- 编辑窗口  end-->	


<!-- 设置banner modal start********************************************************** -->
<div class="modal fade" id="banner_panel" tabindex="-1" role="dialog" aria-labelledby="banner" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="banner"><span class="glyphicon glyphicon-cog"></span>设为编辑推荐</h4>
      </div>
      <div class="modal-body" >
<!--       		<p class="text-center" style="font-size:16px;"> -->
<!--      	    	<span class="glyphicon glyphicon-question-sign" style="color:#5bc0de"></span> -->
<!--      	    	&nbsp; &nbsp;确定设为编辑推荐 ?  -->
<!--      	    </p> -->
		<div class="row">
      		<form id="banner_form" class="form-inline"  onsubmit="return false;" data-toggle="validator" role="form">
		     		<input type="hidden" name="videoId" id="banner_id">
		     		<input type="hidden" name="banner" id="banner_num" value="1">
		     		<div class="col-md-2"></div>
					<div class="col-md-8 col-xs-12">
			     		<div class="form-group">
				     		<label for="start_date" >推荐日期：</label>
							<div id="start_date_div" class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
			                    <input id="start_date" name="recommendDate" class="form-control" size="16" type="text" value=""  readonly>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		     					</div>
		                </div>
	                </div>
	                <div class="col-md-2"></div>
      		</form>
      	</div>
      </div>
      
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button id="banner_confrim" type="button" class="btn btn-info">确定</button>
      </div>
    </div>
  </div>
</div>
<!-- 设置banner modal end********************************************************** -->


<!-- 取消banner modal start********************************************************** -->
<div class="modal fade" id="cannel_banner" tabindex="-1" role="dialog" aria-labelledby="c_banner" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="c_banner">友情提示</h4>
      </div>
      <div class="modal-body">
     		<p class="text-center" style="font-size:16px;">
     			 <span class="glyphicon glyphicon-exclamation-sign" style="color:red"></span>
     			 &nbsp; &nbsp;该视频已经是编辑推荐，可去推荐列表查看操作
     	    </p>
<!--      		<input type="hidden" id="cancel_banner_id"> -->
      </div>
      
      <div class="modal-footer">
<!--       	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        <button id="cancel_confrim" type="button" class="btn btn-info">确定</button>
      </div>
    </div>
  </div>
</div>
<!-- 取消 banner modal end********************************************************** -->

