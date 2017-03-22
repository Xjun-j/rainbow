package com.rainbow.dao.version;

import java.util.List;

import com.rainbow.model.version.Version;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VersionVo;

public interface VersionDao {
    public List<Version> findAll(QueryVo queryVo);

//	public String update(VersionVo versionVo);

	public String add(VersionVo versionVo);

	public String delete(VersionVo versionVo);
}
