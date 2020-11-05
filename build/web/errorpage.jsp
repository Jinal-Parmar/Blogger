
<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! ERROR</title>

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
        <div class="container text-center">
            <img src="img/browser.png" class="img-fluid">
            <h5 class="display-4">SORRY! Something went wrong...</h5>
             <%= exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">HOME </a>
        
        
        </div>
        <hr>
    </body>
</html>
