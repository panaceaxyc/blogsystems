package com.blogsystem.service.impl;

import com.blogsystem.entity.Reply;
import com.blogsystem.mapper.ReplyMapper;
import com.blogsystem.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/28 22:54
 */
@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public int insert(Reply reply) {
        return replyMapper.insert(reply);
    }
    
    @Override
    public List<Reply> selectReplyByReplyId(Integer replyid) {
        return replyMapper.selectReplyByReplyId(replyid);
    }
}
