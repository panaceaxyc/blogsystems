package com.blogsystem.service;

import com.blogsystem.entity.Category;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:20
 */
public interface CategoryService {


    List<Category> queryAllCategory();

    Category getCate(Integer id);
    int insertCategory(Category category);

    int updateCategory(Category category);

    int delCategory(Integer id);
}
