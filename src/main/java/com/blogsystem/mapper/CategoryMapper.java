package com.blogsystem.mapper;

import com.blogsystem.entity.Category;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:17
 */
public interface CategoryMapper {

    List<Category> queryAllCategory();


    int insertCategory(Category category);

    Category getCate(Integer id);

    int update(Category category);

    int delete(Integer id);
}
