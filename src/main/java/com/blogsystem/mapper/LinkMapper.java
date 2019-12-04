package com.blogsystem.mapper;

import com.blogsystem.entity.Link;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 16:46
 */
public interface LinkMapper {

    List<Link> selectAllLinks();


    Link getLinkById(Integer id);

    int updateLink(Link link);

    int insertLink(Link link);

    int delete(Integer id);
}
