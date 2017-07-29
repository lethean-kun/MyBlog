package com.zz.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zz.blog.po.Friends;
import com.zz.blog.po.User;
import com.zz.blog.service.BlogService;

@Controller
public class ShakeFriend {
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/shake")
	public String friend(User user,HttpServletRequest request){
		//传进去userid插入到friend表
		blogService.insertFriend(user);
		//获取到正在摇一摇的所有人
		List<Friends> friends=blogService.getFriends();
		request.setAttribute("friends", friends);
		
		return "friends";
	}

}
