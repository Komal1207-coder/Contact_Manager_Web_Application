/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
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
@WebServlet("/delete")
public class DeleteContact extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        
        int cid=Integer.parseInt(req.getParameter("cid"));
        ContactDAO dao=new ContactDAO(DbConnect.getConn());
        
        boolean f=dao.deleteContactById(cid);
        HttpSession session=req.getSession();
        
        if(f){
            session.setAttribute("succMsg","Contact Deleted successfully");
            resp.sendRedirect("viewContact.jsp");
        }else{
             session.setAttribute("failedMsg","Something went wrong..");
            resp.sendRedirect("viewContact.jsp");
        }
    }
    
}
