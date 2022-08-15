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

            try {
                String name[] = request.getParameterValues("chkItem");
                if (name == null) {
                    out.print("NO");
                } else {
                    for (String x : name) {
                        out.print(x);
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

                                %>
                                <form action="table1.jsp" method="post" name="myform" class="needs-validation" novalidate>
                                    <div class="row mb-3">
                                        <div class="col-6">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="" id="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <button class="btn btn-success mt-4 btn-sm" type="submit">ส่งข้อมูลไป QC</button>
                                        </div>
                                    </div>
                                    
                                    <table class="table table-sm table-bordered text-center" id="mytable" >
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check">
                                                        <input class="form-check-input " type="checkbox" value="0"  name="chkAll" id="chkAll">
                                                    </div>
                                                </th>
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                                <th class="text-center">ม้วนที่</th>
                                                <th class="text-center">ลำดับ</th>  
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td width="5%">
                                                    <div class="form-check">
                                                        <input class="form-check-input " type="checkbox" value="1" name="chkItem" id="chkItem">
                                                    </div>
                                                </td>
                                                <td>ลำดับ</td>
                                                <td>เลขที่เอกสาร</td>
                                                <td>รหัสวัตถุดิบ</td>
                                                <td>ม้วนที่</td>
                                                <td>ลำดับ</td>  
                                            </tr>
                                            <tr>
                                                <td width="5%">
                                                    <div class="form-check">
                                                        <input class="form-check-input " type="checkbox" value="2" name="chkItem" id="chkItem">
                                                    </div>
                                                </td>
                                                <td>ลำดับ</td>
                                                <td>เลขที่เอกสาร</td>
                                                <td>รหัสวัตถุดิบ</td>
                                                <td>ม้วนที่</td>
                                                <td>ลำดับ</td>  
                                            </tr>
                                        </tbody>
                                    </table> 
                                </form>        
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
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>
