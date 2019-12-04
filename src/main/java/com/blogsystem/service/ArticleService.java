package com.blogsystem.service;

import com.blogsystem.entity.Article;

import java.util.List;

public interface ArticleService {

    Article selectById(Integer id);

    Article selectLastArticle(Integer id);

    Article selectNextArticle(Integer id);

    List<Article> queryAll();

    int countAllNum();

    boolean updateArticle(Article article);

    int deleteById(Integer id);

    int insertSelective(Article article);

    int selectCount();

    List<Article> selectByWord(String word);

    List<Article> queryHotArticle(Integer id);

}
