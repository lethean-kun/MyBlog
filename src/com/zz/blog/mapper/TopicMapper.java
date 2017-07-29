package com.zz.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zz.blog.po.Topic;
import com.zz.blog.po.TopicExample;
import com.zz.blog.po.User;

public interface TopicMapper {
    int countByExample(TopicExample example);

    int deleteByExample(TopicExample example);

    int deleteByPrimaryKey(Integer topicid);

    int insert(Topic record);

    int insertSelective(Topic record);

    List<Topic> selectByExample(TopicExample example);
    List<Topic> selectByUser(User user);
    List<Topic> findAllTopic();
    int updateByReply(Integer topicid);

    Topic selectByPrimaryKey(Integer topicid);

    int updateByExampleSelective(@Param("record") Topic record, @Param("example") TopicExample example);

    int updateByExample(@Param("record") Topic record, @Param("example") TopicExample example);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);
}