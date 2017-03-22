package com.rainbow.dao.user;

import java.util.List;

import com.rainbow.model.user.Suggestion;
import com.rainbow.model.user.User;
import com.rainbow.vo.QueryVo;

public interface UserDao {
    public int save(User u);
    public void update(User u);
    public List<User> findAll();
	public List<Suggestion> findAllSuggest(QueryVo queryVo);
	public String changeSuggestionStatus(int id);
}
