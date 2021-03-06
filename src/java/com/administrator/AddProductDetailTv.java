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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class AddProductDetailTv extends HttpServlet {

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
            String cat_id = "Pro_301";
            String product_id = (String) request.getSession().getAttribute("pro_id");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String weight = request.getParameter("weight");
            String pro_dim = request.getParameter("pro_dim");
            String resolution = request.getParameter("resolution");
            String dis_tech = request.getParameter("dis_tech");
            String scr_size = request.getParameter("scr_size");
            String max_dis_res = request.getParameter("max_dis_res");
            String audio_watt = request.getParameter("audio_watt");
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("insert into product_tech_detail_phone values (?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, product_id);
                ps.setString(2, brand);
                ps.setString(3, model);
                ps.setString(4, weight);
                ps.setString(5, pro_dim);
                ps.setString(6, resolution);
                ps.setString(7, dis_tech);
                ps.setString(8, scr_size);
                ps.setString(9, max_dis_res);
                ps.setString(10, audio_watt);
                int done = ps.executeUpdate();
                if (done > 0) {
                    response.sendRedirect("administrator/admin_option.jsp");
                }else{
                    response.sendRedirect("administrator/add_product_detail.jsp?cat_id="+cat_id+"&pro_id="+product_id+"&msg=fail");
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
