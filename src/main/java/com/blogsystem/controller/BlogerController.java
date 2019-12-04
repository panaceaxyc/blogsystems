package com.blogsystem.controller;

import com.blogsystem.entity.Bloger;
import com.blogsystem.entity.Board;
import com.blogsystem.service.BlogerService;
import com.blogsystem.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/3 11:12
 */
@Controller
@RequestMapping("/admin")
public class BlogerController {

    @Autowired
    private BlogerService blogerService;


    @Autowired
    private BoardService boardService;

    /**
     * 去到 编辑博主信息页面
     * @param model
     * @return
     */
    @RequestMapping("/bloger_manager")
    public String bloger_manager(Model model) {
        Bloger bloger = blogerService.getBlogerById();
        model.addAttribute("bloger",bloger);


        //查询未审核的 数量
        int boardCount = boardService.selectCountByStatus();
        model.addAttribute("boardCount",boardCount);

        List<Board> boardNotCheck = boardService.getBoardNotCheck();
        model.addAttribute("bock",boardNotCheck);


        return "admin/bloger_manager";
    }

    /**
     * 更新
     * @param bloger
     * @return
     */
    @RequestMapping("/updateBloger")
    public String updateBloger(Bloger bloger) {
        int i = blogerService.updateBloger(bloger);
        if(i>0) {
            return "redirect:/admin/bloger_manager";
        }else{
            return "redirect:/admin/bloger_manager";
        }
    }

}
