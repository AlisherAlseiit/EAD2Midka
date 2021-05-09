package com.midka.model;


import java.io.Serializable;

public class Product implements Serializable {


    private Long id;
    private String name = null;
    private String description = null;
    private double price;
    private String img;


    public Product(){

    }

    public Product(String name, String description, double price, String img) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


}
