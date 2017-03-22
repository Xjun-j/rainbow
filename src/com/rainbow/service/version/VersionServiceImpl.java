package com.rainbow.service.version;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.dao.version.VersionDao;
import com.rainbow.model.version.Version;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VersionVo;

@Service("versionService")
@Transactional
public class VersionServiceImpl implements VersionService {

	@Autowired
	private VersionDao versionDao;

	@Override
	public List<Version> findAll(QueryVo queryVo) {
		return versionDao.findAll(queryVo);
	}

	@Override
	public String add(VersionVo versionVo) {
		return versionDao.add(versionVo);
	}

	@Override
	public String delete(VersionVo version) {
		
		return versionDao.delete(version);
	}



}
