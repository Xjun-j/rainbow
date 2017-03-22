package com.rainbow.service.channel;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.dao.channel.ChannelDao;
import com.rainbow.model.channel.Channel;
import com.rainbow.vo.ChannelVo;
import com.rainbow.vo.QueryVo;

@Service("channelService")
@Transactional
public class ChannelServiceImpl implements ChannelService {

	@Autowired
	private ChannelDao channelDao;

	@Override
	public List<Channel> findAll(QueryVo queryVo) {
		return channelDao.findAll(queryVo);
	}


	@Override
	public String save(ChannelVo channelVo) {
		return channelDao.save(channelVo);
	}

	@Override
	public String delete(ChannelVo channelVo) {
		
		return channelDao.delete(channelVo);
	}


	@Override
	public List<Channel> findAllForSelect() {
		return channelDao.findAllForSelect();
	}



}
