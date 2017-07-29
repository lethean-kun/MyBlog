package com.zz.blog.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zz.blog.po.Reply;
import com.zz.blog.po.Topic;
import com.zz.blog.po.User;
import com.zz.blog.service.BlogService;

@Controller
public class Register {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/login")
	public String starLog(){
		
		return"login/login";
	}
	//我的博客文章
	@RequestMapping("/myidx")
	public String myidx(HttpSession session,HttpServletRequest request){
		User user=(User)session.getAttribute("user");
		User u=blogService.login(user);
		session.setAttribute("user", u);
		//获取用户文章list
		List<Topic> topics=blogService.getUserTopics(user);
		request.setAttribute("topics", topics);
		return"index";
	}
	//登录
	@RequestMapping("/index")
	public String login(HttpSession session,User user,HttpServletRequest request){
		
		
			User u=blogService.login(user);
			if(u!= null){
				List<Topic> topics=blogService.getUserTopics(u);
				session.setAttribute("user", u);
				request.setAttribute("topics", topics);
				return "index";
			}else{

				request.setAttribute("error", "账号或密码错误");
				return "login/login";
			}
		
	}
	//注册
	@RequestMapping("/register")
	public String register(User user,HttpServletRequest request){
		//注册成功
		if(blogService.register(user)){
			
			request.setAttribute("massage", "注册成功");
			
			return "login/login";
		}else{
			request.setAttribute("massage", "注册失败");
			return "login/login";
		}
	}
	//所有文章
	@RequestMapping("/allTopic")
	private String allTopic(HttpServletRequest request){
//		User user=(User)session.getAttribute("user");
//		session.setAttribute("user", user);
		List<Topic> allTopic=blogService.allTopics();
		request.setAttribute("allTopic", allTopic);
		
		return "allTopics";
		
	}
	//文章详情
	@RequestMapping("/topicInfo/{topicid}")
	private String topicInfo(HttpServletRequest request,@PathVariable("topicid") Integer topicid){

		Topic topic=blogService.getTopicInfo(topicid);
		request.setAttribute("topic", topic);
		
		return "topicsInfo";
		
	}
	//修改用户资料界面
	@RequestMapping("/editUser")
	public String editUser(){

		return "editUser";
		
	}
	//修改资料
	@RequestMapping("/editData")
	public String editData(User user,MultipartFile head_Pic) throws IllegalStateException, IOException{
		//存储图片的路径
		//如果没有上传图片的话 不需要进行头像更改
		if(head_Pic!=null&&head_Pic.getSize()>0){
			String pic_path="E:\\picUpload\\temp\\";
			//重新给图片命名
			String newFileName=UUID.randomUUID()+head_Pic.getOriginalFilename();
			
			File newFile= new File(pic_path+newFileName);
			
			//写入磁盘
			head_Pic.transferTo(newFile);
			user.setHeadPic(newFileName);
		}
		blogService.upDateUser(user);
		
		return "redirect:/myidx.action";
	}
	//查看好友资料
	@RequestMapping("/userFriend/{friendId}")
	public String userFriend(HttpServletRequest request,@PathVariable("friendId") Integer friendId){
		

		
		User userfriend=blogService.getuserInfo(friendId);
		request.setAttribute("userfriend", userfriend);
		
		return "userInfo";
		
	}
	//评论
	@RequestMapping("/review")
	public String review(Reply reply){
		
		
		blogService.upDateReply(reply);
		return "redirect:/allTopic.action";
		
		
	}
	
	// 退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {

		// 清除session
		session.invalidate();
		// 重定向到商品列表页面
		return "redirect:/login.action";
	}
	//发表文章界面
	
	@RequestMapping("/publishArticlesIndex")
	public String publishArticlesIndex(){
		
		return "publishArticles";
	}
	
	//发布文章
	
	@RequestMapping("/publishArticles")
	public String publishArticles(Topic topic,Integer userid){
		topic.setUserid(userid);
		topic.setAddtime(new Date());
		blogService.publishArticles(topic);
		return "redirect:/myidx.action";
	}
	//删除文章
	@RequestMapping("/deleteArticles/{topicid}")
	public String deleteArticles(@PathVariable("topicid") Integer topicid){
		
		blogService.deleteArticles(topicid);
		return "redirect:/myidx.action";
		
	}
	
	


}
