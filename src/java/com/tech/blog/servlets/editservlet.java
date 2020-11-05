/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.message;
import com.tech.blog.helper.connectionprovider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class editservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editservlet</title>");
            out.println("</head>");
            out.println("<body>");

            //fetch all data from profile edit wala form 
            String uemail = request.getParameter("uemail");
            String uname = request.getParameter("uname");
            String upass = request.getParameter("upass");
            String uabout = request.getParameter("uabout");
            Part p = request.getPart("uimage");
            String imageName = p.getSubmittedFileName();

            //get user seesion
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("cuser");
            user.setEmail(uemail);
            user.setPassword(upass);
            user.setName(uname);
            user.setAbout(uabout);
            String oldpic = user.getProfile();
            user.setProfile(imageName);

            //update user in db
            // to use non stetic func we need userdao obj
            UserDao dao = new UserDao(connectionprovider.getconn());
            boolean ans = dao.updateuser(user);
            if (ans == true) {
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

                if (!oldpic.equals("default.png") ) {
                    String oldpicpath = request.getRealPath("/") + "pics" + File.separator + oldpic;
                    helper.deletefile(oldpicpath);
                }

                if (helper.savefile(p.getInputStream(), path)) {
                    // out.println(" PROFILE updated...");
                    message m = new message("PROFILE details  updated...!", "success", "alert-success");

                    //   HttpSession s = request.getSession();
                    s.setAttribute("msg", m);
                }

            } else {
                message m = new message("Sorry Something went wrong!", "error", "alert-danger");

                //   HttpSession s = request.getSession();
                s.setAttribute("msg", m);

                out.println("not updated");

            }
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
