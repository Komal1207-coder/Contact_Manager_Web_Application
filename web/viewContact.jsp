<%-- 
    Document   : viewContact
    Created on : 10 Mar, 2022, 12:23:15 PM
    Author     : Komal KRITI
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.conn.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="componenet/allCss.jsp"%>
        <style> 
             body
             {
                 background: url(image/im.jpeg);
                 background-size: cover;
                 background-attachment: fixed;
             }
                     
                         
         </style>
        <style type="text/css">
            .crd-ho:hover{
                background-color: #c1abed;
               
            }
        </style>
        
        
    </head>
    <body>
        <%@include file="componenet/navbar.jsp"%>
      
        <% if (user == null)
        { 
            session.setAttribute("invalidMsg", "Please Login..");
            response.sendRedirect("loginp.jsp");
        }%>
        
        <%
        String succMsg=(String)session.getAttribute("succMsg");
        String errorMsg=(String)session.getAttribute("failedMsg");
        if(succMsg!=null)
        {%>
            <div class="alert alert-success" role="alert"><%=succMsg%></div>
           
        <%
            session.removeAttribute("succMsg");
        }
 if(errorMsg!=null)
                            { 
                             
                             %>
                             <p class="text-danger text-center"><%=errorMsg %></p>
                             <%
                                 session.removeAttribute("failedMsg");
                            }
                            %>
        
        
        
        <div class="container">
            <div class="row p-4">
               
                    
                <%

                    if (user != null) {
                        ContactDAO dao = new ContactDAO(DbConnect.getConn());
                        List<Contact> contact = dao.getAllContact(user.getId());
                        for (Contact c : contact) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body">
                            <h5>Name: <%= c.getName()%></h5>
                            <p>Ph no: <%=c.getPhno()%></p>
                            <p>Email: <%=c.getEmail()%></p>
                            <p>About: <%=c.getAbout()%></p>

                            <div class="text-center">
                                <a href="editcontact.jsp?cid=<%=c.getId()%>" class ="btn btn-success btn-sm text-white">Edit</a>
                                <a href="delete?cid=<%=c.getId()%>" class="btn btn-danger btn-sm text-white">Delete</a>
                            </div>

                        </div>
                    </div>
                </div>
                <% }
                    }
                %>


                    
                    
                
            </div>
        </div>
        
        
    </body>
</html>
