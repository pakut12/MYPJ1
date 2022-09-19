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
                                โปรเเกรมเเสดงข้อมูลตามเลขที่เอกสาร
                            </div>
                            <div class="card-body">
                                <form id="myform" class="" >
                                    <div class="row mb-3">
                                        <div class="col-sm-12 col-md-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" value="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-12 col-md-4">
                                            <button class="btn btn-secondary mt-4 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                            
                                        </div>
                                        <div class="col-sm-12 col-md-4 mt-3">
                                            <label class="h4">จำนวนทั้งหมด : <label id="countwmbarcode"></label> </label>
                                            
                                        </div>
                                    </div>
                                    
                                </form> 
                                <div class="row mt-4">
                                    <div class="col-12">
                                        
                                        
                                        <table class="table table-sm table-bordered  text-center w-100" id="mytable"  >
                                            <thead >
                                                <tr>
                                                    <th class="text-center">รหัสวัตถุดิบ</th>
                                                    <th class="text-center">รายละเอียด</th>
                                                    <th class="text-center">จำนวนเข้า</th>
                                                    <th class="text-center">หน่วยนับ</th>
                                                    <th class="text-center">ม้วนที่</th>
                                                    <th class="text-center">เลขที่ Invoice</th>
                                                    <th class="text-center">สี</th>
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
                function getdata(mrno,item){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G6&mrno='+mrno,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                       
                        columnDefs: [
                            { "width": "10rem", "targets": 0 },
                            { "width": "20rem", "targets": 1 },
                            { "width": "5rem", "targets": 2 },
                            { "width": "5rem", "targets": 3 },
                            { "width": "5rem", "targets": 4 },
                            { "width": "10rem", "targets": 5 }, 
                            { "width": "5rem", "targets": 6 }, 
                        ]
                       
                                            
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G6&mrno='+mrno,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#countwmbarcode").text(de.count);   
                            console.log(de.count);
                            if(mrno != "" && item != ""){
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
                getdata($("#mrno").val(),$("#item").val());  
                
                
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == ""){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                       
                    }else{
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#mrno").val(),$("#item").val());  
                        getdata1($("#mrno").val(),$("#item").val());  
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
  
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>