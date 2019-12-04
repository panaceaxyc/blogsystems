package com.blogsystem.service.impl;

import com.blogsystem.entity.Comment;
import com.blogsystem.mapper.CommentMapper;
import com.blogsystem.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    public CommentMapper commentMapper;

    public List<Comment> allComments(int article_id, int offset, int limit) {
        return commentMapper.queryAll(article_id, offset, limit);
    }

    public int insertComment(Comment comment) {
        return commentMapper.insert(comment);
    }

    public int countAllNum() {
        return commentMapper.countAllNum();
    }

    public boolean delById(Long id) {
        return commentMapper.deleteByPrimaryKey(id) > 0;
    }
}
