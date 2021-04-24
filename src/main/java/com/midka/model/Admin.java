package com.midka.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.*;


public class Admin implements Serializable {


    private Long id;
    private String name = null;
    private String password = null;


    private boolean amILogin = false;

    public Admin() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String name(String name) {
        return "hello: " + name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
