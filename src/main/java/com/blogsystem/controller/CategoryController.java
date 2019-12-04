package com.blogsystem.controller;

import com.blogsystem.entity.Board;
import com.blogsystem.entity.Category;
import com.blogsystem.entity.Msg;
import com.blogsystem.service.BoardService;
import com.blogsystem.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/2 18:42
 */
@Controller
public class CategoryController {


    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BoardService boardService;

    /**
     * 点击 分类列表 来到列表页面
     * @param model
     * @return
     */
    @RequestMapping("/category_manager")
    public String toCategoryPage(Model model) {
        List<Category> categories = categoryService.queryAllCategory();
        model.addAttribute("categoryies",categories);

        //查询未审核的 数量
        int boardCount = boardService.selectCountByStatus();
        model.addAttribute("boardCount",boardCount);


        List<Board> boardNotCheck = boardService.getBoardNotCheck();
        model.addAttribute("bock",boardNotCheck);


        return "admin/category_manager";
    }



    /**
     * 点击更新
     */
    @RequestMapping("/editPage")
    @ResponseBody
    public Msg editPage(@RequestParam("id") Integer id){
        Category cate = categoryService.getCate(id);
        return Msg.success("成功").add("cate",cate);
    }

    /**
     * 更新 电影分类
     * @param category
     * @return
     */
    @RequestMapping("/doEditCategory")
    public String doEditCategory(Category category) {
        int i = categoryService.updateCategory(category);
        if(i>0) {
            return "redirect:/category_manager";
        }
        return "redirect:/category_manager";
    }

    /**
     * 点击添加 去添加页面
     * @return
     */
    @RequestMapping("/category_add")
    public String category_add(){
        return "admin/category_add";
    }

    /**
     * 添加分类
     * @param category
     * @return
     */
    @RequestMapping("/doAddCategory")
    public String doAddCategory(Category category){
        int i = categoryService.insertCategory(category);
        return "redirect:/category_manager";

    }


    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delCategory")
    @ResponseBody
    public Msg delCategory(@RequestParam("id") Integer id) {
        int i = categoryService.delCategory(id);
        if(i>0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

}
