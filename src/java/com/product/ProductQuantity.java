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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class ProductQuantity extends HttpServlet {

    public int product_quantity;
    public int done;

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
            String atc = (String) request.getSession().getAttribute("atc");
            ClientPath cp = new ClientPath();
            cp.payment_mode(atc, pro_id, pro_name, quan);
            Connection con;
            PreparedStatement psq, psnq;
            try {
                con = DataBaseConn.getConnection();
                for (int i = 0; i < cp.prid.length; i++) {
                    psq = con.prepareCall("select * from product where product_id=?");
                    psq.setString(1, cp.prid[i]);
                    ResultSet rsq = psq.executeQuery();
                    while (rsq.next()) {
                        product_quantity = rsq.getInt(5);
                    }
                    int newproquan = product_quantity - Integer.parseInt(cp.prqu[i]);
                    psnq = con.prepareCall("update product set product_quantity=? where product_id=?");
                    psnq.setInt(1, newproquan);
                    psnq.setString(2, cp.prid[i]);
                    done = psnq.executeUpdate();
                }
                if (done > 0) {
                    if (atc.equals("atc")) {
                        response.sendRedirect("RemoveCartPaymentDone");
                    } else {
                        response.sendRedirect("client/client_purchase.jsp");
                    }
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
