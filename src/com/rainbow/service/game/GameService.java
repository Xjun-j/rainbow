package com.rainbow.service.game;

import java.util.List;

import com.rainbow.model.game.Game;
import com.rainbow.vo.GameVo;
import com.rainbow.vo.QueryVo;

public interface  GameService {
	public List<Game> findAll(QueryVo queryVo);

	public String update(GameVo game);

	public String add(GameVo game);

	public String delete(GameVo game);
}
