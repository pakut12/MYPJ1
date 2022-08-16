<%-- 
    Document   : home
    Created on : 30 ก.ค. 2565, 9:05:56
    Author     : Gus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="share/head.jsp"%> 
    </head>
    <body>
        
        
        <%@include file="share/nav.jsp" %>
        
        <div class="container">
            <div class="row">
                <%@ include file="share/profile.jsp" %>
                <div class="col-9">
                    <div id="pageview">
                        <div class="card shadow ">
                            <div class="card-header text-center">
                                ส่งข้อมูลให้ทาง QC
                            </div>
                            <div class="card-body">
                                
                                <%
            /*
            try {
            String name[] = request.getParameterValues("chkItem");
            if (name == null) {
            out.print("");
            } else {
            for (String x : name) {
            out.print(x);
            }
            }
            
            } catch (Exception e) {
            e.printStackTrace();
            }
             */

                                %>
                                
                                <form action="getdatawm" method="post" name="myform" class="needs-validation" novalidate>
                                    <div class="row mb-3">
                                        <div class="col-6">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <button class="btn btn-success mt-4 btn-sm" type="submit">ส่งข้อมูลไป QC</button>
                                        </div>
                                    </div>
                                </form> 
                                <table class="table table-sm table-bordered text-center" id="mytable" >
                                    <thead>
                                        <tr>
                                            <th>
                                                <div class="form-check">
                                                    <input class="form-check-input " type="checkbox" value="0"  name="chkAll" id="chkAll">
                                                </div>
                                            </th>
                                            <th class="text-center">MRNO </th>
                                            <th class="text-center">ITEM </th>
                                            <th class="text-center">ROLL </th>
                                            <th class="text-center">PALET </th>
                                            <th class="text-center">PLANT </th>
                                            <th class="text-center">DESC1 </th>
                                            <th class="text-center">DESC2</th>
                                            <th class="text-center">DESC3 </th>
                                            <th class="text-center">PO</th>
                                            <th class="text-center">POLN </th>
                                            <th class="text-center">INVOICEDATE </th>
                                            <th class="text-center">CREATEDATE </th>
                                            <th class="text-center">QUANTITY </th>
                                            <th class="text-center">UNIT </th>
                                            <th class="text-center">SUPNAME </th>
                                            <th class="text-center">INVOICE </th>
                                            <th class="text-center">GRADE </th>
                                            <th class="text-center">CODE </th>
                                            <th class="text-center">BATCH </th>
                                            <th class="text-center">CHANGEDATE </th>
                                            <th class="text-center">COLOR </th>
                                            <th class="text-center">SUPPLIER </th>
                                            <th class="text-center">DELIVERYNO </th>
                                            <th class="text-center">PUGROUP </th>
                                            <th class="text-center">PUNAME </th>
                                            <th class="text-center">TELEPHONE </th>
                                            <th class="text-center">PRICE </th>
                                            <th class="text-center">PRD</th>
                                            <th class="text-center">LOT</th>
                                            <th class="text-center">PER</th>
                                            <th class="text-center">CURR </th>
                                            <th class="text-center">TOQC </th>
                                            <th class="text-center">TOTEST </th>
                                            <th class="text-center">RESULTQC </th>
                                            <th class="text-center">RESULTTEST </th>
                                            <th class="text-center">PAGE </th>
                                            <th class="text-center">AFTERQTY </th>
                                            <th class="text-center">REMARKRM1 </th>
                                            <th class="text-center">REMARKRM2 </th>
                                            <th class="text-center">REMARKRM3 </th>
                                            <th class="text-center">SAVEDATE </th>
                                            <th class="text-center">DMWEIGHT </th>
                                            <th class="text-center">MWEIGHT </th>
                                            <th class="text-center">RMWIDTH </th>
                                            <th class="text-center">REFMRNO </th>
                                            <th class="text-center">OLDINVOICE </th>
                                            <th class="text-center">REALQTY </th>
                                            <th class="text-center">WEIGHT </th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <%

            try {
                String status = (String) request.getAttribute("status");

                if (status.trim() == "success") {

                    ArrayList<String> MRNO = (ArrayList) request.getAttribute("MRNO");
                    ArrayList<String> ITEM = (ArrayList) request.getAttribute("ITEM");
                    ArrayList<String> ROLL = (ArrayList) request.getAttribute("ROLL");
                    ArrayList<String> PALET = (ArrayList) request.getAttribute("PALET");
                    ArrayList<String> PLANT = (ArrayList) request.getAttribute("PLANT");
                    ArrayList<String> DESC1 = (ArrayList) request.getAttribute("DESC1");
                    ArrayList<String> DESC2 = (ArrayList) request.getAttribute("DESC2");
                    ArrayList<String> DESC3 = (ArrayList) request.getAttribute("DESC3");
                    ArrayList<String> PO = (ArrayList) request.getAttribute("PO");
                    ArrayList<String> POLN = (ArrayList) request.getAttribute("POLN");
                    ArrayList<String> INVOICEDATE = (ArrayList) request.getAttribute("INVOICEDATE");
                    ArrayList<String> CREATEDATE = (ArrayList) request.getAttribute("CREATEDATE");
                    ArrayList<String> QUANTITY = (ArrayList) request.getAttribute("QUANTITY");
                    ArrayList<String> UNIT = (ArrayList) request.getAttribute("UNIT");
                    ArrayList<String> SUPNAME = (ArrayList) request.getAttribute("SUPNAME");
                    ArrayList<String> INVOICE = (ArrayList) request.getAttribute("INVOICE");
                    ArrayList<String> GRADE = (ArrayList) request.getAttribute("GRADE");
                    ArrayList<String> CODE = (ArrayList) request.getAttribute("CODE");
                    ArrayList<String> BATCH = (ArrayList) request.getAttribute("BATCH");
                    ArrayList<String> CHANGEDATE = (ArrayList) request.getAttribute("CHANGEDATE");
                    ArrayList<String> COLOR = (ArrayList) request.getAttribute("COLOR");
                    ArrayList<String> SUPPLIER = (ArrayList) request.getAttribute("SUPPLIER");
                    ArrayList<String> DELIVERYNO = (ArrayList) request.getAttribute("DELIVERYNO");
                    ArrayList<String> PUGROUP = (ArrayList) request.getAttribute("PUGROUP");
                    ArrayList<String> PUNAME = (ArrayList) request.getAttribute("PUNAME");
                    ArrayList<String> TELEPHONE = (ArrayList) request.getAttribute("TELEPHONE");
                    ArrayList<String> PRICE = (ArrayList) request.getAttribute("PRICE");
                    ArrayList<String> PRD = (ArrayList) request.getAttribute("PRD");
                    ArrayList<String> LOT = (ArrayList) request.getAttribute("LOT");
                    ArrayList<String> PER = (ArrayList) request.getAttribute("PER");
                    ArrayList<String> CURR = (ArrayList) request.getAttribute("CURR");
                    ArrayList<String> TOQC = (ArrayList) request.getAttribute("TOQC");
                    ArrayList<String> TOTEST = (ArrayList) request.getAttribute("TOTEST");
                    ArrayList<String> RESULTQC = (ArrayList) request.getAttribute("RESULTQC");
                    ArrayList<String> RESULTTEST = (ArrayList) request.getAttribute("RESULTTEST");
                    ArrayList<String> PAGE = (ArrayList) request.getAttribute("PAGE");
                    ArrayList<String> AFTERQTY = (ArrayList) request.getAttribute("AFTERQTY");
                    ArrayList<String> REMARKRM1 = (ArrayList) request.getAttribute("REMARKRM1");
                    ArrayList<String> REMARKRM2 = (ArrayList) request.getAttribute("REMARKRM2");
                    ArrayList<String> REMARKRM3 = (ArrayList) request.getAttribute("REMARKRM3");
                    ArrayList<String> SAVEDATE = (ArrayList) request.getAttribute("SAVEDATE");
                    ArrayList<String> DMWEIGHT = (ArrayList) request.getAttribute("DMWEIGHT");
                    ArrayList<String> MWEIGHT = (ArrayList) request.getAttribute("MWEIGHT");
                    ArrayList<String> RMWIDTH = (ArrayList) request.getAttribute("RMWIDTH");
                    ArrayList<String> REFMRNO = (ArrayList) request.getAttribute("REFMRNO");
                    ArrayList<String> OLDINVOICE = (ArrayList) request.getAttribute("OLDINVOICE");
                    ArrayList<String> REALQTY = (ArrayList) request.getAttribute("REALQTY");
                    ArrayList<String> WEIGHT = (ArrayList) request.getAttribute("WEIGHT");

                    for (int n = 0; n < MRNO.size(); n++) {

                                        %>
                                        <tr>
                                            <td> 
                                                <div class="form-check">
                                                    <input class="form-check-input " type="checkbox" value="0"  name="chkitem" id="chkitem">
                                                </div>
                                            </td>
                                            <td><%=MRNO.get(n)%></td>
                                            <td><%=ITEM.get(n)%></td>
                                            <td><%=ROLL.get(n)%></td>
                                            <td><%=PALET.get(n)%></td>
                                            <td><%=PLANT.get(n)%></td>
                                            <td><%=DESC1.get(n)%></td>
                                            <td><%=DESC2.get(n)%></td>
                                            <td><%=DESC3.get(n)%></td>
                                            <td><%=PO.get(n)%></td>
                                            <td><%=POLN.get(n)%></td>
                                            <td><%=INVOICEDATE.get(n)%></td>
                                            <td><%=CREATEDATE.get(n)%></td>
                                            <td><%=QUANTITY.get(n)%></td>
                                            <td><%=UNIT.get(n)%></td>
                                            <td><%=SUPNAME.get(n)%></td>
                                            <td><%=INVOICE.get(n)%></td>
                                            <td><%=GRADE.get(n)%></td>
                                            <td><%=CODE.get(n)%></td>
                                            <td><%=BATCH.get(n)%></td>
                                            <td><%=CHANGEDATE.get(n)%></td>
                                            <td><%=COLOR.get(n)%></td>
                                            <td><%=SUPPLIER.get(n)%></td>
                                            <td><%=DELIVERYNO.get(n)%></td>
                                            <td><%=PUGROUP.get(n)%></td>
                                            <td><%=PUNAME.get(n)%></td>
                                            <td><%=TELEPHONE.get(n)%></td>
                                            <td><%=PRICE.get(n)%></td>
                                            <td><%=PRD.get(n)%></td>
                                            <td><%=LOT.get(n)%></td>
                                            <td><%=PER.get(n)%></td>
                                            <td><%=CURR.get(n)%></td>
                                            <td><%=TOQC.get(n)%></td>
                                            <td><%=TOTEST.get(n)%></td>
                                            <td><%=RESULTQC.get(n)%></td>
                                            <td><%=RESULTTEST.get(n)%></td>
                                            <td><%=PAGE.get(n)%></td>
                                            <td><%=AFTERQTY.get(n)%></td>
                                            <td><%=REMARKRM1.get(n)%></td>
                                            <td><%=REMARKRM2.get(n)%></td>
                                            <td><%=REMARKRM3.get(n)%></td>
                                            <td><%=SAVEDATE.get(n)%></td>
                                            <td><%=DMWEIGHT.get(n)%></td>
                                            <td><%=MWEIGHT.get(n)%></td>
                                            <td><%=RMWIDTH.get(n)%></td>
                                            <td><%=REFMRNO.get(n)%></td>
                                            <td><%=OLDINVOICE.get(n)%></td>
                                            <td><%=REALQTY.get(n)%></td>
                                            <td><%=WEIGHT.get(n)%></td>
                                            
                                        </tr>
                                        <%
                    }

                } else if (status.trim() == "error") {
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
                                        %>
                                        
                                    </tbody>
                                </table> 
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            $(document).ready(function () {
                $("#chkAll").change(function () {
                    $("input:checkbox").prop('checked', $(this).prop("checked"));
                });
                
                $("#page2").addClass("active");
                $("#mytable").DataTable({
                    responsive: true
                });
            });
        </script>
        <script>
            (function () {
                'use strict'
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            })()
        </script>
        <br><br><br><br><br>
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>
