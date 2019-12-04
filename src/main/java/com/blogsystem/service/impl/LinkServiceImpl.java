package com.blogsystem.service.impl;

import com.blogsystem.entity.Link;
import com.blogsystem.mapper.LinkMapper;
import com.blogsystem.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 16:47
 */
@Service
public class LinkServiceImpl implements LinkService {

    @Autowired
    private LinkMapper linkMapper;

    @Override
    public List<Link> selectAllLinks() {
        return linkMapper.selectAllLinks();
    }

    @Override
    public Link getLinkById(Integer id) {
        return linkMapper.getLinkById(id);
    }

    @Override
    public int updateLink(Link link) {
        return linkMapper.updateLink(link);
    }

    @Override
    public int insertLink(Link link) {
        return linkMapper.insertLink(link);
    }

    @Override
    public int delete(Integer id) {
        return linkMapper.delete(id);
    }
}
