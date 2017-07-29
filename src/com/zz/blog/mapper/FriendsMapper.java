package com.zz.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zz.blog.po.Friends;
import com.zz.blog.po.FriendsExample;
import com.zz.blog.po.User;

public interface FriendsMapper {
    int countByExample(FriendsExample example);

    int deleteByExample(FriendsExample example);

    int deleteByPrimaryKey(Integer id);

    boolean insert(User user) throws Exception;

    int insertSelective(Friends record);

    List<Friends> selectByExample(FriendsExample example);
    List<Friends> selectAllFriends(); 

    Friends selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Friends record, @Param("example") FriendsExample example);

    int updateByExample(@Param("record") Friends record, @Param("example") FriendsExample example);

    int updateByPrimaryKeySelective(Friends record);

    int updateByPrimaryKey(Friends record);
}