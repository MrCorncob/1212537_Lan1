/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineshopping.Controllers;

import com.onlineshopping.Models.RegisterService;
import com.onlineshopping.Models.MD5Utility;
import com.onlineshopping.POJO.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Corncob
 */
public class RegisterServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String password = MD5Utility.getMD5Hash(request.getParameter("password"));
        User user = new User();
        RegisterService registerService = new RegisterService();
        user.setAddress(request.getParameter("address"));
        user.setBirthDay(request.getParameter("birthday"));
        user.setEmail(request.getParameter("email"));
        user.setGender(request.getParameter("gender").equals("male") ? 0 : 1);
        user.setFullname(request.getParameter("firstname") + " " + request.getParameter("lastname"));
        user.setPassword(password);
        user.setPhone(request.getParameter("phone"));
        user.setUsername(request.getParameter("username"));
        user.setStatus(0);
        user.setId(null);
        boolean result;

        result = registerService.registerUser(user);

        if (result == true)//Đăng kí thành công
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("registerStatus", "success");
            response.sendRedirect("login.jsp");
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("registerStatus", "error");
            response.sendRedirect("register.jsp"); //error page 
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
