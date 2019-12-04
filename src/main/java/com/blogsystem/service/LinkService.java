package com.blogsystem.service;

import com.blogsystem.entity.Link;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 16:47
 */
public interface LinkService {
    List<Link> selectAllLinks();

    Link getLinkById(Integer id);

    int updateLink(Link link);

    int insertLink(Link link);

    int delete(Integer id);

}
