<%-- 
    Document   : loginp
    Created on : 10 Mar, 2022, 12:17:52 PM
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
                background: url(image/login.jpg);
                background-size: cover;
                background-attachment: fixed;

            }  


            .card-header{
                width: 80%;
                height: 100%;
                margin: 0 auto;
            }




        </style>
    </head>
    <body style="background-color: #f2f1ed;">
        <%@include file="componenet/navbar.jsp"%>

        <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-header  text-black text-center">
                                <span class=" fa fa-user-circle fa-3x" >  </span>
                                <br>
                                <p> <h4><b> Login here</b></h4> </p>
                            </div>

                            <!-- <h4 class="text-centre text-success">Login</h4> -->




                            <%                                   String invalidMsg = (String) session.getAttribute("invalidMsg");
                                if (invalidMsg != null) {%>
                            <p class = "text-danger text-center"><%=invalidMsg%></p>
                            <%
                                    session.removeAttribute("invalidMsg");
                                }
                            %>

                            <%
                                String logMsg = (String) session.getAttribute("logMsg");
                                if (logMsg != null) {%>
                            <p class = "text-success text-center"><%=logMsg%></p>
                            <%
                                    session.removeAttribute("logMsg");
                                }
                            %>



                            <form action="login" method="post">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>

                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 85.7px;">
            <%@include file="componenet/footer.jsp"%>
        </div>


    </body>
</html>
