<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>


<div class="row">
    <%
        User uuu=(User)session.getAttribute("cuser");
        Thread.sleep(1000);
        postdao pd = new postdao(connectionprovider.getconn());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<post> posts = null;
        if (cid == 0) {
            posts = pd.getallposts();
        } else {
            posts = pd.getpostsbyid(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center text-white'>NO POST IN THIS Category :(....</h3>");
            return;
        }
        for (post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pic/<%=p.getPpic()%>" alt="card img cap">
            <div class="card-body">

                <b><%=p.getPtitle()%></b>
                <p><%=p.getPcontent()%> </p>

            </div>

            <div class="card-footer text-center primary-background">
                <%
                LikeDao d=new LikeDao(connectionprovider.getconn());
     
                %>
                
                
                <a href="#!"  onclick="dolike(<%=p.getId()%>,<%=uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= d.countlikeonpost(p.getId())%></span></a>
                <a href="showblogpage.jsp?post_id=<%=p.getId()%>" class="btn btn-outline-light btn-sm">Read more...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>


            </div>    

        </div>
    </div>

    <%
        }
    %>

    <div>