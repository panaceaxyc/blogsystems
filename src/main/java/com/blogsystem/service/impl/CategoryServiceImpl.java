package com.blogsystem.service.impl;

import com.blogsystem.entity.Category;
import com.blogsystem.mapper.CategoryMapper;
import com.blogsystem.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:20
 */
@Service
public class CategoryServiceImpl implements CategoryService{

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> queryAllCategory() {
        return categoryMapper.queryAllCategory();
    }

    @Override
    public Category getCate(Integer id) {
        return categoryMapper.getCate(id);
    }


    @Override
    public int insertCategory(Category category) {
        return categoryMapper.insertCategory(category);
    }

    @Override
    public int updateCategory(Category category) {
        return categoryMapper.update(category);
    }

    @Override
    public int delCategory(Integer id) {
        return categoryMapper.delete(id);
    }
}
