<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
            <style> 
             body
             {
                 background: url(image/new.webp);
                 background-size: cover;
                 background-attachment: fixed;
             }
                     
                         
         
        </style>
        
       <%@include file="componenet/allCss.jsp"%>
    </head>
    <body style="background-color: #f2f1ed;">
        <%@include file="componenet/navbar.jsp"%>
        
        
        
        
        <% if (user == null)
        { 
            session.setAttribute("invalidMsg", "Please Login..");
            response.sendRedirect("loginp.jsp");
        }%>
        
     <!--  <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-centre text-success">Add Contact</h4>-->
     
     
          <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-header  text-black text-center">
                               
                                 <span class=" fa-solid fa-plus fa-3x"></span>
                                <br>
                                <p> <h4><b>Add Contact</b></h4> </p>
                            </div>
                           
                            
                              <% 
                             String sucssMsg=(String)session.getAttribute("succMsg");
                             String errorMsg=(String)session.getAttribute("failedMsg");
                            
                            if(sucssMsg!=null)
                            {
                             %>
                             <p class="text-success text-center"><%=sucssMsg %></p>
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
                            
                            <form action="addContact" method="post">
                                
                                 <input type="hidden" value="<%=user.getId()%>" name="userid">
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Name</label>
                                    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email"  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Phone Number</label>
                                    <input name="phno" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                   
                                </div>
                                
                                 <div class="form-group">
                                     <textarea rows="3" cols="" placeholder="Enter About" name="about" class="form-control">About</textarea>
                                   
                                </div>
                                
                                <div class="text-center mt-2">
                                     <button type="submit" class="btn btn-primary">Save Contact</button>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </body>
</html>
