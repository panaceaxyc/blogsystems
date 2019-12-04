package com.blogsystem.service;

import com.blogsystem.entity.Reply;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/28 22:53
 */
public interface ReplyService {
    int insert(Reply reply);

    List<Reply> selectReplyByReplyId(Integer replyid);
}
