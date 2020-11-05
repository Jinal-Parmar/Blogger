<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="errorpage.jsp" %>

<%
    User user = (User) session.getAttribute("cuser");
    if (user == null) {
        response.sendRedirect("loginpage.jsp");
    }

%>



<%    int postid = Integer.parseInt(request.getParameter("post_id"));
    postdao d = new postdao(connectionprovider.getconn());
    post p = d.getpostbyid(postid);


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%> || TechBlog </title>


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

            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-code{}
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-usernamedate{
                border: 1px solid #e2e2e2;
                padding-top:15px; 
            }
            body{
                background: url(img/bg.jpg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }


        </style>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0"></script>



</head>
<body>

    <!--navbar start-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">

        <a class="navbar-brand" href="index.jsp"> <span class="fa fa-angellist"></span> Tech Blog</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><span class="fa fa-heart"></span> Learn Code with jinal <span class="sr-only">(current)</span></a>
                </li>



                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="fa fa-flag"></span> Categories </a>

                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Lang</a>
                        <a class="dropdown-item" href="#">Proj Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structure </a>
                    </div>

                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="fa fa-thumbs-o-up"></span> Contact</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#!"  data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> Do Post</a>
                </li>




            </ul>

            <ul class="navbar-nav mr-right">
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span> <%=user.getName()%> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="logoutservlet"><span class="fa fa-sign-out"></span> Logout </a>
                </li>
            </ul>

        </div>

    </nav>

    <!--end of navbar--> 

    <!--main  content of body-->

    <div class="contianer">
        <div class="row my-4">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"> <%= p.getPtitle()%></h4>
                    </div>
                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pic/<%=p.getPpic()%>" alt="card img cap">

                        <div class="row my-3 row-usernamedate">
                            <div class="col-md-8">

                                <% UserDao ud = new UserDao(connectionprovider.getconn());%>

                                <p class="post-user-info"><a href="#"><%=ud.getuserbyuserid(p.getUserid()).getName()%></a> has POSTED :</p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%=DateFormat.getDateInstance().format(p.getPdate())%></p>
                            </div>
                        </div>   

                        <p class="post-content"> <%= p.getPcontent()%></p>
                        <br><br>

                        <div class="post-code">
                            <pre> <%= p.getPcode()%></pre>
                        </div>

                    </div>
                    <div class="card-footer primary-background">

                        <%
                            LikeDao ld = new LikeDao(connectionprovider.getconn());


                        %>

                        <a href="#!" onclick="dolike(<%=p.getId()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countlikeonpost(p.getId())%></span></a>
                        <!--p.getId()ye post kisne kiya dega-->
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>


                    </div> 
                    <div class="card-footer">

                        <div class="fb-comments" data-href="https://localhost:8080/TechBlog/showblogpage.jsp?post_id=<%= p.getId()%>" data-numposts="5" data-width=""></div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!--end of main conent of body-->

    <!--profile modal-->

    <!-- Button trigger modal -->
    <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-modal">
           Launch demo modal
       </button>-->

    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white">
                    <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="container text-center">
                        <img src="pics/<%=user.getProfile()%>" style="border-radius: 50%; max-width: 150px ;">

                        <h5 class="modal-title mt-3" id="exampleModalLabel">  <%=user.getName()%> </h5>

                        <!--details-->
                        <div id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID :</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender :</th>
                                        <td><%= user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About :</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on :</th>
                                        <td><%= user.getDateTime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!--profile edit-->
                        <div id="profile-edit" style="display:none;"> 
                            <h3>Wanna EDIT ! </h3>
                            <form action="editservlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID : </td>
                                        <td><%= user.getId()%> </td>
                                    </tr>
                                    <tr>
                                        <td>Email : </td>
                                        <td><input type="email" class="form-control" name="uemail" value="<%= user.getEmail()%>" </td>
                                    </tr>
                                    <tr>
                                        <td>Name : </td>
                                        <td><input type="text" class="form-control" name="uname" value="<%= user.getName()%>" </td>
                                    </tr>
                                    <tr>
                                        <td>Password : </td>
                                        <td><input type="password" class="form-control" name="upass" value="<%= user.getPassword()%>" </td>
                                    </tr>
                                    <tr>
                                        <td>Gender : </td>
                                        <td><%= user.getGender().toUpperCase()%> </td>                       
                                    </tr>
                                    <tr>
                                        <td>About : </td>
                                        <td><textarea rows="3" class="form-control" name="uabout"><%= user.getAbout()%></textarea> </td>
                                    </tr>
                                    <tr>
                                        <td>New Profile : </td>
                                        <td><input  type="file" class="form-control" name="uimage"/></td>
                                    </tr>

                                </table>


                                <div class="container">
                                    <button type="submit" class="btn btn-outline-dark   ">SAVE</button>   
                                </div>




                            </form>


                        </div>          
                    </div>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark text-white" data-dismiss="modal">Close</button>
                    <button id="edit-proflie-button"type="button" class="btn primary-background text-white">EDIT</button>
                </div>
            </div>
        </div>
    </div>
    <!--end of profile modal-->


    <!--do post modal-->

    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide POST Details...</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">


                    <form id="add-post-form" action="addpostservlet" method="post">

                        <div class="form-group">

                            <select class="form-control" name="cid">
                                <option selected disabled>---Select Category---</option>
                                <%
                                    postdao pd = new postdao(connectionprovider.getconn());
                                    ArrayList<category> l = pd.getallcat();
                                    for (category c : l) {
                                %>
                                <option value="<%=c.getCid()%>"><%=c.getName()%></option>  
                                <% }%>
                            </select>

                        </div>

                        <div class="form-group">
                            <input name="ptitle" type="text" placeholder="Enter title" class="form-control" />
                        </div>  

                        <div class="form-group">
                            <textarea name="pcontent" class="form-control" style="height:200px;" placeholder="Enter your content" ></textarea>
                        </div> 

                        <div class="form-group">
                            <textarea name="pcode" class="form-control" style="height:200px;" placeholder="Enter your code" ></textarea>
                        </div>  

                        <div class="form-group">
                            <label>Select your IMAGE for PC...</label>
                            <br>
                            <input name="pic" type="file">
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-dark">POST</button>
                        </div>   


                    </form>
                </div>

            </div>
        </div>
    </div>




    <!--end of do post modal-->



    <!--javascripts-->
    <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>

    <script>
                            $(document).ready(function () {
                                let editstatus = false;
                                $('#edit-proflie-button').click(function () {

                                    // alert("editi  clicked");  
                                    if (editstatus == false)
                                    {
                                        $("#profile-details").hide();
                                        $("#profile-edit").show();
                                        editstatus = true;
                                        $(this).text("BACK");
                                    } else
                                    {
                                        $("#profile-details").show();
                                        $("#profile-edit").hide();
                                        $(this).text("EDIT");
                                    }


                                });



                            });

    </script>





    <!--now do post js-->

    <script>
        $(document).ready(function (e) {
            //
            //  console.log("button clicked...");

            $("#add-post-form").on("submit", function (event) {
                // form submit ke bad chlega
                event.preventDefault();
                let form = new FormData(this);

                //now requesting to server
                $.ajax({
                    url: "addpostservlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR)
                    {
                        console.log(data);
                        if (data.trim() === "success")
                        {
                            swal("Good job!", "posted successfully!", "success");
                        } else
                        {
                            swal("Error!", " Something went wrong..please try again !", "error");
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown)
                    {
                        swal("Error!", " Something went wrong..please try again !", "error");
                    },
                    processData: false,
                    contentType: false
                });

            });

        });



    </script>

</body>
</html>
