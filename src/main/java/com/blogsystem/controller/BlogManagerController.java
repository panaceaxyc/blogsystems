package com.blogsystem.controller;

import com.blogsystem.entity.Admin;
import com.blogsystem.entity.Article;
import com.blogsystem.entity.Board;
import com.blogsystem.service.ArticleService;
import com.blogsystem.service.BoardService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * 博客管理
 * @author Yuyunkuo
 * @Description:   BlogManagerController 是博客管理控制器
 * @date 2019/8/28 22:26
 */
@Controller
public class BlogManagerController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private BoardService boardService;

    /**
     * 首先点击链接到这里,然后跳到对应的页面
     * @return
     */
    @RequestMapping("/admin/article/add")
    public String articleAdd(){
        return "/admin/blog_add";
    }


    /**
     * 处理添加
     * @param request
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/article/add/do")
    public String articleAddDo(Article article,HttpServletRequest request, RedirectAttributes redirectAttributes){
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String fileName = UUID.randomUUID().toString() + article.getFile().getOriginalFilename()
                .substring(article.getFile().getOriginalFilename().lastIndexOf("."));
        String returnUrl =request.getContextPath()+"upload/";
        String path = request.getSession().getServletContext().getRealPath("upload") +"\\"+fileName;
        Integer userId = admin.getId();//获取用户名:
        try {
            FileUtils.copyInputStreamToFile(article.getFile().getInputStream(), new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }

        article.setPic(returnUrl+fileName);
        article.setClick(0);
        article.setTime(new Date());
        article.setUserid(userId);

        if (articleService.insertSelective(article)>0){
            redirectAttributes.addFlashAttribute("succ", "发表文章成功！");
            return "redirect:/admin/article/search?word=";
        }else {
            redirectAttributes.addFlashAttribute("error", "发表文章失败！");
            return "redirect:/admin/article/add";
        }
    }

    /**
     * 搜索 分页
     * @param model
     * @return
     */
    @RequestMapping(value = "/admin/article/search")
    public String articleSearch(@RequestParam("word") String word,
                                @RequestParam(value = "pn",defaultValue = "1") Integer pn,
                                Model model){

        PageHelper.startPage(pn, 3);
        List<Article> articles=articleService.selectByWord(word);
        PageInfo page = new PageInfo(articles,5);
        model.addAttribute("pageInfo",page);
        model.addAttribute("word",word);

        //查询未审核的 数量
        int boardCount = boardService.selectCountByStatus();
        model.addAttribute("boardCount",boardCount);

        List<Board> boardNotCheck = boardService.getBoardNotCheck();
        model.addAttribute("bock",boardNotCheck);

        return  "/admin/blog_manager" ;
    }

    /**
     * 删除 JSON
     * @param request
     * @return
     */
    @RequestMapping(value = "/api/article/del", method = RequestMethod.POST)
    public @ResponseBody
    Object loginCheck(HttpServletRequest request) {
        int id=Integer.parseInt(request.getParameter("id"));
        int result=articleService.deleteById(id);
        HashMap<String, String> res = new HashMap<String, String>();
        if (result==1){
            res.put("stateCode", "1");
        }else {
            res.put("stateCode", "0");
        }
        return res;
    }

    /**
     * 博客修改页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/admin/article/edit")
    public String articleEdit(HttpServletRequest request,Model model){
        int id=Integer.parseInt(request.getParameter("id"));
        Article article=articleService.selectById(id);
        model.addAttribute("article",article);
        return "admin/article_edit";
    }

    /**
     * 博客编辑处理
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/admin/article/edit/do")
    public String articleEditDo(
            Article article,
            HttpServletRequest request,Model model){
        //Article article=new Article();
        Integer id = Integer.parseInt(request.getParameter("id"));
        String fileName = UUID.randomUUID().toString() + article.getFile().getOriginalFilename()
                .substring(article.getFile().getOriginalFilename().lastIndexOf("."));
        String returnUrl =request.getContextPath()+"upload/";
        String path = request.getSession().getServletContext().getRealPath("upload") +"\\"+fileName;
        try {
            FileUtils.copyInputStreamToFile(article.getFile().getInputStream(), new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        article.setPic(returnUrl+fileName);
        article.setTime(new Date());
        if (articleService.updateArticle(article)){
            model.addAttribute("succ", "修改文章成功！");
            return "redirect:/admin/article/search?word=";
        }else {
            model.addAttribute("error", "修改文章失败！");
            return "redirect:/admin/article/edit?id="+id;
        }
    }
}
