package com.blogsystem.entity;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:11
 */
public class Movie {
    private Integer id;
    private String movietitle;
    private String movieinfo;
    private String moviecontent;
    private Integer categoryid;
    private String photo;
    private String username;
    private Date createdate;
    private Integer userid;
    private String categoryname;
    private MultipartFile file;
    public MultipartFile getFile() {
        return file;
    }
    public void setFile(MultipartFile file) {
        this.file = file;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMovietitle() {
        return movietitle;
    }

    public void setMovietitle(String movietitle) {
        this.movietitle = movietitle;
    }

    public String getMovieinfo() {
        return movieinfo;
    }

    public void setMovieinfo(String movieinfo) {
        this.movieinfo = movieinfo;
    }

    public String getMoviecontent() {
        return moviecontent;
    }

    public void setMoviecontent(String moviecontent) {
        this.moviecontent = moviecontent;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }
}
