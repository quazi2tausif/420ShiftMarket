/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.administrator;

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
public class AddProductQuantity extends HttpServlet {

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
            String pro_id = request.getParameter("pro_id");
            String pro_quan = request.getParameter("pro_quan");
            int int_pro_quan = Integer.parseInt(pro_quan);
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("select * from product where product_id=?");
                ps.setString(1, pro_id);
                ResultSet rs = ps.executeQuery();
                int quan = int_pro_quan + rs.getInt(5);
                PreparedStatement psq = con.prepareCall("update product set product_quantity=? where product_id=?");
                psq.setInt(1, quan);
                psq.setString(2, pro_id);
                int done = psq.executeUpdate();
                if (done > 0) {
                    response.sendRedirect("administrator/admin_option.jsp");
                }else {
                    response.sendRedirect("administrator/admin_option.jsp?msg=addproductquantityfail");
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
