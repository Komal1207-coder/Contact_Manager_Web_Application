/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Komal KRITI
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
       String email=req.getParameter("email");
       String pass=req.getParameter("password");
       
       UserDAO dao=new UserDAO(DbConnect.getConn());
       User u = null;
        try {
            u = dao.loginUser(email, pass);
        } catch (SQLException ex) {
            //Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session = req.getSession();
       if(u!=null)
       {
            session.setAttribute("user", u);
            resp.sendRedirect("index.jsp");
      // System.out.println("user is available" + u);
       }
       else{
            session.setAttribute("invalidMsg", "Invalid email or password");
            resp.sendRedirect("loginp.jsp");
          // System.out.println("User is not available" + u);
       }
    }
    
}
