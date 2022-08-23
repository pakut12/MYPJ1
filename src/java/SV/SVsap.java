/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import DB.ConnectSap;
import com.sap.mw.jco.IFunctionTemplate;
import com.sap.mw.jco.*;
import java.io.*;
import java.net.*;



import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author pakutsing
 */
public class SVsap extends HttpServlet {

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
            Connection con = null;
            ResultSet rec = null;
            PreparedStatement pr = null;
            PreparedStatement pr1 = null;
            try {
                String status = request.getParameter("stasus").trim();
                if (status.equals("G")) {
                    String PO = request.getParameter("PO").trim();
                    String DOCQC = request.getParameter("DOCQC").trim();

                    JCO.Client client = ConnectSap.createpool();
                    JCO.Repository repository = new JCO.Repository("Myrep", client);
                    IFunctionTemplate ftemplate1 = repository.getFunctionTemplate("ZBAPI_BI_QI_DISPLAY");
                    JCO.Function function1 = new JCO.Function(ftemplate1);
                    JCO.ParameterList input1 = function1.getImportParameterList();

//                input1.setValue("4592200648", "PO");
//                input1.setValue("902208002765", "DOCQC");
                    input1.setValue(PO.toString(), "PO");
                    input1.setValue(DOCQC.toString(), "DOCQC");

                    client.execute(function1);
                    JCO.Table output = function1.getTableParameterList().getTable("TABLEDATA");

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;

                    for (int z = 0; z < output.getNumRows(); z++) {
                        output.setRow(z);
                        JSONArray arrjson = new JSONArray();
                        arrjson.add("");
                        arrjson.add(n + 1);
                        for (int a = 0; a <= 48; a++) {
                            try {
                                arrjson.add(output.getString(a));
                            } catch (Exception e) {
                                arrjson.add("");
                            }
//arrjson.add(output.getString(a));
                        }
                        arrlist.add(arrjson);
                        n++;
                    }

                    obj.put("data", arrlist);
                    out.print(obj);
                } else if (status.equals("S")) {
                    String PO = request.getParameter("PO").trim();
                    String DOCQC = request.getParameter("DOCQC").trim();

                    JCO.Client client = ConnectSap.createpool();
                    JCO.Repository repository = new JCO.Repository("Myrep", client);
                    IFunctionTemplate ftemplate1 = repository.getFunctionTemplate("ZBAPI_BI_QI_DISPLAY");
                    JCO.Function function1 = new JCO.Function(ftemplate1);
                    JCO.ParameterList input1 = function1.getImportParameterList();

//                    input1.setValue("4592200648", "PO");
//                    input1.setValue("902208002765", "DOCQC");
                    input1.setValue(PO.toString(), "PO");
                    input1.setValue(DOCQC.toString(), "DOCQC");

                    client.execute(function1);
                    JCO.Table output = function1.getTableParameterList().getTable("TABLEDATA");



                    String sqlwmbarcode = "INSERT INTO wmbarcode (MRNO, ITEM, ROLL, PALET, PLANT, DESC1, DESC2, DESC3, PO, POLN, INVOICEDATE, CREATEDATE, QUANTITY, UNIT, SUPNAME, INVOICE, GRADE, CODE, BATCH, CHANGEDATE, COLOR, SUPPLIER, DELIVERYNO, PUGROUP, PUNAME, TELEPHONE, PRICE, PRD, LOT, PER, CURR, TOQC, TOTEST, RESULTQC, RESULTTEST, PAGE, AFTERQTY, REMARKRM1, REMARKRM2, REMARKRM3, SAVEDATE, DMWEIGHT, MWEIGHT, RMWIDTH, REFMRNO, OLDINVOICE, REALQTY, WEIGHT) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

                    String sqlwmmaster = "INSERT INTO wmmaster (BARCODE, MRNO, ITEM, ROLL) VALUES (?,?,?,?)";
                    con = DB.ConnDB.getConnDB();

                    pr = con.prepareStatement(sqlwmbarcode);
                    pr1 = con.prepareStatement(sqlwmmaster);
                    int chack = 0;

                    for (int z = 0; z < output.getNumRows(); z++) {
                        output.setRow(z);
                        for (int a = 1; a <= 48; a++) {
                            try {
                                if (a == 3 || a == 4 || a == 10) {
                                    pr.setInt(a, output.getInt(a - 1));
                                } else {
                                    pr.setString(a, output.getString(a - 1));
                                }
                            } catch (Exception e) {
                                pr.setString(a, null);
                            //e.printStackTrace();
                            }
                        }

                        pr1.setString(1, output.getString(17));
                        pr1.setString(2, output.getString(0));
                        pr1.setString(3, output.getString(1));
                        pr1.setString(4, output.getString(2));

                        try {
                            pr1.executeUpdate();
                            pr.executeUpdate();
                            chack++;
                        } catch (Exception e) {
                            e.printStackTrace();
                        //out.print("false");
                        }




//                        pr.setString(1, output.getString(0));
//                        pr.setString(2, output.getString(1));
//                        pr.setString(3, output.getString(2));
//                        pr.setString(4, output.getString(3));
//                        pr.setString(5, output.getString(4));
//                        pr.setString(6, output.getString(5));
//                        pr.setString(7, output.getString(6));
//                        pr.setString(8, output.getString(7));
//                        pr.setString(9, output.getString(8));
//                        pr.setString(10, output.getString(9));
//                        pr.setString(11, output.getString(10));
//                        pr.setString(12, output.getString(11));
//                        pr.setString(13, output.getString(12));
//                        pr.setString(14, output.getString(13));
//                        pr.setString(15, output.getString(14));
//                        pr.setString(16, output.getString(15));
//                        pr.setString(17, output.getString(16));
//                        pr.setString(18, output.getString(17));
//                        pr.setString(19, output.getString(18));
//                        pr.setString(20, output.getString(19));
//                        pr.setString(21, output.getString(20));
//                        pr.setString(22, output.getString(21));
//                        pr.setString(23, output.getString(22));
//                        pr.setString(24, output.getString(23));
//                        pr.setString(25, output.getString(24));
//                        pr.setString(26, output.getString(25));
//                        pr.setString(27, output.getString(26));
//                        pr.setString(28, output.getString(27));
//                        pr.setString(29, output.getString(28));
//                        pr.setString(30, output.getString(29));
//                        pr.setString(31, output.getString(30));
//                        pr.setString(32, output.getString(31));
//                        pr.setString(33, output.getString(32));
//                        pr.setString(34, "");
//                        pr.setString(35, "");
//                        pr.setString(36, "");
//                        pr.setString(37, "");
//                        pr.setString(38, "");
//                        pr.setString(39, "");
//                        pr.setString(40, "");
//                        pr.setString(41, "");
//                        pr.setString(42, "");
//                        pr.setString(43, "");
//                        pr.setString(44, "");
//                        pr.setString(45, "");
//                        pr.setString(46, "");
//                        pr.setString(47, "");
//                        pr.setString(48, "");

//                        pr.executeUpdate();

                    }

                    if (chack > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
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
