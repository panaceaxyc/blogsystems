package com.blogsystem.service.impl;

import com.blogsystem.entity.UpdateBlogInfo;
import com.blogsystem.mapper.UpdateBlogInfoMapper;
import com.blogsystem.service.UpdateBlogInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 22:23
 */
@Service
public class UpdateBlogInfoServiceImpl implements UpdateBlogInfoService {

    @Autowired
    private UpdateBlogInfoMapper updateBlogInfoMapper;

    @Override
    public List<UpdateBlogInfo> queryAll() {
        return updateBlogInfoMapper.queryAll();
    }
}
