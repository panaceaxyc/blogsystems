package com.blogsystem.service.impl;

import com.blogsystem.entity.Bloger;
import com.blogsystem.mapper.BlogerMapper;
import com.blogsystem.service.BlogerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/3 11:11
 */
@Service
public class BlogerServiceImpl implements BlogerService {
    @Autowired
    private BlogerMapper blogerMapper;

    @Override
    public Bloger getBlogerById() {
        return blogerMapper.getBlogerById();
    }

    @Override
    public int updateBloger(Bloger bloger) {
        return blogerMapper.update(bloger);
    }
}
