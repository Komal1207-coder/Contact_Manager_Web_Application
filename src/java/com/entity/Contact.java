/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author Komal KRITI
 */
public class Contact {
    
    private int id;
    private String name;
    private String email;
    private String phno;
    private String about;
    private int UserId;
    
     public Contact(){
        super();
    }
    
     public Contact(String name,String email,String phno,String about,int UserId){
        super();
        this.name = name;
        this.email = email;
        this.phno = phno;
        this.about = about;
        this.UserId = UserId;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phno
     */
    public String getPhno() {
        return phno;
    }

    /**
     * @param phno the phno to set
     */
    public void setPhno(String phno) {
        this.phno = phno;
    }

    /**
     * @return the about
     */
    public String getAbout() {
        return about;
    }

    /**
     * @param about the about to set
     */
    public void setAbout(String about) {
        this.about = about;
    }

    /**
     * @return the UserId
     */
    public int getUserId() {
        return UserId;
    }

    /**
     * @param UserId the UserId to set
     */
    public void setUserId(int UserId) {
        this.UserId = UserId;
    }
     
     
     
     
}
