/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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

            try {
                if (status.equals("G1")) {
                    String[] arrROLL = request.getParameterValues("arrROLL[]");
                    String[] arrPALET = request.getParameterValues("arrPALET[]");
                    String[] arrQUANTITY = request.getParameterValues("arrQUANTITY[]");
                    String[] arrBATCH = request.getParameterValues("arrBATCH[]");
                    String mrno = request.getParameter("mrno");
                    String item = request.getParameter("item");

                    int ck = 0;
                    int n = 0;

                    Connection con = null;
                    PreparedStatement ps = null;
                    PreparedStatement ps1 = null;
                    con = DB.ConnDB.getConnection();
                    try {

                        String sql = "UPDATE wmbarcode SET wmbarcode.PALET = ?,wmbarcode.QUANTITY=?,wmbarcode.BATCH =? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM = ? AND wmbarcode.ROLL = ?";
                        ps = con.prepareStatement(sql);
                        String sql1 = "UPDATE wmqck SET wmqck.PALET = ?,wmqck.ACTQTY =? WHERE wmqck.MRNO = ? AND wmqck.ITEM = ? AND wmqck.ROLL = ?";
                        ps1 = con.prepareStatement(sql1);

                        for (String ROLL : arrROLL) {

                            ps.setString(1, arrPALET[n].toString());
                            ps.setString(2, arrQUANTITY[n].toString());
                            ps.setString(3, arrBATCH[n].toString());
                            ps.setString(4, mrno.toString());
                            ps.setString(5, item.toString());
                            ps.setString(6, arrROLL[n].toString());
                            ps.addBatch();

                            ps1.setString(1, arrPALET[n].toString());
                            ps1.setString(2, arrQUANTITY[n].toString());
                            ps1.setString(3, mrno.toString());
                            ps1.setString(4, item.toString());
                            ps1.setString(5, arrROLL[n].toString());
                            ps1.addBatch();
                            n++;
                        }
                        ps.executeBatch();
                        ps1.executeBatch();
                        out.print("true");
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("false");
                    } finally {
                        ps.close();
                        ps1.close();
                        DB.ConnDB.closeConnection(con);
                    }

//
//                        String sql = "UPDATE wmbarcode SET wmbarcode.PALET = ?,wmbarcode.QUANTITY=?,wmbarcode.BATCH =? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM = ? AND wmbarcode.ROLL = ?";
//
//                        ps = con.prepareStatement(sql);
//                        ps.setString(1, PALET);
//                        ps.setString(2, QUANTITY);
//                        ps.setString(3, BATCH);
//                        ps.setString(4, mrno);
//                        ps.setString(5, item);
//                        ps.setString(6, ROLL);
//
//                        if (ps.executeUpdate() > 0) {
//                            n++;
//                        }
//
//                        String sql1 = "UPDATE wmqck SET wmqck.PALET = ?,wmqck.ACTQTY =? WHERE wmqck.MRNO = ? AND wmqck.ITEM = ? AND wmqck.ROLL = ?";
//
//                        ps1 = con.prepareStatement(sql1);
//                        ps1.setString(1, PALET);
//                        ps1.setString(2, QUANTITY);
//                        ps1.setString(3, mrno);
//                        ps1.setString(4, item);
//                        ps1.setString(5, ROLL);
//
//                        if (ps1.executeUpdate() > 0) {
//                            n++;
//                        }
//
//                        if (n > 0) {
//                            out.print("true");
//                        } else {
//                            out.print("false");
//                        }
//                        ps.close();
//                        ps1.close();
//                        DB.ConnDB.closeConnection(con);


                } else if (status.equals("G2")) {
                    String[] arrITEM = request.getParameterValues("arrITEM[]");
                    String[] arrROLL = request.getParameterValues("arrROLL[]");
                    String[] arrQUANTITY = request.getParameterValues("arrQUANTITY[]");
                    String[] arrUNIT = request.getParameterValues("arrUNIT[]");
                    String[] arrCOLOR = request.getParameterValues("arrCOLOR[]");
                    String[] arrBATCH = request.getParameterValues("arrBATCH[]");
                    String[] arrDESC1 = request.getParameterValues("arrDESC1[]");
                    String[] arrITEM1 = request.getParameterValues("arrITEM1[]");
                    String[] arrROLL1 = request.getParameterValues("arrROLL1[]");
                    String[] arrPALET = request.getParameterValues("arrPALET[]");
                    String CM = (String) request.getParameter("CM");
                    String CM2 = (String) request.getParameter("CM2");
                    
                    String INVOICE = (String) request.getParameter("INVOICE");
                    String INVOICEDATE = (String) request.getParameter("INVOICEDATE");
                    String LOT = (String) request.getParameter("LOT");
                    String MRNO = (String) request.getParameter("MRNO");

                    int n = 0;
                    Connection con = null;
                    ResultSet res = null;
                    PreparedStatement ps = null;
                    con = DB.ConnDB.getConnection();

                    Connection con1 = null;
                    ResultSet res1 = null;
                    PreparedStatement ps1 = null;
                    con1 = DB.ConnDB.getConnection();
                    try {
                        String sql = "UPDATE wmbarcode SET wmbarcode.ITEM = ? , wmbarcode.ROLL = ?,wmbarcode.QUANTITY = ?,wmbarcode.UNIT=?, wmbarcode.COLOR = ?,wmbarcode.BATCH = ?,wmbarcode.DESC1 = ?,wmbarcode.INVOICE=?,wmbarcode.INVOICEDATE=TO_DATE(?, 'yyyy/mm/dd'),wmbarcode.LOT=?,wmbarcode.PALET=?,wmbarcode.CM=?,wmbarcode.CM2=? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM= ? AND wmbarcode.ROLL =?";
                        ps = con.prepareStatement(sql);

                        String sql1 = "UPDATE wmqck SET wmqck.PALET = ?,wmqck.ACTQTY =?, wmqck.ITEM= ? , wmqck.ROLL= ? WHERE wmqck.MRNO = ? AND wmqck.ITEM= ? AND wmqck.ROLL =?";
                        ps1 = con.prepareStatement(sql1);

                        for (String xa : arrITEM) {

                            ps.setString(1, arrITEM[n].toString().toUpperCase());
                            ps.setString(2, arrROLL[n].toString());
                            ps.setString(3, arrQUANTITY[n].toString());
                            ps.setString(4, arrUNIT[n].toString());
                            ps.setString(5, arrCOLOR[n].toString());
                            ps.setString(6, arrBATCH[n].toString());
                            ps.setString(7, arrDESC1[n].toString());
                            ps.setString(8, INVOICE.toString());
                            ps.setString(9, INVOICEDATE.toString());
                            ps.setString(10, LOT.toString());
                            ps.setString(11, arrPALET[n].toString());
                            ps.setString(12, CM);
                            ps.setString(13, CM2);
                            ps.setString(14, MRNO.toString());
                            ps.setString(15, arrITEM1[n].toString());
                            ps.setString(16, arrROLL1[n].toString());
                            ps.addBatch();

                            ps1.setString(1, arrPALET[n].toString());
                            ps1.setString(2, arrQUANTITY[n].toString());
                            ps1.setString(3, arrITEM[n].toString());
                            ps1.setString(4, arrROLL[n].toString());
                            ps1.setString(5, MRNO.toString());
                            ps1.setString(6, arrITEM1[n].toString());
                            ps1.setString(7, arrROLL1[n].toString());
                            ps1.addBatch();

                            n++;

                        }
                        ps.executeBatch();
                        ps1.executeBatch();
                        out.print("true");
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("false");
                    } finally {
                        ps.close();
                        ps1.close();
                        DB.ConnDB.closeConnection(con);
                    }


//                    int n = 0;
//                    String ITEM = (String) request.getParameter("ITEM").toUpperCase();
//                    String ROLL = (String) request.getParameter("ROLL");
//                    String QUANTITY = (String) request.getParameter("QUANTITY");
//                    String UNIT = (String) request.getParameter("UNIT");
//                    String COLOR = (String) request.getParameter("COLOR");
//                    String BATCH = (String) request.getParameter("BATCH");
//                    String DESC1 = (String) request.getParameter("DESC1").replace("!", "#");
//
//                    String INVOICE = (String) request.getParameter("INVOICE");
//                    String INVOICEDATE = (String) request.getParameter("INVOICEDATE");
//                    String LOT = (String) request.getParameter("LOT");
//                    String MRNO = (String) request.getParameter("MRNO");
//                    String ITEM1 = (String) request.getParameter("ITEM1").toUpperCase();
//                    String ROLL1 = (String) request.getParameter("ROLL1");
//                    String PALET = (String) request.getParameter("PALET");
//
//                    String sql = "UPDATE wmbarcode SET wmbarcode.ITEM = ? , wmbarcode.ROLL = ?,wmbarcode.QUANTITY = ?,wmbarcode.UNIT=?, wmbarcode.COLOR = ?,wmbarcode.BATCH = ?,wmbarcode.DESC1 = ?,wmbarcode.INVOICE=?,wmbarcode.INVOICEDATE=TO_DATE(?, 'yyyy/mm/dd'),wmbarcode.LOT=?,wmbarcode.PALET=? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM= ? AND wmbarcode.ROLL =?";
//
//                    ps = con.prepareStatement(sql);
//                    ps.setString(1, ITEM);
//                    ps.setString(2, ROLL);
//                    ps.setString(3, QUANTITY);
//                    ps.setString(4, UNIT);
//                    ps.setString(5, COLOR);
//                    ps.setString(6, BATCH);
//                    ps.setString(7, DESC1);
//                    ps.setString(8, INVOICE);
//                    ps.setString(9, INVOICEDATE);
//                    ps.setString(10, LOT);
//                    ps.setString(11, PALET);
//                    ps.setString(12, MRNO);
//                    ps.setString(13, ITEM1);
//                    ps.setString(14, ROLL1);
//
//                    if (ps.executeUpdate() > 0) {
//                        n++;
//                    }
//
//                    String sql1 = "UPDATE wmqck SET wmqck.PALET = ?,wmqck.ACTQTY =?, wmqck.ITEM= ? , wmqck.ROLL= ? WHERE wmqck.MRNO = ? AND wmqck.ITEM= ? AND wmqck.ROLL =?";
//
//                    ps1 = con.prepareStatement(sql1);
//                    ps1.setString(1, PALET);
//                    ps1.setString(2, QUANTITY);
//                    ps1.setString(3, ITEM);
//                    ps1.setString(4, ROLL);
//                    ps1.setString(5, MRNO);
//                    ps1.setString(6, ITEM1);
//                    ps1.setString(7, ROLL1);
//                   
//                    if (ps1.executeUpdate() > 0) {
//                        n++;
//                    }
//
//                    if (n > 0) {
//                        out.print("true");
//                    } else {
//                        out.print("false");
//                    }
//                    ps.close();
//                    ps1.close();
//                    DB.ConnDB.closeConnection(con);

                } else if (status.equals("G3")) {
                    Connection con = null;
                    ResultSet res = null;
                    PreparedStatement ps = null;
                    con = DB.ConnDB.getConnection();

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

                    ps.close();
                    DB.ConnDB.closeConnection(con);

                } else if (status.equals("G4")) {
                    request.setCharacterEncoding("UTF-8");

                    String remark1 = (String) request.getParameter("remark1");
                    String remark2 = (String) request.getParameter("remark2");
                    String remark3 = (String) request.getParameter("remark3");
                    String mrno = (String) request.getParameter("mrno");
                    String item = (String) request.getParameter("item").toUpperCase();
                    String[] arrroll = request.getParameterValues("roll[]");
                    String gradeqc = (String) request.getParameter("gradeqc");

                    Connection con = null;
                    ResultSet res = null;
                    PreparedStatement ps = null;
                    con = DB.ConnDB.getConnection();
                    try {
                        String sql = "UPDATE wmqck SET REMARK1 = ? ,REMARK2 = ? ,REMARK3 = ?,GRADEQC = ? WHERE wmqck.MRNO = ? AND wmqck.ITEM = ? AND wmqck.ROLL = ?";
                        ps = con.prepareStatement(sql);
                        for (String roll : arrroll) {
                            
                            ps.setString(1, remark1.toString());
                            ps.setString(2, remark2.toString());
                            ps.setString(3, remark3.toString());
                            ps.setString(4, gradeqc.toString());
                            ps.setString(5, mrno.toString());
                            ps.setString(6, item.toString());
                            ps.setString(7, roll.toString());
                            ps.addBatch();
                        }
                        ps.executeBatch();
                        out.print("true");
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("false");
                    } finally {
                        ps.close();
                        DB.ConnDB.closeConnection(con);
                    }

                } else if (status.equals("G5")) {
                    Connection con = null;
                    ResultSet res = null;
                    PreparedStatement ps = null;
                    con = DB.ConnDB.getConnection();

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
                    ps.close();
                    DB.ConnDB.closeConnection(con);
                } else if (status.equals("G6")) {
                    Connection con = null;
                    ResultSet res = null;
                    PreparedStatement ps = null;
                    con = DB.ConnDB.getConnection();

                    Connection con1 = null;
                    ResultSet res1 = null;
                    PreparedStatement ps1 = null;
                    con1 = DB.ConnDB.getConnection();

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
                    ps.close();
                    DB.ConnDB.closeConnection(con);
                }

            } catch (Exception e) {
                e.printStackTrace();
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
