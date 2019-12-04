package com.blogsystem.entity;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 16:42
 */
public class Lable {
    private Integer id;

    private String lableName;

    private String lableUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLableName() {
        return lableName;
    }

    public void setLableName(String lableName) {
        this.lableName = lableName;
    }

    public String getLableUrl() {
        return lableUrl;
    }

    public void setLableUrl(String lableUrl) {
        this.lableUrl = lableUrl;
    }
}
