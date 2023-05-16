/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Komal KRITI
 */
public class DbConnect {
    
    private static Connection conn;
    public static Connection getConn(){
        try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook","root","komal");
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
}