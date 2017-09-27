/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.payment;

import com.client.ClientPath;
import com.databaseconn.DataBaseConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class PaymentThroughCOD extends HttpServlet {
    
    public String client_address;
    public String client_name;
    public int num;

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
            String client_id = (String) request.getSession().getAttribute("client_id");
            String ack = (String) request.getSession().getAttribute("ack");
            String pro_id = (String) request.getSession().getAttribute("pro_id");
            String pro_name = (String) request.getSession().getAttribute("pro_name");
            String quan = (String) request.getSession().getAttribute("quan");
            String t_amt = (String) request.getSession().getAttribute("t_amt");
            String atc = (String) request.getSession().getAttribute("atc");
            request.getSession().setAttribute("pay_type", "card");
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat dt = new SimpleDateFormat("HH:mm:ss");
            Date d = new Date();
            String date = df.format(d);
            String time = dt.format(d);
            String ord_id = client_id + time + date;
            ClientPath cp = new ClientPath();
            cp.payment_mode(atc, pro_id, pro_name, quan);
            Connection con;
            PreparedStatement psp, psc;
            try {
                con = DataBaseConn.getConnection();
                psc = con.prepareCall("select * from userinfo where user_id = ?");
                psc.setString(1, client_id);
                ResultSet rs = psc.executeQuery();
                while (rs.next()) {
                    client_name = rs.getString(3);
                    client_address = rs.getString(5);
                }
                for (int i = 0; i < cp.prid.length; i++) {
                    psp = con.prepareCall("insert into Payment_Through_COD values (?,?,?,?,?,?,?,?,?,?)");
                    psp.setString(1, date);
                    psp.setString(2, time);
                    psp.setString(3, ord_id);
                    psp.setString(4, client_id);
                    psp.setString(5, client_name);
                    psp.setString(6, cp.prid[i]);
                    psp.setString(7, cp.prna[i]);
                    psp.setString(8, cp.prqu[i]);
                    psp.setString(9, t_amt);
                    psp.setString(10, client_address);
                    num = psp.executeUpdate();
                }
                if (num > 0) {
                    response.sendRedirect("ProductQuantity");
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
