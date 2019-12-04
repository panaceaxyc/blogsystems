package com.blogsystem.mapper;

import com.blogsystem.entity.Bloger;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/3 11:09
 */
public interface BlogerMapper {
    Bloger getBlogerById();

    int update(Bloger bloger);
}
