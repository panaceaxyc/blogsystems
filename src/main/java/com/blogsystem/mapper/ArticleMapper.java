package com.blogsystem.mapper;

import com.blogsystem.entity.Article;

import java.util.List;

public interface ArticleMapper {

    int deleteByPrimaryKey(Integer id);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    Article selectLastArticle(Integer id);

    Article selectNextArticle(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    int countAllNum();

    List<Article> queryAll();

    List<Article> selectByWord(String word);

    List<Article> queryHotArticle(Integer id);
}