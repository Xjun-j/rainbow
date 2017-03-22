package com.rainbow.service.user;

import java.util.List;

import com.rainbow.model.user.Suggestion;
import com.rainbow.model.user.User;
import com.rainbow.vo.QueryVo;

public interface  UserService {
	public List<User> getAllUsers();
	public int save(User user);
	public void update(User user);
	public List<Suggestion> findAllSuggest(QueryVo queryVo);
	public String changeSuggestionStatus(int id);
}
