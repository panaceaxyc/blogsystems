package com.blogsystem.controller;

import com.blogsystem.entity.Article;
import com.blogsystem.entity.Comment;
import com.blogsystem.service.ArticleService;
import com.blogsystem.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/8/28 21:24
 */
@Controller
public class DetailController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    /**
     * 博客详情页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/article")
    public String detail(@RequestParam("id") Integer id, Model model) {
        //查询评论
        List<Comment> comments=commentService.allComments(id,0,10);
        //查询博客
        Article article=articleService.selectById(id);
        //上一条博客
        Article lastArticle=articleService.selectLastArticle(id);
        //下一条博客
        Article nextArticle=articleService.selectNextArticle(id);
        //更新点击
        Integer clickNum=article.getClick();
        article.setClick(clickNum+1);
        articleService.updateArticle(article);

        //查询热门推荐 前5条博客
        List<Article> hotArticle = articleService.queryHotArticle(5);
        model.addAttribute("hotArticle",hotArticle);

        model.addAttribute("article",article);
        model.addAttribute("comments",comments);
        model.addAttribute("lastArticle",lastArticle);
        model.addAttribute("nextArticle",nextArticle);
        return "article_detail";
    }


}
