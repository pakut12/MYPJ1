package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.text.*;

public final class table1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(4);
    _jspx_dependants.add("/share/head.jsp");
    _jspx_dependants.add("/share/nav.jsp");
    _jspx_dependants.add("/share/profile.jsp");
    _jspx_dependants.add("/share/footer.jsp");
  }

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>โปรเเกรมดึงข้อมูลจากระบบ SAP ด้วยเลขที่ PO</title>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css\" integrity=\"sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor\" crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Bai+Jamjuree:wght@300&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css\">\r\n");
      out.write("<script src=\"https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.datatables.net/buttons/2.2.3/js/buttons.bootstrap5.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.datatables.net/buttons/2.2.3/js/buttons.colVis.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css\">\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("    body{\r\n");
      out.write("        font-family: 'Bai Jamjuree', sans-serif;\r\n");
      out.write("    }\r\n");
      out.write("</style>\r\n");
      out.write(" \r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-expand-lg bg-light fixed-top shadow \">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <a class=\"navbar-brand\" href=\"#\">Navbar</a>\r\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("        </button>\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("            <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link \" aria-current=\"page\" href=\"home.jsp\" id=\"page1\">หน้าเเรก</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"table.jsp\" id=\"page2\">ดึงข้อมูลจาก SAP</a>\r\n");
      out.write("                </li>  \r\n");
      out.write("                 <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"table1.jsp\" id=\"page3\">ส่งข้อมูลให้ทาง QC</a>\r\n");
      out.write("                </li> \r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"sap\" id=\"page7\" >SAP</a>   \r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"index.jsp\">Logout</a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</nav>\r\n");
      out.write("<br><br><br><br>\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"col-3\"> \r\n");
      out.write("    <div class=\"card shadow \">\r\n");
      out.write("        <div class=\"card-header\">\r\n");
      out.write("            โปรไฟล์\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"card-body text-center\">\r\n");
      out.write("            ");

            String pattern = "dd/MM/yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date = simpleDateFormat.format(new Date());
            
      out.write("\r\n");
      out.write("            <p>User : ");
      out.print( session.getAttribute("user"));
      out.write("</p>\r\n");
      out.write("            <p>Date : ");
      out.print(date);
      out.write("</p>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col-9\">\r\n");
      out.write("                    <div id=\"pageview\">\r\n");
      out.write("                        <div class=\"card shadow \">\r\n");
      out.write("                            <div class=\"card-header text-center\">\r\n");
      out.write("                                ส่งข้อมูลให้ทาง QC\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                <form action=\"\" method=\"post\" name=\"myform\" class=\"needs-validation\" novalidate>\r\n");
      out.write("                                    <div class=\"row mb-3\">\r\n");
      out.write("                                        <div class=\"col-6\">\r\n");
      out.write("                                            <label>เลขที่เอกสาร : </label>\r\n");
      out.write("                                            <input class=\"form-control form-control-sm\" type=\"number\" name=\"\" id=\"\" required></input>\r\n");
      out.write("                                            <div class=\"invalid-feedback mb-3 text-center\">\r\n");
      out.write("                                                กรุณาใส่ข้อมูลให้ถูกต้อง\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"col-6\">\r\n");
      out.write("                                            <button class=\"btn btn-success mt-4 btn-sm\" type=\"submit\">ส่งข้อมูลไป QC</button>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </form>\r\n");
      out.write("                                <div class=\"col-12\">\r\n");
      out.write("                                    <form action=\"table1.jsp\" method=\"post\">\r\n");
      out.write("                                        <table class=\"table table-sm table-bordered text-center\" id=\"mytable\" >\r\n");
      out.write("                                            <thead>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                    <th>\r\n");
      out.write("                                                        <div class=\"form-check\">\r\n");
      out.write("                                                            <input class=\"form-check-input \" type=\"checkbox\" value=\"0\"  name=\"chkAll\" id=\"chkAll\">\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                    </th>\r\n");
      out.write("                                                    <th class=\"text-center\">ลำดับ</th>\r\n");
      out.write("                                                    <th class=\"text-center\">เลขที่เอกสาร</th>\r\n");
      out.write("                                                    <th class=\"text-center\">รหัสวัตถุดิบ</th>\r\n");
      out.write("                                                    <th class=\"text-center\">ม้วนที่</th>\r\n");
      out.write("                                                    <th class=\"text-center\">ลำดับ</th>  \r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                            </thead>\r\n");
      out.write("                                            <tbody>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                    <td width=\"5%\">\r\n");
      out.write("                                                        <div class=\"form-check\">\r\n");
      out.write("                                                            <input class=\"form-check-input \" type=\"checkbox\" value=\"1\" name=\"chkItem\" id=\"chkItem\">\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                    </td>\r\n");
      out.write("                                                    <td>ลำดับ</td>\r\n");
      out.write("                                                    <td>เลขที่เอกสาร</td>\r\n");
      out.write("                                                    <td>รหัสวัตถุดิบ</td>\r\n");
      out.write("                                                    <td>ม้วนที่</td>\r\n");
      out.write("                                                    <td>ลำดับ</td>  \r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                    <td width=\"5%\">\r\n");
      out.write("                                                        <div class=\"form-check\">\r\n");
      out.write("                                                            <input class=\"form-check-input \" type=\"checkbox\" value=\"2\" name=\"chkItem\" id=\"chkItem\">\r\n");
      out.write("                                                        </div>\r\n");
      out.write("                                                    </td>\r\n");
      out.write("                                                    <td>ลำดับ</td>\r\n");
      out.write("                                                    <td>เลขที่เอกสาร</td>\r\n");
      out.write("                                                    <td>รหัสวัตถุดิบ</td>\r\n");
      out.write("                                                    <td>ม้วนที่</td>\r\n");
      out.write("                                                    <td>ลำดับ</td>  \r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                            </tbody>\r\n");
      out.write("                                        </table>\r\n");
      out.write("                                        <button type=\"submit\">asdasd</button>\r\n");
      out.write("                                        ");

            String name[] = request.getParameterValues("chkItem");
            for (String msg : name) {
                out.print(msg);
            }

                                        
      out.write("\r\n");
      out.write("                                    </form>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("                $(\"#chkAll\").change(function () {\r\n");
      out.write("                    $(\"input:checkbox\").prop('checked', $(this).prop(\"checked\"));\r\n");
      out.write("                });\r\n");
      out.write("                \r\n");
      out.write("                $(\"#page3\").addClass(\"active\");\r\n");
      out.write("                $(\"#mytable\").DataTable({\r\n");
      out.write("                    responsive: true\r\n");
      out.write("                });\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("        <script>\r\n");
      out.write("            (function () {\r\n");
      out.write("                'use strict'\r\n");
      out.write("                // Fetch all the forms we want to apply custom Bootstrap validation styles to\r\n");
      out.write("                var forms = document.querySelectorAll('.needs-validation')\r\n");
      out.write("\r\n");
      out.write("                // Loop over them and prevent submission\r\n");
      out.write("                Array.prototype.slice.call(forms)\r\n");
      out.write("                .forEach(function (form) {\r\n");
      out.write("                    form.addEventListener('submit', function (event) {\r\n");
      out.write("                        if (!form.checkValidity()) {\r\n");
      out.write("                            event.preventDefault()\r\n");
      out.write("                            event.stopPropagation()\r\n");
      out.write("                        }\r\n");
      out.write("                        form.classList.add('was-validated')\r\n");
      out.write("                    }, false)\r\n");
      out.write("                })\r\n");
      out.write("            })()\r\n");
      out.write("        </script>\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js\" integrity=\"sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js\" integrity=\"sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("<div class=\"container fixed-bottom\">\r\n");
      out.write("    <footer class=\"py-3 my-4\">\r\n");
      out.write("        <ul class=\"nav justify-content-center border-bottom pb-3 mb-3\">\r\n");
      out.write("            <li class=\"nav-item\"><a href=\"#\" class=\"nav-link px-2 text-muted\">Home</a></li>\r\n");
      out.write("            <li class=\"nav-item\"><a href=\"#\" class=\"nav-link px-2 text-muted\">Features</a></li>\r\n");
      out.write("            <li class=\"nav-item\"><a href=\"#\" class=\"nav-link px-2 text-muted\">Pricing</a></li>\r\n");
      out.write("            <li class=\"nav-item\"><a href=\"#\" class=\"nav-link px-2 text-muted\">FAQs</a></li>\r\n");
      out.write("            <li class=\"nav-item\"><a href=\"#\" class=\"nav-link px-2 text-muted\">About</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <p class=\"text-center text-muted\">&copy; 2022 Company, Inc</p>\r\n");
      out.write("    </footer>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
