<%-- 
    Document   : registerp
    Created on : 10 Mar, 2022, 12:19:01 PM
    Author     : Komal KRITI
--%>

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
                background: url(image/kk.jpg);
                 background-size: cover;
                 background-attachment: fixed;
            }
        </style>
    </head>
    <body style="background-color: #f2f1ed;">
        <%@include file="componenet/navbar.jsp"%>
        
        <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-header text-center">  <span class=" fa fa-external-link fa-3x"></span> <br> <h3><b>REGISTRATION</b></h3>
                        </div>
                           <!-- <h4 class="text-centre text-success">Registration Page</h4>-->
                            <% 
                             String sucssMsg=(String)session.getAttribute("sucssMsg");
                             String errorMsg=(String)session.getAttribute("errorMsg");
                            
                            if(sucssMsg!=null)
                            {
                             %>
                             <p class="text-success text-center"><%=sucssMsg %></p>
                             <%
                                 session.removeAttribute("sucssMsg");
                            }
                         
                             if(errorMsg!=null)
                            { 
                             
                             %>
                             <p class="text-danger text-center"><%=errorMsg %></p>
                             <%
                                 session.removeAttribute("errorMsg");
                            }
                            %>
                            <form action = "register" method = "post">
                                
                                 <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Name</label>
                                    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                
                                <div class="text-center mt-2">
                                     <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <div style="margin-top: 20px">
   <%@include file="componenet/footer.jsp"%>
</div>
    </body>
</html>
