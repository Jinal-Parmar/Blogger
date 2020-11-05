<%@page import="com.tech.blog.entities.message"%>
<!--     error page:...design
         userdao: user getuserbyemailandpass(String email,String pass)
         login syatem:.... 
-->



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--drag & drop-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>


        <style>
            /*banner style*/
            .banner-background{
                clip-path: polygon(20% 0%, 90% 0%, 100% 10%, 100% 100%, 80% 100%, 10% 100%, 0 90%, 0 0);

            }
        </style>


    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar.jsp"%>




        <main class="d-flex align-items-center p-5 primary-background banner-background " style="height:80vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">



                        <div class="card">

                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-circle fa-3x"></span><p> Login here</p>

                            </div>

                            <%
                                message m = (message) session.getAttribute("msg");

                                if (m != null) 
                                {
                            %>

                            <div class="alert <%= m.getCssclass() %>" role="alert">      <!--<div class="alert alert-dark" role="alert">-->
                                    <%= m.getContent() %>
                            </div>



                            <%   
                                session.removeAttribute("msg");//1 hi bar msg dikhega
                                }
                            %>




                            <div class="card-body">
                                <!--form-->
                                <form action="loginservlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="jemail" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="jpass" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>



                                    <div class="container text-center">
                                        <button type="submit" class="btn primary-background text-white">Submit</button>
                                    </div>

                                </form> 

                            </div>

                            <div class="card-footer primary-background text-white">


                            </div>

                        </div>



                    </div>
                </div>
            </div>   
        </main>







        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
