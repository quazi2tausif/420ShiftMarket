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
public class AddProductDetailLaptop extends HttpServlet {

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
            String cat_id = "Pro_201";
            String product_id = (String) request.getSession().getAttribute("pro_id");
            String brand = request.getParameter("brand");
            String model_num = request.getParameter("model_num");
            String color = request.getParameter("color");
            String height = request.getParameter("height");
            String width = request.getParameter("width");
            String scr_size = request.getParameter("scr_size");
            String dis_res = request.getParameter("dis_res");
            String weight = request.getParameter("weight");
            String pro_dim = request.getParameter("pro_dim");
            String pros_brand = request.getParameter("pros_brand");
            String pros_typ = request.getParameter("pros_typ");
            String pros_spd = request.getParameter("pros_spd");
            String pros_count = request.getParameter("pros_count");
            String ram = request.getParameter("ram");
            String mem_typ = request.getParameter("mem_typ");
            String com_mem_typ = request.getParameter("com_mem_typ");
            String hdd = request.getParameter("hdd");
            String aud_dtl = request.getParameter("aud_dtl");
            String spk_dis = request.getParameter("spk_dis");
            String grph_cop = request.getParameter("grph_cop");
            String conn_typ = request.getParameter("conn_typ");
            String hdwr_plt = request.getParameter("hdwr_plt");
            String os = request.getParameter("os");
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("insert into product_tech_detail_phone values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, product_id);
                ps.setString(2, brand);
                ps.setString(3, model_num);
                ps.setString(4, color);
                ps.setString(5, height);
                ps.setString(6, width);
                ps.setString(7, scr_size);
                ps.setString(8, dis_res);
                ps.setString(9, weight);
                ps.setString(10, pro_dim);
                ps.setString(11, pros_brand);
                ps.setString(12, pros_typ);
                ps.setString(13, pros_spd);
                ps.setString(14, pros_count);
                ps.setString(15, ram);
                ps.setString(16, mem_typ);
                ps.setString(17, com_mem_typ);
                ps.setString(18, hdd);
                ps.setString(19, aud_dtl);
                ps.setString(20, spk_dis);
                ps.setString(21, grph_cop);
                ps.setString(22, conn_typ);
                ps.setString(23, hdwr_plt);
                ps.setString(24, os);
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
