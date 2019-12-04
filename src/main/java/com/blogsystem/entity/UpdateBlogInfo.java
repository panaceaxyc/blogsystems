package com.blogsystem.entity;

import java.util.Date;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 22:20
 */
public class UpdateBlogInfo {

    private Integer id;
    private String updatetitle;
    private String updatecontent;
    private Date updatedate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUpdatetitle() {
        return updatetitle;
    }

    public void setUpdatetitle(String updatetitle) {
        this.updatetitle = updatetitle;
    }

    public String getUpdatecontent() {
        return updatecontent;
    }

    public void setUpdatecontent(String updatecontent) {
        this.updatecontent = updatecontent;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }
}
