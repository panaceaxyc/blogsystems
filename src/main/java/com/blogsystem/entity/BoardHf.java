package com.blogsystem.entity;

import java.util.Date;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/1 13:50
 */
public class BoardHf {

    private Integer id;

    private Integer boardid;

    private String content;

    private Date date;

    private String photo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBoardid() {
        return boardid;
    }

    public void setBoardid(Integer boardid) {
        this.boardid = boardid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
