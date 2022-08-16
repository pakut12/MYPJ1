/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class SVgetdatawm extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String menr = request.getParameter("mrno").trim();

            ResultSet rec = null;
            Connection conn = null;
            PreparedStatement ps = null;
            String page = "";
            try {

                String sql = "select * from wmbarcode where  wmbarcode.MRNO = ?";
                conn = DB.ConnDB.getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1, menr);
                rec = ps.executeQuery();

                ArrayList<String> MRNO = new ArrayList<String>();
                ArrayList<String> ITEM = new ArrayList<String>();
                ArrayList<String> ROLL = new ArrayList<String>();
                ArrayList<String> PALET = new ArrayList<String>();
                ArrayList<String> PLANT = new ArrayList<String>();
                ArrayList<String> DESC1 = new ArrayList<String>();
                ArrayList<String> DESC2 = new ArrayList<String>();
                ArrayList<String> DESC3 = new ArrayList<String>();
                ArrayList<String> PO = new ArrayList<String>();
                ArrayList<String> POLN = new ArrayList<String>();
                ArrayList<String> INVOICEDATE = new ArrayList<String>();
                ArrayList<String> CREATEDATE = new ArrayList<String>();
                ArrayList<String> QUANTITY = new ArrayList<String>();
                ArrayList<String> UNIT = new ArrayList<String>();
                ArrayList<String> SUPNAME = new ArrayList<String>();
                ArrayList<String> INVOICE = new ArrayList<String>();
                ArrayList<String> GRADE = new ArrayList<String>();
                ArrayList<String> CODE = new ArrayList<String>();
                ArrayList<String> BATCH = new ArrayList<String>();
                ArrayList<String> CHANGEDATE = new ArrayList<String>();
                ArrayList<String> COLOR = new ArrayList<String>();
                ArrayList<String> SUPPLIER = new ArrayList<String>();
                ArrayList<String> DELIVERYNO = new ArrayList<String>();
                ArrayList<String> PUGROUP = new ArrayList<String>();
                ArrayList<String> PUNAME = new ArrayList<String>();
                ArrayList<String> TELEPHONE = new ArrayList<String>();
                ArrayList<String> PRICE = new ArrayList<String>();
                ArrayList<String> PRD = new ArrayList<String>();
                ArrayList<String> LOT = new ArrayList<String>();
                ArrayList<String> PER = new ArrayList<String>();
                ArrayList<String> CURR = new ArrayList<String>();
                ArrayList<String> TOQC = new ArrayList<String>();
                ArrayList<String> TOTEST = new ArrayList<String>();
                ArrayList<String> RESULTQC = new ArrayList<String>();
                ArrayList<String> RESULTTEST = new ArrayList<String>();
                ArrayList<String> PAGE = new ArrayList<String>();
                ArrayList<String> AFTERQTY = new ArrayList<String>();
                ArrayList<String> REMARKRM1 = new ArrayList<String>();
                ArrayList<String> REMARKRM2 = new ArrayList<String>();
                ArrayList<String> REMARKRM3 = new ArrayList<String>();
                ArrayList<String> SAVEDATE = new ArrayList<String>();
                ArrayList<String> DMWEIGHT = new ArrayList<String>();
                ArrayList<String> MWEIGHT = new ArrayList<String>();
                ArrayList<String> RMWIDTH = new ArrayList<String>();
                ArrayList<String> REFMRNO = new ArrayList<String>();
                ArrayList<String> OLDINVOICE = new ArrayList<String>();
                ArrayList<String> REALQTY = new ArrayList<String>();
                ArrayList<String> WEIGHT = new ArrayList<String>();



                if ((rec != null) && (rec.next())) {
                    page = "/table1.jsp";
                    while (rec.next()) {
                        MRNO.add(rec.getString("MRNO"));
                        ITEM.add(rec.getString("ITEM"));
                        ROLL.add(rec.getString("ROLL"));
                        PALET.add(rec.getString("PALET"));
                        PLANT.add(rec.getString("PLANT"));
                        DESC1.add(rec.getString("DESC1"));
                        DESC2.add(rec.getString("DESC2"));
                        DESC3.add(rec.getString("DESC3"));
                        PO.add(rec.getString("PO"));
                        POLN.add(rec.getString("POLN"));
                        INVOICEDATE.add(rec.getString("INVOICEDATE"));
                        CREATEDATE.add(rec.getString("CREATEDATE"));
                        QUANTITY.add(rec.getString("QUANTITY"));
                        UNIT.add(rec.getString("UNIT"));
                        SUPNAME.add(rec.getString("SUPNAME"));
                        INVOICE.add(rec.getString("INVOICE"));
                        GRADE.add(rec.getString("GRADE"));
                        CODE.add(rec.getString("CODE"));
                        BATCH.add(rec.getString("BATCH"));
                        CHANGEDATE.add(rec.getString("CHANGEDATE"));
                        COLOR.add(rec.getString("COLOR"));
                        SUPPLIER.add(rec.getString("SUPPLIER"));
                        DELIVERYNO.add(rec.getString("DELIVERYNO"));
                        PUGROUP.add(rec.getString("PUGROUP"));
                        PUNAME.add(rec.getString("PUNAME"));
                        TELEPHONE.add(rec.getString("TELEPHONE"));
                        PRICE.add(rec.getString("PRICE"));
                        PRD.add(rec.getString("PRD"));
                        LOT.add(rec.getString("LOT"));
                        PER.add(rec.getString("PER"));
                        CURR.add(rec.getString("CURR"));
                        TOQC.add(rec.getString("TOQC"));
                        TOTEST.add(rec.getString("TOTEST"));
                        RESULTQC.add(rec.getString("RESULTQC"));
                        RESULTTEST.add(rec.getString("RESULTTEST"));
                        PAGE.add(rec.getString("PAGE"));
                        AFTERQTY.add(rec.getString("AFTERQTY"));
                        REMARKRM1.add(rec.getString("REMARKRM1"));
                        REMARKRM2.add(rec.getString("REMARKRM2"));
                        REMARKRM3.add(rec.getString("REMARKRM3"));
                        SAVEDATE.add(rec.getString("SAVEDATE"));
                        DMWEIGHT.add(rec.getString("DMWEIGHT"));
                        MWEIGHT.add(rec.getString("MWEIGHT"));
                        RMWIDTH.add(rec.getString("RMWIDTH"));
                        REFMRNO.add(rec.getString("REFMRNO"));
                        OLDINVOICE.add(rec.getString("OLDINVOICE"));
                        REALQTY.add(rec.getString("REALQTY"));
                        WEIGHT.add(rec.getString("WEIGHT"));
                    }


                    request.setAttribute("MRNO", MRNO);
                    request.setAttribute("ITEM", ITEM);
                    request.setAttribute("ROLL", ROLL);
                    request.setAttribute("PALET", PALET);
                    request.setAttribute("PLANT", PLANT);
                    request.setAttribute("DESC1", DESC1);
                    request.setAttribute("DESC2", DESC2);
                    request.setAttribute("DESC3", DESC3);
                    request.setAttribute("PO", PO);
                    request.setAttribute("POLN", POLN);
                    request.setAttribute("INVOICEDATE", INVOICEDATE);
                    request.setAttribute("CREATEDATE", CREATEDATE);
                    request.setAttribute("QUANTITY", QUANTITY);
                    request.setAttribute("UNIT", UNIT);
                    request.setAttribute("SUPNAME", SUPNAME);
                    request.setAttribute("INVOICE", INVOICE);
                    request.setAttribute("GRADE", GRADE);
                    request.setAttribute("CODE", CODE);
                    request.setAttribute("BATCH", BATCH);
                    request.setAttribute("CHANGEDATE", CHANGEDATE);
                    request.setAttribute("COLOR", COLOR);
                    request.setAttribute("SUPPLIER", SUPPLIER);
                    request.setAttribute("DELIVERYNO", DELIVERYNO);
                    request.setAttribute("PUGROUP", PUGROUP);
                    request.setAttribute("PUNAME", PUNAME);
                    request.setAttribute("TELEPHONE", TELEPHONE);
                    request.setAttribute("PRICE", PRICE);
                    request.setAttribute("PRD", PRD);
                    request.setAttribute("LOT", LOT);
                    request.setAttribute("PER", PER);
                    request.setAttribute("CURR", CURR);
                    request.setAttribute("TOQC", TOQC);
                    request.setAttribute("TOTEST", TOTEST);
                    request.setAttribute("RESULTQC", RESULTQC);
                    request.setAttribute("RESULTTEST", RESULTTEST);
                    request.setAttribute("PAGE", PAGE);
                    request.setAttribute("AFTERQTY", AFTERQTY);
                    request.setAttribute("REMARKRM1", REMARKRM1);
                    request.setAttribute("REMARKRM2", REMARKRM2);
                    request.setAttribute("REMARKRM3", REMARKRM3);
                    request.setAttribute("SAVEDATE", SAVEDATE);
                    request.setAttribute("DMWEIGHT", DMWEIGHT);
                    request.setAttribute("MWEIGHT", MWEIGHT);
                    request.setAttribute("RMWIDTH", RMWIDTH);
                    request.setAttribute("REFMRNO", REFMRNO);
                    request.setAttribute("OLDINVOICE", OLDINVOICE);
                    request.setAttribute("REALQTY", REALQTY);
                    request.setAttribute("WEIGHT", WEIGHT);

                    request.setAttribute("status", "success");
                } else {
                    page = "/table1.jsp";
                    request.setAttribute("status", "error");
                }

                RequestDispatcher rd = getServletContext().getRequestDispatcher(page);
                rd.forward(request, response);

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
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
