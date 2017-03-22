package com.rainbow.service.user;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.dao.user.UserDao;
import com.rainbow.model.user.Suggestion;
import com.rainbow.model.user.User;
import com.rainbow.vo.QueryVo;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public List<User> getAllUsers() {
		List<User> users = userDao.findAll();
		return users;
	}

	@Override
	public int save(User user) {
		int u = userDao.save(user);
		return u;
	}

	@Override
	public void update(User user) {
		userDao.update(user);
		
	}

	@Override
	public List<Suggestion> findAllSuggest(QueryVo queryVo) {
		return userDao.findAllSuggest(queryVo);
		
	}

	@Override
	public String changeSuggestionStatus(int id) {
		return userDao.changeSuggestionStatus(id);
	}

}
