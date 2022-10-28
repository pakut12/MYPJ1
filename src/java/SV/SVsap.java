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
import java.text.DecimalFormat;
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

            try {

                String status = request.getParameter("stasus").trim();
                if (status.equals("G")) {
                    Connection con = null;
                    ResultSet rec = null;
                    PreparedStatement pr = null;
                    PreparedStatement pr1 = null;

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

                        arrjson.add(n + 1);
                        arrjson.add(output.getString("MRNO"));
                        arrjson.add(output.getString("ITEM"));
                        arrjson.add(output.getString("ROLL"));
                        arrjson.add(output.getString("QUANTITY").replace(".000", ""));
                        arrjson.add(output.getString("UNIT"));
                        arrjson.add(output.getString("PALET"));
                        arrjson.add(output.getString("PLANT"));
                        arrjson.add(output.getString("PO"));
                        arrjson.add(output.getString("POLN"));
                        arrjson.add(output.getString("INVOICE"));
                        arrjson.add(output.getString("INVOICEDATE"));
                        arrjson.add(output.getString("CODE"));
                        arrjson.add(output.getString("BATCH"));
                        arrjson.add(output.getString("COLOR"));
                        arrjson.add(output.getString("GRADE"));
                        arrjson.add(output.getString("DESC1"));
                        arrjson.add(output.getString("DESC2"));
                        arrjson.add(output.getString("DESC3"));

                        arrlist.add(arrjson);
                        n++;
                    }
                    if (!PO.equals("") && !DOCQC.equals("")) {
                        if (output.getNumRows() > 0) {
                            obj.put("status", "true");
                        } else {
                            obj.put("status", "false");
                        }
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

                    String sqlwmbarcode = "INSERT INTO wmbarcode (MRNO, ITEM, ROLL, PALET, PLANT, DESC1, DESC2, DESC3, " +
                            "PO, POLN, INVOICEDATE, CREATEDATE, QUANTITY, UNIT, SUPNAME, INVOICE, GRADE, CODE, BATCH, " +
                            "CHANGEDATE, COLOR, SUPPLIER, DELIVERYNO, PUGROUP, PUNAME, TELEPHONE, PRICE, PRD, LOT, PER, CURR, " +
                            "TOQC, TOTEST) VALUES (?,?,?,?,?,?,?,?,?,?,TO_DATE(?, 'yyyy/mm/dd'),TO_DATE(?, 'yyyy/mm/dd'),?,?," +
                            "?,?,?,?,?,TO_DATE(?, 'yyyy/mm/dd'),?,?,?,?,?,?,?,?,?,?,?,?,?)";

                    String sqlwmmaster = "INSERT INTO wmmaster (BARCODE, MRNO, ITEM, ROLL) VALUES (?,?,?,?)";

                    Connection con = null;
                    Connection con1 = null;
                    ResultSet rec = null;
                    PreparedStatement pr = null;
                    PreparedStatement pr1 = null;

                    con = DB.ConnDB.getConnection();
                    con1 = DB.ConnDB.getConnection();

                    pr = con.prepareStatement(sqlwmbarcode);
                    pr1 = con1.prepareStatement(sqlwmmaster);

                    try {
                        for (int z = 0; z < output.getNumRows(); z++) {
                            output.setRow(z);

                            pr1.setString(1, output.getString(17));
                            pr1.setString(2, output.getString(0));
                            pr1.setString(3, output.getString(1));
                            pr1.setString(4, output.getString(2));
                            pr1.addBatch();

                            pr.setString(1, output.getString(0));
                            pr.setString(2, output.getString(1));
                            pr.setString(3, output.getString(2));
                            pr.setString(4, output.getString(3));
                            pr.setString(5, output.getString(4));
                            pr.setString(6, output.getString(5));
                            pr.setString(7, output.getString(6));
                            pr.setString(8, output.getString(7));
                            pr.setString(9, output.getString(8));
                            pr.setString(10, output.getString(9));
                            pr.setString(11, output.getString(10));
                            pr.setString(12, output.getString(11));
                            pr.setString(13, output.getString(12));
                            pr.setString(14, output.getString(13));
                            pr.setString(15, output.getString(14));
                            pr.setString(16, output.getString(15));
                            pr.setString(17, output.getString(16));
                            pr.setString(18, output.getString(17));
                            pr.setString(19, output.getString(18));
                            pr.setString(20, output.getString(19));
                            pr.setString(21, output.getString(20));
                            pr.setString(22, output.getString(21));
                            pr.setString(23, output.getString(22));
                            pr.setString(24, output.getString(23));
                            pr.setString(25, output.getString(24));
                            pr.setString(26, output.getString(25));
                            pr.setString(27, output.getString(26));
                            pr.setString(28, output.getString(27));
                            pr.setString(29, output.getString(28));
                            pr.setString(30, output.getString(29));
                            pr.setString(31, output.getString(30));
                            pr.setString(32, output.getString(31));
                            pr.setString(33, output.getString(32));
                            pr.addBatch();
                        }
                        pr.executeBatch();
                        pr1.executeBatch();
                        out.print("true");
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("false");
                    } finally {
                        rec.close();
                        pr.close();
                        pr1.close();
                        DB.ConnDB.closeConnection(con);
                        DB.ConnDB.closeConnection(con1);
                    }


                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                out.close();
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