package com.blogsystem.mapper;

import com.blogsystem.entity.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/28 22:50
 */
public interface ReplyMapper {
    int insert(Reply reply);    //插入

    List<Reply> selectReplyByReplyId(@Param("replyid") Integer replyid);
}
