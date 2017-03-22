package com.rainbow.service.video;

import java.math.BigInteger;
import java.util.List;

import com.rainbow.model.video.BiliUrl;
import com.rainbow.model.video.Category;
import com.rainbow.model.video.EditorRecommend;
import com.rainbow.model.video.Video;
import com.rainbow.vo.CategoryVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VideoVo;

public interface  VideoService {
	public List<Video> findAll(QueryVo videoVo);

	public String update(VideoVo video);

	public List<Category> findCategoryList(QueryVo queryVo);

	public String changeStatus(BigInteger videoId);

	public String changeCategoryStatus(int id, int status, String os);

	public String saveCategory(CategoryVo categoryVo);

	public String save(VideoVo video);

	public boolean checkExist(CategoryVo categoryVo);

	public String updateBanner(BigInteger videoId, int banner,String recommendDate);

	public boolean checkBannerNumber();

	public String saveToEditorRecomm(BigInteger videoId, String recommDate);

	public String deleteEditorRecomm(int id);

	public List<EditorRecommend> findAllEditorRecomm(QueryVo queryVo);

	public List<BiliUrl> findAllBiliUrl(QueryVo queryVo);

	public String saveBiliUrl(String url);
}
