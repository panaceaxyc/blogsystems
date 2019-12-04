package com.blogsystem.entity;

import java.util.Date;

/**
 * @author Yuyunkuo
 * @Description:  二级回复
 * @date 2019/11/28 22:47
 */
public class Reply {
    private Integer id;

    private Integer commentid;  //评论者的ID

    private Integer replyid;    //回复者的ID

    private String content;     //回复的内容

    private Integer articleid;  //评论博客ID

    private Date date;          //回复日期

    private String username;    //评论者姓名

    private String photo;       //头像

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public Integer getReplyid() {
        return replyid;
    }

    public void setReplyid(Integer replyid) {
        this.replyid = replyid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }
}
