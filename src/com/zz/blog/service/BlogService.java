package com.zz.blog.service;

import java.util.List;

import com.zz.blog.po.Friends;
import com.zz.blog.po.Reply;
import com.zz.blog.po.Topic;
import com.zz.blog.po.User;

public interface BlogService {
	public User login(User user);
	public boolean register(User user);
	public User getuserInfo(Integer id);
	public List<Topic> getUserTopics(User user);
	public List<Topic> allTopics();
	public Topic getTopicInfo(Integer topicid);
	public boolean upDateUser(User user);
	public boolean upDateReply(Reply reply);
	public boolean insertFriend(User user);
	public List<Friends> getFriends();
	public boolean publishArticles(Topic topic);
	public boolean deleteArticles(Integer topicid);
}
