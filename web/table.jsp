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
                                ดึงข้อมูลจาก SAP
                            </div>
                            <div class="card-body">
                                
                                <div class="row mb-3">
                                    
                                    <div class="col-4">
                                        <label>Purchase Order : </label>
                                        <input class="form-control form-control-sm" type="number" name="PO" id="PO" required></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>เลขที่เอกสาร : </label>
                                        <input class="form-control form-control-sm" type="number" name="DOCQC" id="DOCQC" required></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <button class="btn btn-success mt-4 btn-sm" type="submit" name="getdata_sap" id="getdata_sap">ดึงข้อมูล</button>
                                        <button class="btn btn-success mt-4 btn-sm" type="submit" name="savedata_sap" id="savedata_sap">จัดเก็บข้อมูล</button>
                                        <button class="btn btn-danger mt-4 btn-sm" type="submit" name="claerdata_sap" id="claerdata_sap">เครียร์ข้อมูล</button>
                                    </div>
                                </div>
                                
                                <div class="col-auto">
                                    <table class="table table-sm table-bordered text-center" id="mytable" >
                                        <thead>
                                            <tr>
                                                <th class="text-center"></th>
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                                <th class="text-center">ม้วนที่</th>
                                                <th class="text-center">ลำดับ</th>  
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                                <th class="text-center">ม้วนที่</th>
                                                <th class="text-center">ลำดับ</th>  
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                                <th class="text-center">ม้วนที่</th>
                                                <th class="text-center">ลำดับ</th>  
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                                <th class="text-center">ม้วนที่</th>
                                                <th class="text-center">ลำดับ</th>  
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                                <th class="text-center">ม้วนที่</th>
                                                <th class="text-center">ลำดับ</th>  
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                                <th class="text-center">ม้วนที่</th>
                                                <th class="text-center">ลำดับ</th>  
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">เลขที่เอกสาร</th>
                                                <th class="text-center">รหัสวัตถุดิบ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <script>
            $(document).ready(function () {
                $("#page2").addClass("active");
               
                function getdatasap(po,docqc){
                    $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'sap?stasus=G&PO='+po+'&DOCQC='+docqc,
                        responsive: true
                    });  
                }
                function savedatasap(po,docqc){
                    $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'sap?stasus=S&PO='+po+'&DOCQC='+docqc,
                        responsive: true
                    });  
                }
                
                getdatasap("", "");
                $("#savedata_sap").addClass("disabled");
              
                
                $("#getdata_sap").click(function(){
                    var getpo =  $("#PO").val();
                    var getdocqc = $("#DOCQC").val();
                    
                    if(getpo == "" || getdocqc == ""){
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                    }else{
                        getdatasap(getpo, getdocqc); 
                        $("#savedata_sap").removeClass("disabled");
                    }
                });
                
    
    
                $("#claerdata_sap").click(function(){
                    $("#PO").val("");
                    $("#DOCQC").val("");
                    getdatasap("", "");
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
