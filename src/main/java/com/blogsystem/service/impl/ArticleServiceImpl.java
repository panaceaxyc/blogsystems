package com.blogsystem.service.impl;

import com.blogsystem.entity.Article;
import com.blogsystem.mapper.ArticleMapper;
import com.blogsystem.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    public ArticleMapper articleMapper;

    public Article selectById(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    public List<Article> queryAll() {
        return articleMapper.queryAll();
    }

    public int countAllNum() {
        return articleMapper.countAllNum();
    }

    public boolean updateArticle(Article article) {
        return articleMapper.updateByPrimaryKeySelective(article)>0;
    }

    public int deleteById(Integer id) {
        return articleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Article article) {
        return articleMapper.insertSelective(article);
    }

    public int selectCount() {
        return articleMapper.countAllNum();
    }

    public List<Article> selectByWord(String word) {
        return articleMapper.selectByWord(word);
    }

    @Override
    public List<Article> queryHotArticle(Integer id) {
        return articleMapper.queryHotArticle(id);
    }

    public Article selectLastArticle(Integer id) {
        return articleMapper.selectLastArticle(id);
    }

    public Article selectNextArticle(Integer id) {
        return articleMapper.selectNextArticle(id);
    }
}
