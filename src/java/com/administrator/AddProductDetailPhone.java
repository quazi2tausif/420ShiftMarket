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
public class AddProductDetailPhone extends HttpServlet {

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
            String cat_id = "Pro_101";
            String product_id = (String) request.getSession().getAttribute("pro_id");
            String os = request.getParameter("os");
            String ram = request.getParameter("ram");
            String weight = request.getParameter("weight");
            String dimensions = request.getParameter("dimensions");
            String model_number = request.getParameter("model_number");
            String con_tech = request.getParameter("con_tech");
            String special_features = request.getParameter("special_features");
            String camera = request.getParameter("camera");
            String colour = request.getParameter("colour");
            String battery_power = request.getParameter("battery_power");
            String in_the_box = request.getParameter("in_the_box");
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("insert into product_tech_detail_phone values (?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, product_id);
                ps.setString(2, os);
                ps.setString(3, ram);
                ps.setString(4, weight);
                ps.setString(5, dimensions);
                ps.setString(6, model_number);
                ps.setString(7, con_tech);
                ps.setString(8, special_features);
                ps.setString(9, camera);
                ps.setString(10, colour);
                ps.setString(11, battery_power);
                ps.setString(12, in_the_box);
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
