package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class displayprint_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css\" integrity=\"sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-color:black\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"h3 fw-bold\">ใบเเจ้งเข้าวัตถุดิบ</div>\n");
      out.write("        \n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold\">Name of Vendor : </label>\n");
      out.write("                <label>บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)</label> \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div  class=\"col-6\">\n");
      out.write("                <label class=\"fw-bold\">Documaent No. :</label>\n");
      out.write("                <label>902208002776</label> \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold\">Po No. : </label>\n");
      out.write("                <label>4592200652  /20</label> \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold\">Pallet : </label>\n");
      out.write("                <label>39</label> \n");
      out.write("            </div> \n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div  class=\"col-3 \">\n");
      out.write("                <label class=\"fw-bold\">Current Date : </label>\n");
      out.write("                <label>15/8/2022 11:33:55</label> \n");
      out.write("            </div>\n");
      out.write("            <div  class=\"col-3 \">\n");
      out.write("                <label class=\"fw-bold\">วันที่ผ้าเข้า : </label>\n");
      out.write("                <label class=\"h3\">11/8/2022</label> \n");
      out.write("            </div>\n");
      out.write("            <div  class=\"col-4 \">\n");
      out.write("                <label class=\"fw-bold\">Invoice No : </label>\n");
      out.write("                <label>193139</label> \n");
      out.write("            </div> \n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold\">Plant : </label>\n");
      out.write("                <label>9000</label> \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold\">Invoice date : </label>\n");
      out.write("                <label>11/8/2022</label> \n");
      out.write("            </div> \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold \">Materal : </label>\n");
      out.write("                <label class=\"h3\">90BKL0174-DG65</label> \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label>20174EA POLY KNIT WD.66 C#92/DKCHARCOAL</label> \n");
      out.write("            </div> \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold\">Lot : </label>\n");
      out.write("                <label></label> \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div  class=\"col-6 \">\n");
      out.write("                <label class=\"fw-bold\">Quantity : </label>\n");
      out.write("                <label class=\"h3\">631</label> \n");
      out.write("                <label>YD</label> \n");
      out.write("            </div> \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"row mt-2\">\n");
      out.write("            <div  class=\"col-12 \">\n");
      out.write("                <table class=\"table table-bordered border-dark text-center\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>เบอร์สี</th>\n");
      out.write("                            <th>หน้า</th>\n");
      out.write("                            <th colspan=\"10\">รายการ</th>\n");
      out.write("                            <th colspan=\"2\"></th>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <th></th>\n");
      out.write("                            <th>กว้าง</th>\n");
      out.write("                            <th>1</th>\n");
      out.write("                            <th>2</th>\n");
      out.write("                            <th>3</th>\n");
      out.write("                            <th>4</th>\n");
      out.write("                            <th>5</th>\n");
      out.write("                            <th>6</th>\n");
      out.write("                            <th>7</th>\n");
      out.write("                            <th>8</th>\n");
      out.write("                            <th>9</th>\n");
      out.write("                            <th>10</th>\n");
      out.write("                            <th>YD</th>\n");
      out.write("                            <th>ม้วย</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td>40</td>\n");
      out.write("                            <td>45</td>\n");
      out.write("                            <td>45</td>\n");
      out.write("                            <td>45</td>\n");
      out.write("                            <td>45</td>\n");
      out.write("                            <td>45</td>\n");
      out.write("                            <td>45</td>\n");
      out.write("                            <td>44</td>\n");
      out.write("                            <td>45</td>\n");
      out.write("                            <td>47</td>\n");
      out.write("                            <td>631</td>\n");
      out.write("                            <td>14</td>\n");
      out.write("                            \n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td>47</td>\n");
      out.write("                            <td>47</td>\n");
      out.write("                            <td>47</td>\n");
      out.write("                            <td>44</td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            \n");
      out.write("                        </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div  class=\"col-4 \">\n");
      out.write("                <label class=\"fw-bold\">ผู้เเจ้งเข้า : </label>\n");
      out.write("                <label>..................................................</label> \n");
      out.write("            </div>\n");
      out.write("            <div  class=\"col-4 \">\n");
      out.write("                <label class=\"fw-bold\">ผู้รับตรวจสอบ : </label>\n");
      out.write("                <label>..................................................</label> \n");
      out.write("            </div>\n");
      out.write("            <div  class=\"col-4 \">\n");
      out.write("                <label class=\"fw-bold\">วันที่ตรวจเสร็จ : </label>\n");
      out.write("                <label>..................................................</label> \n");
      out.write("            </div> \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("                window.print();\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
