/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineshopping.Controllers;

import com.onlineshopping.Models.LoginService;
import com.onlineshopping.Models.MD5Utility;
import com.onlineshopping.POJO.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Corncob
 */
public class LoginServlet extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        User user;
        user = (User)session.getAttribute("user");
        if (user != null)
        {
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        }
        
        LoginService loginService = new LoginService();
        String username = request.getParameter("username");
        String password = MD5Utility.getMD5Hash(request.getParameter("password"));
        user = loginService.takeLogin(username, password);

        if (user != null)//Đăng nhập thành công
        {
            session.setAttribute("user", user);
            response.sendRedirect("index.html");
        } else {
            session.setAttribute("message", "Tên Đăng Nhập Hoặc Mật Khẩu Không Đúng");
            response.sendRedirect("login.html"); //error page
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        User user;
        user = (User)session.getAttribute("user");
        if (user != null)
        {
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        
        LoginService loginService = new LoginService();
        String username = request.getParameter("username");
        String password = MD5Utility.getMD5Hash(request.getParameter("password"));
        user = loginService.takeLogin(username, password);

        if (user != null)//Đăng nhập thành công
        {
            session.setAttribute("user", user);
            session.setAttribute("loginStatus", "success");
            response.sendRedirect("index.html");
        } else {
            session.setAttribute("loginStatus", "error");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
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
