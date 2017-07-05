/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.modelo;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class User {

    private long id;
    private String name;
    private String email;
    private String password;
    private String type;
    private String pictureProfile;
    private String pictureCover;
    // Constructs

      
    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }
    
    public User(String nome) {
        this.name = nome;
    }

    // Getters and Setters

    public void setPictureProfile(String pictureProfile) {
        this.pictureProfile = pictureProfile;
    }

    public void setPictureCover(String pictureCover) {
        this.pictureCover = pictureCover;
    }

    public String getPictureProfile() {
        return pictureProfile;
    }

    public String getPictureCover() {
        return pictureCover;
    }
    
    
    public void setType(String type) {
        this.type = type;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getType() {
        return type;
    }

    public void setEmail(String emaill) {
        this.email = emaill;
    }

    public void setName(String name) {
        this.name = name;
    }

    
}
