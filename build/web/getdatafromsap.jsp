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
           
                <div class="col-sm-12 col-md-12">
                    <div id="pageview">
                        <div class="card shadow ">
                            <div class="card-header text-center">
                                ดึงข้อมูลจาก SAP ด้วยเลขที่ PO
                            </div>
                            <div class="card-body">
                                <form class="" id="myform">
                                    <div class="row mb-3">
                                        
                                        <div class="col-sm-12 col-md-3">
                                            <label>Purchase Order : </label>
                                            <input class="form-control form-control-sm" type="number" name="PO" id="PO" required></input>
                                            <div class="invalid-feedback  text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="DOCQC" id="DOCQC" required></input>
                                            <div class="invalid-feedback text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-5 text-center">
                                            <button class="btn btn-secondary mt-4 btn-sm mx-1" type="button" name="getdata_sap" id="getdata_sap"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                            <button class="btn btn-success mt-4 btn-sm mx-1" type="button" name="savedata_sap" id="savedata_sap"><i class="bi bi-hdd"></i> จัดเก็บข้อมูล</button>
                                            <button class="btn btn-danger mt-4 btn-sm mx-1" type="button" name="claerdata_sap" id="claerdata_sap"><i class="bi bi-arrow-clockwise"></i> เคลียร์ข้อมูล</button>
                                        </div>  
                                        
                                    </div>
                                </form> 
                                <div class="col-auto">
                                    <table class="table table-sm table-bordered text-center" id="mytable" >
                                        <thead>
                                            <tr> 
                                                
                                                <th class="text-center">ลำดับ </th>
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
                        select: true,
                        scrollY: true,    
                        scrollX: true,
                        select: true,
                        columnDefs: [
                            { "width": "10rem", "targets": 1 },
                            { "width": "10rem", "targets": 2 },
                            { "width": "23rem", "targets": 6 },
                            { "width": "23rem", "targets": 7 }, 
                            { "width": "23rem", "targets": 8 },
                            { "width": "23rem", "targets": 15 }, 
                            { "width": "10rem", "targets": 19 }, 
                        ]
                        
                    });  
                }
               
                
                getdatasap("", "");
                $("#savedata_sap").addClass("disabled");
              
                
                $("#getdata_sap").click(function(){
                    var getpo =  $("#PO").val();
                    var getdocqc = $("#DOCQC").val();
                    
                    if(getpo == "" || getdocqc == ""){
                        $("#myform").addClass("was-validated");
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
                $("#savedata_sap").click(function(){
                    var getpo =  $("#PO").val();
                    var getdocqc = $("#DOCQC").val();
                    $("#savedata_sap").text("กำลังบันทึก...");
                    $("#savedata_sap").addClass("disabled");
                    $.ajax({
                        type: "POST",
                        url: 'sap?stasus=S&PO='+getpo+'&DOCQC='+getdocqc,
                        success: function(msg){
                            console.log(msg);
                            if(msg == "false"){ 
                                Swal.fire({
                                    icon: 'error',
                                    title: 'ไม่สำเร็จ',
                                    text: 'บันทึกข้อมูลไม่สำเร็จ'
                                })
                                $("#savedata_sap").text("จัดเก็บข้อมูล");
                                $("#savedata_sap").removeClass("disabled");
                                $("#savedata_sap").addClass("disabled");
                            }else if(msg == "true"){
                                Swal.fire({
                                    icon: 'success',
                                    title: 'สำเร็จ',
                                    text: 'บันทึกข้อมูลสำเร็จ'
                                })
                                $("#savedata_sap").text("จัดเก็บข้อมูล");
                                $("#savedata_sap").removeClass("disabled");
                            }
                        },
                        error:function(msg){
                            Swal.fire({
                                icon: 'error',
                                title: 'ไม่สำเร็จ',
                                text: 'บันทึกข้อมูลไม่สำเร็จ'
                            })
                            $("#savedata_sap").text("จัดเก็บข้อมูล");
                            $("#savedata_sap").removeClass("disabled");
                            $("#savedata_sap").addClass("disabled");
                        }
                        
                    });
        
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
