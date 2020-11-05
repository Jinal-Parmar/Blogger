

<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>
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

        <!--banner-->
        <div class="container-fluid p-0 m-0 banner-background">

            <div class="jumbotron  primary-background text-white">
                <div class="container">
                    <h2 class="display-3">Welcome to TECH BLOG !</h2>

                    <p>Welcome to Technical blog....world of technology!</p>        

                    <p>Computer programming is the process of designing and building an executable computer program to accomplish a specific computing result. Programming involves tasks such as: analysis, generating algorithms, profiling algorithms' accuracy and resource consumption, and the implementation of algorithms in a chosen programming language (commonly referred to as coding).</p>

                    <button class="btn btn-outline-light btn-lg"><i class="fa fa-key"></i> Start! its free...</button>
                    <a href="loginpage.jsp" class="btn btn-outline-light btn-lg"><i class="fa fa-user-circle fa-spin"></i> Login here</a>

                </div>        
            </div>

        </div>

        <!--cards-->
        <div class="container">
            <!--roe 1-->
            <div class="row mb-2">

                <div class="col-md-4">

                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>

                </div>

            </div>
            <!--roe 2-->
            <div class="row">

                <div class="col-md-4">

                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>



    </body>
</html>
