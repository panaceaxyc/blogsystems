package com.blogsystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.blogsystem.mapper")
public class BlogsystemsApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlogsystemsApplication.class, args);
    }

}
