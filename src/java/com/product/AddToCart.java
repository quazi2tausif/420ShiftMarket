/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.product;

import com.client.ClientPath;
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
public class AddToCart extends HttpServlet {

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
            String ack = (String) request.getSession().getAttribute("ack");
            String s = (String) request.getSession().getAttribute("client_id");
            String pro_id = (String) request.getSession().getAttribute("pro_id");
            String quan = (String) request.getSession().getAttribute("quan");
            String pd = request.getParameter("pd");
            ShowCase sc = new ShowCase();
            sc.smart_phone(pro_id);
            sc.laptop(pro_id);
            sc.smart_tv(pro_id);
            int tamt = Integer.parseInt(quan) * sc.pro_total;
            String t_amt = String.valueOf(tamt);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat dt = new SimpleDateFormat("HH:mm:ss");
            Date d = new Date();
            String date = df.format(d);
            String time = dt.format(d);
            ClientPath cp = new ClientPath();
            if (pd != null) {
                cp.add_to_cart_fail(pd);
            }
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("insert into client_add_to_cart values (?,?,?,?,?,?,?)");
                ps.setString(1, date);
                ps.setString(2, time);
                ps.setString(3, s);
                ps.setString(4, pro_id);
                ps.setString(5, sc.pro_name);
                ps.setString(6, quan);
                ps.setString(7, t_amt);
                int num = ps.executeUpdate();
                if (num > 0) {
                    response.sendRedirect("client/client_cart.jsp");
                } else {
                    response.sendRedirect(cp.client_url);
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
