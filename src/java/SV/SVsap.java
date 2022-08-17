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

import javax.servlet.*;
import javax.servlet.http.*;

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

                JCO.Client client = ConnectSap.createpool();
                JCO.Repository repository = new JCO.Repository("Myrep", client);
                IFunctionTemplate ftemplate1 = repository.getFunctionTemplate("ZBAPI_BI_QI_DISPLAY");
                JCO.Function function1 = new JCO.Function(ftemplate1);
                JCO.ParameterList input1 = function1.getImportParameterList();

                input1.setValue("4592200648", "PO");
                input1.setValue("902208002765", "DOCQC");

                client.execute(function1);
                JCO.Table output = function1.getTableParameterList().getTable("TABLEDATA");



                while (output.nextRow()) {
                    for (int a = 0; a < output.getNumColumns(); a++) {
                        out.print("<br>");
                        out.print(output.getString(a));
                        out.print("<br>");
                    }
                    out.print("-----------------------------------------------");
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
