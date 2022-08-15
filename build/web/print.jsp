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
                            <div class="card-header">
                                Home
                            </div>
                            <div class="card-body">
                                <form action="pdf" method="post" name="myform" class="needs-validation" novalidate>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="" id="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="number" name="" id="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="" id="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="col-auto">
                                        <table class="table table-sm table-bordered text-center" id="mytable" >
                                            <thead>
                                                <tr>
                                                    <th class="text-center">ลำดับ</th>
                                                    <th class="text-center">เลขที่เอกสาร</th>
                                                    <th class="text-center">รหัสวัตถุดิบ</th>
                                                    <th class="text-center">ม้วนที่</th>
                                                    <th class="text-center">ลำดับ</th>  
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
            for (int a = 0; a < 3000; a++) {
                                                %>
                                                <tr>
                                                    <td><%=a%></td>
                                                    <td>เลขที่เอกสาร</td>
                                                    <td>รหัสวัตถุดิบ</td>
                                                    <td>ม้วนที่</td>
                                                    <td>ลำดับ</td>  
                                                </tr>
                                                <%            }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row mt-3 text-center">
                                        <div class="col-3">
                                            <label>วันที่ผ้าเข้า</label>
                                            <input class="form-control form-control-sm" type="date"></input>
                                        </div>
                                        <div class="col-3">
                                            <label>เเถวทั้งหมด</label>
                                            <input class="form-control form-control-sm" type="text"></input>
                                        </div>
                                        <div class="col-3">
                                            <label>ความยาวทั้งหมด</label>
                                            <input class="form-control form-control-sm" type="text"></input>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-sm btn-success mt-4 w-75" type="submit">พิมพ์ใบเเจ้งเข้า</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <script>
            $(document).ready(function () {
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
