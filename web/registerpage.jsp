

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

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

        <main class=" align-items-center p-5 primary-background banner-background " >
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">



                        <div class="card">

                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span><p> Register here</p>

                            </div>

                            <div class="card-body">
                                <!--form-->
                                <form  id="reg-form" action="registerservlet" method="POST">
                                    <div class="form-group">
                                        <label for="username">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter name">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"  >
                                    </div>

                                    <div class="form-group">
                                        <label for="gender">Select gender</label>
                                        <br>
                                        <!--ctl+shift click jaha jaha curosers chahiye-->
                                        <input type="radio"  id="gender" name="gender" value="male">Male  
                                        <input type="radio"  id="gender"name="gender" value="female" >Female
                                    </div>

                                    <div class="form-group">
                                        <textarea name="about" id=""  cols="30" rows="10" class="form-control" placeholder="Enter something about yourself..." ></textarea>
                                    </div>



                                    <div class="form-group form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms & conditions!</label>
                                    </div>
                                    <br>

                                    <div class="container text-center" id="loader" style="display:none;">
                                        <span class="fa fa-refresh fa-spin fa-3x"> </span>
                                        <h4>Please wait...</h4>
                                    </div>

                                    <button id="submit-btn" type="submit" class="btn primary-background text-white">Submit</button>
                                </form> 

                            </div>

                            <!--      <div class="card-footer primary-background">
                                                            
                                      </div>  -->


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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded...");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $('#submit-btn').hide();
                    $('#loader').show();




                    //send register servlet
                    $.ajax({
                        url: "registerservlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log(data);
                            $('#submit-btn').show();
                            $('#loader').hide();

                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully...we ae redirecting to login page")
                                        .then((value) => {
                                            window.location = "loginpage.jsp";
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            swal(" something went wrong...");

                            console.log(jqXHR);
                            $('#submit-btn').show();
                            $('#loader').hide();
                        },
                        processData: false,
                        contentType: false
                            });


                });
            });

        </script>



    </body>
</html>
