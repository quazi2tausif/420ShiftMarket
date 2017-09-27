/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.support;

import com.databaseconn.DataBaseConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class AdminReply extends HttpServlet {

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
            String s = (String) request.getSession().getAttribute("admin_id");
            String ci = (String) request.getSession().getAttribute("ci");
            String cq = (String) request.getSession().getAttribute("cq");
            String cd = (String) request.getSession().getAttribute("cd");
            String ct = (String) request.getSession().getAttribute("ct");
            String reply = request.getParameter("reply");
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat dt = new SimpleDateFormat("HH:mm:ss");
            Date d = new Date();
            String date = df.format(d);
            String time = dt.format(d);
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("insert into admin_reply values (?,?,?,?,?)");
                ps.setString(1, date);
                ps.setString(2, time);
                ps.setString(3, ci);
                ps.setString(4, cq);
                ps.setString(5, reply);
                int done = ps.executeUpdate();
                if (done > 0) {
                    response.sendRedirect("UpdateClient");
                } else {
                    response.sendRedirect("administrator/admin_reply.jsp?msg=fail");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
