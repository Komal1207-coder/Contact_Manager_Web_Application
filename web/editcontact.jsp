<%-- 
    Document   : editcontact
    Created on : 21 Mar, 2022, 6:32:30 PM
    Author     : Komal KRITI
--%>

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
    </head>
    <body>
        
        
       <%@include file="componenet/navbar.jsp"%>
         <% if (user == null)
        { 
            session.setAttribute("invalidMsg", "Please Login..");
            response.sendRedirect("loginp.jsp");
        }
         %>
        
         
       
          <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-header  text-black text-center">
                               
                                 <span class=" fa-solid fa-plus fa-3x"></span>
                                <br>
                                <p> <h4><b>Edit Contact</b></h4> </p>
                            </div>
                            
                              <% 
                             
                             String errorMsg=(String)session.getAttribute("failedMsg");
                            
                            
                         
                             if(errorMsg!=null)
                            { 
                             
                             %>
                             <p class="text-danger text-center"><%=errorMsg %></p>
                             <%
                                 session.removeAttribute("failedMsg");
                            }
                            %>
                            
                            <form action="update" method="post">
                                
                                <% 
                                    
                                    int cid = Integer.parseInt(request.getParameter("cid"));
                                    ContactDAO dao= new ContactDAO(DbConnect.getConn());
                                    Contact c=dao.getContactById(cid);
                                %>    
                                
                                <input type="hidden" value="<%=cid%>" name="cid">
                                
                                 <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Name</label>
                                    <input value="<%=c.getName()%>" name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=c.getEmail()%>" name="email"  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Phone Number</label>
                                    <input value="<%=c.getPhno()%>" name="phno" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                   
                                </div>
                                
                                 <div class="form-group">
                                     <textarea rows="3" cols="" placeholder="Enter About" name="about" class="form-control"><%=c.getAbout()%></textarea>
                                   
                                </div>
                                
                                <div class="text-center mt-2">
                                     <button type="submit" class="btn btn-success">Update Contact</button>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 215px">
      <div class="conatiner-fluid bg-primary p-2">
    <h5 class="text-white text-center"> Developed and designed by Komal Kriti</h5>
</div>
        </div>
         
    </body>
</html>
