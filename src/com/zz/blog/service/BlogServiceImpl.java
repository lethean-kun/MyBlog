package com.zz.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.zz.blog.mapper.FriendsMapper;
import com.zz.blog.mapper.ReplyMapper;
import com.zz.blog.mapper.TopicMapper;
import com.zz.blog.mapper.UserMapper;
import com.zz.blog.po.Friends;
import com.zz.blog.po.Reply;
import com.zz.blog.po.Topic;
import com.zz.blog.po.User;

public class BlogServiceImpl implements BlogService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private TopicMapper topicMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private FriendsMapper friendsMapper;
	
	//判断登录用户密码是否正确
	@Override
	public User login(User user) {
		if(user!=null){
			User u=userMapper.selectByUser(user);
			if(u!=null&&u.getPassword().equals(user.getPassword())){
				return u;
			}else{
				return null;
			}
		}else
			return null;
	}

	//实现用户注册
	@Override
	public boolean register(User user) {
		if(user!=null){
			userMapper.insert(user);
			return true;
		}else
			return false;

	}

	//获取登录用户的所有文章
	@Override
	public List<Topic> getUserTopics(User user) {
		if(user!=null){
			
			List<Topic> list=topicMapper.selectByUser(user);
			return list;
		}else
		return null;
	}

	@Override
	public List<Topic> allTopics() {
		
		List<Topic> list=topicMapper.findAllTopic();
		return list;
	}

	@Override
	public boolean upDateUser(User user) {

		userMapper.updateByPrimaryKeySelective(user);
		return true;
	}

	@Override
	public boolean upDateReply(Reply reply) {
		// TODO Auto-generated method stub
		replyMapper.insert(reply);
		topicMapper.updateByReply(reply.getTopicid());
		return true;
	}

	@Override
	public User getuserInfo(Integer id) {
		
		User user=userMapper.selectByPrimaryKey(id);
		
		return user;
	}
	//插入到friend表
	@Override
	public boolean insertFriend(User user) {
		try {
			if(friendsMapper.insert(user))
				return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
				return false;
		}
		return true;
	}
	//获取到friend表里所有User
	@Override
	public List<Friends> getFriends() {
		List<Friends> friends=friendsMapper.selectAllFriends();
		return friends;
	}

	@Override
	public boolean publishArticles(Topic topic) {
		
		int result = topicMapper.insert(topic);
		if(result==1)
			return true;
		return false;
	}

	@Override
	public boolean deleteArticles(Integer topicid) {
		
		int result = topicMapper.deleteByPrimaryKey(topicid);
		if(result==1)
			return true;
		return false;
	}

	@Override
	public Topic getTopicInfo(Integer topicid) {
		
		Topic topic = topicMapper.selectByPrimaryKey(topicid);
		return topic;
	}


}
