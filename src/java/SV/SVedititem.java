/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class SVedititem extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");


        PrintWriter out = response.getWriter();
        try {
            String status = request.getParameter("status").trim();
            Connection con = null;
            ResultSet res = null;
            PreparedStatement ps = null;
            con = DB.ConnDB.getConnection();

            Connection con1 = null;
            ResultSet res1 = null;
            PreparedStatement ps1 = null;
            con1 = DB.ConnDB.getConnection();
            try {


                if (status.equals("G1")) {
                    int n = 0;
                    String mrno = request.getParameter("mrno");
                    String item = request.getParameter("item").toUpperCase();
                    String ROLL = request.getParameter("ROLL");
                    String PALET = request.getParameter("PALET");
                    String QUANTITY = request.getParameter("QUANTITY");
                    String BATCH = request.getParameter("BATCH");

                    String sql = "UPDATE wmbarcode SET wmbarcode.PALET = ?,wmbarcode.QUANTITY=?,wmbarcode.BATCH =? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM = ? AND wmbarcode.ROLL = ?";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, PALET);
                    ps.setString(2, QUANTITY);
                    ps.setString(3, BATCH);
                    ps.setString(4, mrno);
                    ps.setString(5, item);
                    ps.setString(6, ROLL);

                    if (ps.executeUpdate() > 0) {
                        n++;
                    }

                    String sql1 = "UPDATE wmqck SET wmqck.PALET = ?,wmqck.ACTQTY =? WHERE wmqck.MRNO = ? AND wmqck.ITEM = ? AND wmqck.ROLL = ?";

                    ps1 = con.prepareStatement(sql1);
                    ps1.setString(1, PALET);
                    ps1.setString(2, QUANTITY);
                    ps1.setString(3, mrno);
                    ps1.setString(4, item);
                    ps1.setString(5, ROLL);

                    if (ps1.executeUpdate() > 0) {
                        n++;
                    }

                    if (n > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }


                } else if (status.equals("G2")) {
                    int n = 0;
                    String ITEM = (String) request.getParameter("ITEM").toUpperCase();
                    String ROLL = (String) request.getParameter("ROLL");
                    String QUANTITY = (String) request.getParameter("QUANTITY");
                    String UNIT = (String) request.getParameter("UNIT");
                    String COLOR = (String) request.getParameter("COLOR");
                    String BATCH = (String) request.getParameter("BATCH");
                    String DESC1 = (String) request.getParameter("DESC1").replace("!", "#");

                    String INVOICE = (String) request.getParameter("INVOICE");
                    String INVOICEDATE = (String) request.getParameter("INVOICEDATE");
                    String LOT = (String) request.getParameter("LOT");
                    String MRNO = (String) request.getParameter("MRNO");
                    String ITEM1 = (String) request.getParameter("ITEM1").toUpperCase();
                    String ROLL1 = (String) request.getParameter("ROLL1");
                    String PALET = (String) request.getParameter("PALET");

                    String sql = "UPDATE wmbarcode SET wmbarcode.ITEM = ? , wmbarcode.ROLL = ?,wmbarcode.QUANTITY = ?,wmbarcode.UNIT=?, wmbarcode.COLOR = ?,wmbarcode.BATCH = ?,wmbarcode.DESC1 = ?,wmbarcode.INVOICE=?,wmbarcode.INVOICEDATE=TO_DATE(?, 'yyyy/mm/dd'),wmbarcode.LOT=?,wmbarcode.PALET=? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM= ? AND wmbarcode.ROLL =?";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, ITEM);
                    ps.setString(2, ROLL);
                    ps.setString(3, QUANTITY);
                    ps.setString(4, UNIT);
                    ps.setString(5, COLOR);
                    ps.setString(6, BATCH);
                    ps.setString(7, DESC1);
                    ps.setString(8, INVOICE);
                    ps.setString(9, INVOICEDATE);
                    ps.setString(10, LOT);
                    ps.setString(11, PALET);
                    ps.setString(12, MRNO);
                    ps.setString(13, ITEM1);
                    ps.setString(14, ROLL1);

                    if (ps.executeUpdate() > 0) {
                        n++;
                    }

                    String sql1 = "UPDATE wmqck SET wmqck.PALET = ?,wmqck.ACTQTY =?, wmqck.ITEM= ? , wmqck.ROLL= ? WHERE wmqck.MRNO = ? AND wmqck.ITEM= ? AND wmqck.ROLL =?";

                    ps1 = con.prepareStatement(sql1);
                    ps1.setString(1, PALET);
                    ps1.setString(2, QUANTITY);
                    ps1.setString(3, ITEM);
                    ps1.setString(4, ROLL);
                    ps1.setString(5, MRNO);
                    ps1.setString(6, ITEM1);
                    ps1.setString(7, ROLL1);

                    if (ps1.executeUpdate() > 0) {
                        n++;
                    }

                    if (n > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } else if (status.equals("G3")) {
                    String actqty = request.getParameter("actqty");
                    String ethread = request.getParameter("ethread");
                    String eoil = request.getParameter("eoil");
                    String eknot = request.getParameter("eknot");
                    String ejoint = request.getParameter("ejoint");
                    String efurrow = request.getParameter("efurrow");
                    String edirty = request.getParameter("edirty");
                    String ealkali = request.getParameter("ealkali");
                    String ebroken = request.getParameter("ebroken");
                    String erepeat = request.getParameter("erepeat");
                    String sum = request.getParameter("sum");
                    String width = request.getParameter("width");
                    String scolor = request.getParameter("scolor");
                    String byname1 = request.getParameter("byname1");
                    String weight = request.getParameter("weight");
                    String qtylay = request.getParameter("qtylay");
                    String mark_toterr = request.getParameter("mark_toterr");
                    String qcdate = request.getParameter("qcdate");
                    String point = request.getParameter("point");
                    String mrno = request.getParameter("mrno");
                    String item = request.getParameter("item");
                    String roll = request.getParameter("roll");
                    String pallet = request.getParameter("pallet");

                    String arr[] = {
                        actqty,
                        ethread,
                        eoil,
                        eknot,
                        ejoint,
                        efurrow,
                        edirty,
                        ealkali,
                        ebroken,
                        erepeat,
                        sum,
                        width,
                        scolor,
                        byname1,
                        weight,
                        qtylay,
                        mark_toterr,
                        qcdate,
                        point,
                        mrno,
                        item,
                        roll,
                        pallet
                    };

                    String sql = "UPDATE wmqck SET wmqck.ACTQTY = ?," +
                            "wmqck.ETHREAD = ?," +
                            "wmqck.EOIL = ?," +
                            "wmqck.EKNOT = ?," +
                            "wmqck.EJOINT= ?," +
                            "wmqck.EFURROW=?," +
                            "wmqck.EDIRTY=?," +
                            "wmqck.EALKALI=?," +
                            "wmqck.EBROKEN=?," +
                            "wmqck.EREPEAT=?," +
                            "wmqck.TOTERR=?," +
                            "wmqck.WIDTH=?," +
                            "wmqck.scolor=?," +
                            "wmqck.BYNAME=?," +
                            "wmqck.WEIGHT=?," +
                            "wmqck.QTYLAY=?," +
                            "wmqck.MARK_TOTERR=?," +
                            "wmqck.QCDATE=TO_DATE(?, 'yyyy/mm/dd'), " +
                            "wmqck.point=? " +
                            "WHERE wmqck.MRNO=? and wmqck.ITEM=? AND wmqck.ROLL=? and wmqck.PALET = ?";

                    ps = con.prepareStatement(sql);

                    for (int n = 0; n < arr.length; n++) {
                        if (arr[n].equals("")) {
                            arr[n] = null;
                        }
                        ps.setString(n + 1, arr[n]);
                    }

                    if (ps.executeUpdate() > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }



                } else if (status.equals("G4")) {
                    request.setCharacterEncoding("UTF-8");
                    String remark1 = (String) request.getParameter("remark1");
                    String remark2 = (String) request.getParameter("remark2");
                    String remark3 = (String) request.getParameter("remark3");
                    String mrno = (String) request.getParameter("mrno");
                    String item = (String) request.getParameter("item").toUpperCase();
                    String roll = (String) request.getParameter("roll");
                    String gradeqc = (String) request.getParameter("gradeqc");

                    String sql = "UPDATE wmqck SET REMARK1 = ? ,REMARK2 = ? ,REMARK3 = ?,GRADEQC = ? WHERE wmqck.MRNO = ? AND wmqck.ITEM = ? AND wmqck.ROLL = ?";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, remark1);
                    ps.setString(2, remark2);
                    ps.setString(3, remark3);
                    ps.setString(4, gradeqc);
                    ps.setString(5, mrno);
                    ps.setString(6, item);
                    ps.setString(7, roll);

                    if (ps.executeUpdate() > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } else if (status.equals("G5")) {
                    String byname1 = request.getParameter("byname1");
                    String mrno = request.getParameter("mrno");
                    String pallet = request.getParameter("pallet");

                    String sql = "update wmqck set byname1=? where mrno=? and palet=? ";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, byname1);
                    ps.setString(2, mrno);
                    ps.setString(3, pallet);

                    if (ps.executeUpdate() > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } else if (status.equals("G6")) {
                    String qicheck = request.getParameter("qicheck");
                    String mrno = request.getParameter("mrno");
                    String pallet = request.getParameter("pallet");

                    String sql = "Update wmbarcode set resultqc=? where mrno=? and palet=?  ";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, qicheck);
                    ps.setString(2, mrno);
                    ps.setString(3, pallet);

                    if (ps.executeUpdate() > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    ps.close();
                    DB.ConnDB.closeConnection(con);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SVedititem.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SVedititem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SVedititem.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SVedititem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
