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
                                โปรเเกรมคีย์เเละเเก้ไขข้อมูลใบ Invoice
                            </div>
                            <div class="card-body">
                                <form action="" method="post" name="myform" class="needs-validation" novalidate>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                            
                                        </div>
                                        <div class="col-4">
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-getdata" type="button">ดึงข้อมูล</button>
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button">บันทึก</button>
                                        </div>
                                    </div>
                                    
                                </form> 
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <div class="text-center">
                                            <label class="h3">Table WMBARCODE</label> 
                                        </div>
                                        <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                            <thead >
                                                <tr>
                                                    <th class="text-center">รหัสวัตดุดิบ</th>
                                                    <th class="text-center">ม้วน</th>
                                                    <th class="text-center">จำนวน</th>
                                                    <th class="text-center">หน่วยนับ</th>
                                                    <th class="text-center">สี</th>
                                                    <th class="text-center">หม้อย้อน</th>
                                                    <th class="text-center">รายละเอียด</th>
                                                    <th class="text-center"></th>
                                                    <th class="text-center"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                            
                                        </table> 
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="text-center">
                                        <label class="h3">Table WMQCK</label> 
                                    </div>
                                    <div class="col-12">
                                        <table class="table table-sm table-bordered  text-center" id="mytable1"  >
                                            <thead >
                                                <tr>
                                                    <th class="text-center">รหัสวัตดุดิบ</th>
                                                    <th class="text-center">ม้วน</th>
                                                    <th class="text-center">จำนวน</th>
                                                    <th class="text-center">หน่วยนับ</th>
                                                    <th class="text-center">สี</th>
                                                    <th class="text-center">หม้อย้อน</th>
                                                    <th class="text-center">รายละเอียด</th>
                                                    <th class="text-center"></th>
                                                    <th class="text-center"></th>
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
        </div>
        
        <script>
            
            $(document).ready(function () {
                var table;
                function getdata(mrno){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G3&mrno='+mrno,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                        columnDefs: [
                            { "width": "10rem", "targets": 0 },
                            { "width": "5rem", "targets": 1 },
                            { "width": "5rem", "targets": 2 },
                            { "width": "5rem", "targets": 3 },
                            { "width": "5rem", "targets": 4 },
                            { "width": "15rem", "targets": 5 },
                            { "width": "25rem", "targets": 6 },
                          
                        ]   
                                             
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G3&mrno='+mrno,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#count").val(de.count);   
                            
                            $("#PLANT").val(de.PLANT);           
                            $("#PO").val(de.PO);      
                            $("#SUPNAME").val(de.SUPNAME);           
                            $("#INVOICE").val(de.INVOICE);
                            $("#INVOICEDATE").val(de.INVOICEDATE);           
                            $("#DELIVERYNO").val(de.DELIVERYNO);
                            $("#LOT").val(de.LOT);           
                                      
                        }    
                    });                    
                }
                var table1;
                function getdata1(mrno){
                    table = $("#mytable1").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G3&mrno='+mrno,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                        columnDefs: [
                            { "width": "10rem", "targets": 0 },
                            { "width": "5rem", "targets": 1 },
                            { "width": "5rem", "targets": 2 },
                            { "width": "5rem", "targets": 3 },
                            { "width": "5rem", "targets": 4 },
                            { "width": "15rem", "targets": 5 },
                            { "width": "25rem", "targets": 6 },
                          
                        ]   
                                             
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G3&mrno='+mrno,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#count").val(de.count);   
                            
                            $("#PLANT").val(de.PLANT);           
                            $("#PO").val(de.PO);      
                            $("#SUPNAME").val(de.SUPNAME);           
                            $("#INVOICE").val(de.INVOICE);
                            $("#INVOICEDATE").val(de.INVOICEDATE);           
                            $("#DELIVERYNO").val(de.DELIVERYNO);
                            $("#LOT").val(de.LOT);           
                                      
                        }    
                    });                    
                }


                $("#page3").addClass("active");
                $("#btn-send").addClass("disabled");
                getdata("");
                getdata1("");
                
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == ""){
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                       
                    }else{
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#mrno").val(),$("#item").val());  
                       
                    }         
                });
         
                $("#btn-send").click(function(){
                    //$("#btn-send").addClass("disabled");
                    //$("#btn-send").text("กำลังส่ง....");
                   
                    
                   
                    
       
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