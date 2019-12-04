package com.blogsystem.controller;

import com.blogsystem.entity.*;
import com.blogsystem.service.BoardService;
import com.blogsystem.service.CategoryService;
import com.blogsystem.service.LableService;
import com.blogsystem.service.MovieService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:47
 */
@Controller
public class MovieController {


    @Autowired
    private LableService lableService;

    @Autowired
    private MovieService movieService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BoardService boardService;
    /**
     * @deprecated 推荐电影 跳转页面 (携带数据)
     * @param model
     * @return
     */
    /*@RequestMapping("/movie")
    public String toMovie(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model) {
        //这俩参数 第一个代表页码. 第二个代表大小
        PageHelper.startPage(pn, 5);
        List<Movie> movies = movieService.queryMovies();
        PageInfo page = new PageInfo(movies,6);

        //查询所有分类
        List<Category> categories = categoryService.queryAllCategory();

        //查询所有的lable
        List<Lable> lables = lableService.selectAllLable();

        model.addAttribute("lables",lables);//添加lable
        model.addAttribute("categoryies",categories);
        model.addAttribute("pageInfo",page);
        return "movie";
    }*/

    /**
     * @deprecated 电影详情 页面
     * @param id
     * @param model
     * @return
     *
     */
    @RequestMapping("/movieDetail")
    public String movieDetail(@RequestParam("id") Integer id, @RequestParam("cateId") Integer cateId, Model model) {
        Movie movie = movieService.getMovieById(id);
        model.addAttribute("movie", movie);

        //查询所有分类
        List<Category> categories = categoryService.queryAllCategory();
        model.addAttribute("categoryies", categories);

        //查询所有的lable
        List<Lable> lables = lableService.selectAllLable();
        model.addAttribute("lables", lables);//添加lable

        model.addAttribute("cateId", cateId);//添加分类识别 1：文艺 2：科技 3：。。。。

        return "movieDetail";
    }


    /**
     * @deprecated 根据分类ID来查询下面的电影 ： 如果ID为空那么查询所有
     * @param categoryId
     * @param model
     * @return
     */
    @RequestMapping("/searchMovieByCategoryId")
    public String searchMovieByCategoryId(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                          @RequestParam("categoryId") Integer categoryId,
                                          @RequestParam("categoryName") String categoryName,
                                          Model model) {
        if (categoryId == null || categoryName.equals("")) {
            //这俩参数 第一个代表页码. 第二个代表大小
            PageHelper.startPage(pn, 5);
            List<Movie> movies = movieService.queryMovies();
            PageInfo page = new PageInfo(movies, 6);

            //查询所有分类
            List<Category> categories = categoryService.queryAllCategory();

            //查询所有的lable
            List<Lable> lables = lableService.selectAllLable();

            model.addAttribute("lables", lables);//添加lable
            model.addAttribute("categoryies", categories);
            model.addAttribute("pageInfo", page);
            return "movie";
        } else {

            List<Movie> movies = movieService.queryMoviesByCategoryId(categoryId);
            model.addAttribute("categoryId",categoryId);//把categoryId存放起来

            model.addAttribute("categoryName",categoryName);//把categoryName存放起来

            PageInfo page = new PageInfo(movies, 6);
            model.addAttribute("pageInfo", page);
            //查询所有分类
            List<Category> categories = categoryService.queryAllCategory();

            //查询所有的lable
            List<Lable> lables = lableService.selectAllLable();

            model.addAttribute("lables", lables);//添加lable
            model.addAttribute("categoryies", categories);
            return "movie";
        }
    }

    /**
     * 电影管理 跳转页面
     * @return
     */
    @RequestMapping("/movie_manager")
    public String movie_Manager(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                @RequestParam("categoryId") Integer categoryId,
                                Model model) {
        System.out.println(categoryId);
        if (categoryId == null) {
            //这俩参数 第一个代表页码. 第二个代表大小
            PageHelper.startPage(pn, 5);
            List<Movie> movies = movieService.queryMovies();
            PageInfo page = new PageInfo(movies, 6);
            //查询所有分类
            List<Category> categories = categoryService.queryAllCategory();
            model.addAttribute("categoryies", categories);
            model.addAttribute("pageInfo", page);

            //查询未审核的 数量
            int boardCount = boardService.selectCountByStatus();
            model.addAttribute("boardCount",boardCount);


            List<Board> boardNotCheck = boardService.getBoardNotCheck();
            model.addAttribute("bock",boardNotCheck);


            return "admin/movie_manager";
        } else {
            List<Movie> movies = movieService.queryMoviesByCategoryId(categoryId);
            model.addAttribute("categoryId",categoryId);//把categoryId存放起来
            PageInfo page = new PageInfo(movies, 6);
            model.addAttribute("pageInfo", page);
            //查询所有分类
            List<Category> categories = categoryService.queryAllCategory();

            //查询未审核的 数量
            int boardCount = boardService.selectCountByStatus();
            model.addAttribute("boardCount",boardCount);


            List<Board> boardNotCheck = boardService.getBoardNotCheck();
            model.addAttribute("bock",boardNotCheck);




            Category cate = categoryService.getCate(categoryId);
            model.addAttribute("categoryName",cate.getCategoryname());
            model.addAttribute("categoryies", categories);
            return "admin/movie_manager";
        }
    }

    /**
     * 点击添加    去到添加页面
     * @param model
     * @return
     */
    @RequestMapping("/movie_add")
    public String addMovie(Model model){
        //查询所有分类
        List<Category> categories = categoryService.queryAllCategory();
        model.addAttribute("categoryies", categories);

        //查询未审核的 数量
        int boardCount = boardService.selectCountByStatus();
        model.addAttribute("boardCount",boardCount);


        List<Board> boardNotCheck = boardService.getBoardNotCheck();
        model.addAttribute("bock",boardNotCheck);

        return "admin/movie_add";
    }

    /**
     * 处理添加
     * @param movie
     * @param request
     * @return
     */
    @RequestMapping("/doAddMovie")
    public String doAddMovie (Movie movie, HttpServletRequest request) {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String fileName = UUID.randomUUID().toString() + movie.getFile().getOriginalFilename()
                .substring(movie.getFile().getOriginalFilename().lastIndexOf("."));
        String returnUrl =request.getContextPath()+"upload/";
        String path = request.getSession().getServletContext().getRealPath("upload") +"\\"+fileName;
        Integer userId = admin.getId();//获取用户名:
        try {
            FileUtils.copyInputStreamToFile(movie.getFile().getInputStream(), new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        movie.setPhoto(returnUrl+fileName);
        movie.setCreatedate(new Date());
        movie.setUserid(userId);
        int i = movieService.insertMovie(movie);
        if (i >0 ) {
            return "redirect:/movie_manager?categoryId=&categoryName=";
        }
        return "redirect:/movie_add";
    }

    /**
     * 点击修改 来到修改页面
     * @return
     */
    @RequestMapping("/movie_edit")
    public String toMovie_edit(@RequestParam("id") Integer id,Model model) {
        Movie movieById = movieService.getMovieById(id);
        model.addAttribute("movies",movieById);
        //查询所有分类
        List<Category> categories = categoryService.queryAllCategory();
        model.addAttribute("categoryies", categories);

        return "admin/movie_edit";
    }

    /**
     * 更新电影信息
     * @param movie
     * @return
     */
    @RequestMapping("/doEditMovie")
    public String doEditMovie(Movie movie) {
        /*String fileName = UUID.randomUUID().toString() + movie.getFile().getOriginalFilename()
                .substring(movie.getFile().getOriginalFilename().lastIndexOf("."));
        String returnUrl =request.getContextPath()+"upload/";
        String path = request.getSession().getServletContext().getRealPath("upload") +"\\"+fileName;
        try {
            FileUtils.copyInputStreamToFile(movie.getFile().getInputStream(), new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        movie.setPhoto(returnUrl+fileName);*/
        movie.setCreatedate(new Date());
        int i = movieService.updateByPrimaryKeySelective(movie);
        if (i >0 ) {
            return "redirect:/movie_manager?categoryId=&categoryName=";
        }
        return "redirect:/movie_edit";
    }


    /**
     * 删除 电影
     * @param id
     * @return
     */
    @RequestMapping("/delMovie")
    @ResponseBody
    public Msg delMovie(@RequestParam("id") Integer id) {
        int i = movieService.delMovie(id);
        if(i>0) {
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }


}
