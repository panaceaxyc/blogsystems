package com.blogsystem.entity;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 16:42
 */
public class Link {
    private Integer id;

    private String linkName;

    private String linkUrl;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }
}
