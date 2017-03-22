package com.rainbow.service.game;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.dao.game.GameDao;
import com.rainbow.model.game.Game;
import com.rainbow.vo.GameVo;
import com.rainbow.vo.QueryVo;

@Service("gameService")
@Transactional
public class GameServiceImpl implements GameService {

	@Autowired
	private GameDao gameDao;

	@Override
	public List<Game> findAll(QueryVo queryVo) {
		return gameDao.findAll(queryVo);
	}

	@Override
	public String update(GameVo game) {
		return gameDao.update(game);
	}

	@Override
	public String add(GameVo game) {
		return gameDao.add(game);
	}

	@Override
	public String delete(GameVo game) {
		return gameDao.delete(game);
	}



}
