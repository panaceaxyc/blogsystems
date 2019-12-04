package com.blogsystem.mapper;

import com.blogsystem.entity.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);

    int countAllNum();

    List<Comment> queryAll(@Param("article_id") int article_id, @Param("offset") int offset, @Param("limit") int limit);
}