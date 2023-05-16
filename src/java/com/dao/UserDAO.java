/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Komal KRITI
 */
public class UserDAO {
    private Connection conn;
    
    public UserDAO(Connection conn){
        super();
        this.conn = conn;
    }
    
    public boolean userRegister(User u)
    {
        boolean f = false;
        
        try{
            String sql ="insert into user(name,email,password) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            
            int i=ps.executeUpdate();
            if(i==1){
                f = true;
            }
            
            
        }catch(Exception e){
           e.printStackTrace();
        }
        return f;
    }
    
    public User loginUser(String em,String p) throws SQLException{
         User user= null;
          
        try{
            String sql = "select * from user where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,em);
            ps.setString(2, p);

            ResultSet rs =ps.executeQuery();   
            
            while(rs.next())
            {
                  user = new User();
                  user.setId(rs.getInt(1));
                  user.setName(rs.getString(2));
                  user.setEmail(rs.getString(3));
                  user.setPassword(rs.getString(4));
            }
        
    }catch(Exception e){
        e.printStackTrace();
    }
       
    return user;
}
    
}
