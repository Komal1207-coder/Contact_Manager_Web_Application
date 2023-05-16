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
import static java.lang.System.out;
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
@WebServlet("/update")
public class EditContact extends HttpServlet {

     //String cid="";
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        
       
        String name = req.getParameter("name");
        String email=req.getParameter("email");
        String phno=req.getParameter("phno");
        String about=req.getParameter("about");
       int cid = Integer.parseInt(req.getParameter("cid"));
        
        Contact c= new Contact();
        c.setName(name);
        c.setEmail(email);
        c.setPhno(phno);
        c.setAbout(about);
        c.setId(cid);
        ContactDAO dao=new ContactDAO(DbConnect.getConn());
        HttpSession session= req.getSession();
        boolean f=dao.updateContact(c);
       if(f){
            session.setAttribute("succMsg", "Your Contact updated..");
            resp.sendRedirect("viewContact.jsp");
        }else{
            session.setAttribute("failedMsg", "Something went wrong..");
            resp.sendRedirect("editcontact.jsp?cid="+cid);
        }



   }
}
