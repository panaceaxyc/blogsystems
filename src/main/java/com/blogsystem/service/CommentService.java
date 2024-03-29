package com.blogsystem.service;

import com.blogsystem.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> allComments(int article_id, int offset, int limit);

    int insertComment(Comment comment);

    int countAllNum();

    boolean delById(Long id);
}
