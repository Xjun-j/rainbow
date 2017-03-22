package com.rainbow.service.channel;

import java.util.List;

import com.rainbow.model.channel.Channel;
import com.rainbow.vo.ChannelVo;
import com.rainbow.vo.QueryVo;

public interface  ChannelService {
	
	public List<Channel> findAll(QueryVo queryVo);


	public String save(ChannelVo channelVo);

	public String delete(ChannelVo channelVo);

	public List<Channel> findAllForSelect();
}
