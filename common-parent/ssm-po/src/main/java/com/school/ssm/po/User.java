package com.school.ssm.po;

import lombok.Data;

import java.util.List;

@Data
public class User {
    private Integer uuid;

    private String username;

    private String password;

    private String tel;

    private String email;

    private String account;

    private  String sex;

    private String grants;

    private List<Favorities> favorities;

}