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
                                โปรเเกรมเเสดงข้อมูลตามรหัสวัตถุดิบเเละวันที่สร้างรหัส
                            </div>
                            <div class="card-body">
                                <form id="myform" class="" >
                                    <div class="row mb-3">
                                        <div class="col-sm-12 col-md-3">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item" value="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-12 col-md-3">
                                            <label>ตั้งเเต่วันที่ : </label>
                                            <input class="form-control form-control-sm" type="date" name="date1" id="date1" value="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>ถึงวันที่ : </label>
                                            <input class="form-control form-control-sm" type="date" name="date2" id="date2" value="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <button class="btn btn-secondary mt-4 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                        </div>
                                    </div>
                                    
                                </form> 
                                <div class="row mt-4">
                                    <div class="col-sm-12 col-md-12">
                                        
                                        
                                        <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                            <thead >
                                                <tr>
                                                    <th class="text-center">รหัสวัตถุดิบ</th>
                                                    <th class="text-center">เลขที่เอกสาร</th>
                                                    <th class="text-center">จำนวนม้วน</th>
                                                    <th class="text-center">สาขา</th>
                                                    <th class="text-center">เลขที่ PO</th>
                                                    <th class="text-center">วันที่ของ Invoice</th>
                                                    <th class="text-center">เลขที่ใบส่งของ</th>
                                                    <th class="text-center">ผู้จัดซื้อ</th>
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
                function getdata(item,date1,date2){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G8&item='+item+'&date1='+date1+'&date2='+date2,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                       
                        columnDefs: [
                            { "width": "10rem", "targets": 0 },
                            { "width": "10rem", "targets": 1 },
                            { "width": "5rem", "targets": 2 },
                            { "width": "5rem", "targets": 3 },
                            { "width": "5rem", "targets": 4 },
                            { "width": "10rem", "targets": 5 }, 
                            { "width": "10rem", "targets": 6 }, 
                            { "width": "10rem", "targets": 7 }, 
                        ]
                       
                                            
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G8&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#countwmbarcode").text(de.count);   
                            console.log(de.count);
                            if(item != "" && date1 != "" && date2 != ""){
                                if(de.count > 0){
                                    Swal.fire({
                                        icon:"success",
                                        title:"ดึงข้อมูลสำเร็จ",
                                        text:"ดึงข้อมูลสำเร็จ"
                                    });
                                }else if(de.count <= 0){
                                    Swal.fire({
                                        icon:"error",
                                        title:"ไม่พบข้อมูล",
                                        text:"ไม่พบข้อมูล"
                                    });
                                }
                                
                            }
                        }    
                    });                    
                }
               


                $("#page2").addClass("active");
                $("#btn-send").addClass("disabled");
                // getdata("","","");  
                
                
                $("#btn-getdata").click(function(){
                    if($("#item").val() == "" ||$("#date1").val() == "" ||$("#date2").val() == ""  ){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                       
                    }else{
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#item").val(),$("#date1").val(),$("#date2").val());  
                       
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