/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Komal KRITI
 */
@WebServlet("/addContact")
public class AddContact extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        
        
        int userId =Integer.parseInt(req.getParameter("userid"));
        String name = req.getParameter("name");
        String email=req.getParameter("email");
        String phno=req.getParameter("phno");
        String about=req.getParameter("about");
        
        Contact c= new Contact(name, email, phno, about, userId);
        ContactDAO dao=new ContactDAO(DbConnect.getConn());
        
        HttpSession session= req.getSession();
        boolean f=dao.saveContact(c);
        if(f){
            session.setAttribute("succMsg", "Your Contact Saved..");
            resp.sendRedirect("addCont.jsp");
        }else{
             session.setAttribute("failedMsg", "Something went wrong..");
            resp.sendRedirect("addCont.jsp");
        }
    }
}
