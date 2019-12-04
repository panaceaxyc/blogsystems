package com.blogsystem.service;

import com.blogsystem.entity.Bloger;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/3 11:11
 */
public interface BlogerService {
    Bloger getBlogerById();

    int updateBloger(Bloger bloger);
}
