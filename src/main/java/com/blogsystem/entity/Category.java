package com.blogsystem.entity;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:13
 */
public class Category {

    private Integer id;

    private String categoryname;

    private String deprecated;

    public String getDeprecated() {
        return deprecated;
    }

    public void setDeprecated(String deprecated) {
        this.deprecated = deprecated;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }
}
