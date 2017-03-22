package com.rainbow.service.video;

import java.math.BigInteger;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.dao.video.VideoDao;
import com.rainbow.model.video.BiliUrl;
import com.rainbow.model.video.Category;
import com.rainbow.model.video.EditorRecommend;
import com.rainbow.model.video.Video;
import com.rainbow.vo.CategoryVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VideoVo;

@Service("videoService")
@Transactional
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoDao videoDao;

	@Override
	public List<Video> findAll(QueryVo videoVo) {
		List<Video> videos = videoDao.findAll(videoVo);
		return videos;
	}

	@Override
	public String update(VideoVo video) {
		return videoDao.update(video);
	}

	@Override
	public List<Category> findCategoryList(QueryVo queryVo) {
		return videoDao.findCategoryList(queryVo);
	}

	@Override
	public String changeStatus(BigInteger videoId) {
		return videoDao.changeStatus(videoId);
	}

	@Override
	public String changeCategoryStatus(int id, int status, String os) {
		return videoDao.changeCategoryStatus(id,status,os);
	}

	@Override
	public String saveCategory(CategoryVo categoryVo) {
		return videoDao.saveCategory(categoryVo);
	}

	@Override
	public String save(VideoVo video) {
		return videoDao.save(video);
	}

	@Override
	public boolean checkExist(CategoryVo categoryVo) {
		return videoDao.checkExist(categoryVo);
	}

	@Override
	public String updateBanner(BigInteger videoId, int banner, String recommendDate) {
		
		return videoDao.updateBanner(videoId,banner,recommendDate);
	}

	@Override
	public boolean checkBannerNumber() {
		
		return videoDao.checkBannerNumber();
	}

	@Override
	public String saveToEditorRecomm(BigInteger videoId, String recommDate) {
		return videoDao.saveToEditorRecomm(videoId,recommDate);
	}

	@Override
	public String deleteEditorRecomm(int id) {
		return videoDao.deleteEditorRecomm(id);
	}

	@Override
	public List<EditorRecommend> findAllEditorRecomm(QueryVo queryVo) {
		List<EditorRecommend> list = videoDao.findAllEditorRecomm(queryVo);
		return list;
	}

	@Override
	public List<BiliUrl> findAllBiliUrl(QueryVo queryVo) {
		List<BiliUrl> list = videoDao.findAllBiliUrl(queryVo);
		return list;
	}

	@Override
	public String saveBiliUrl(String url) {
		return videoDao.saveBiliUrl(url);
	}



}
