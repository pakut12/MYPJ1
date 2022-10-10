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
                        <div class="card shadow h-25 ">
                            <div class="card-header text-center">
                                คีย์ข้อมูลใบเเจ้งเข้าวัตถุดิบ
                            </div>
                            <div class="card-body">
                                <form id="myform" class="">
                                    <div class="row mb-3">
                                        <div class="col-sm-12 col-md-3">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>จำนวนเเถวทั้งหมด : </label>
                                            <input class="form-control form-control-sm" type="number" name="count" id="count" readonly></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <button class="btn btn-secondary mt-4 mx-1 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-hdd"></i> บันทึก</button>
                                        </div>
                                    </div>
                                </form> 
                                
                                <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                    <thead>
                                        <tr>
                                            <th class="text-center">ลำดับ</th>
                                            <th class="text-center">Pallet</th>
                                            <th class="text-center">ความยาว(เมตร)</th>
                                            <th class="text-center">Batch No</th>
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
        
        <script>
            
            $(document).ready(function () {
                var table;
                function getdata(mrno,item){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G2&mrno='+mrno+'&item='+item,
                        responsive: false,
                        scrollY: true                   
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G2&mrno='+mrno+'&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#count").val(de.count);
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
                getdata("","");
                
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == "" ||$("#item").val() == "" ){
                        $("#myform").addClass("was-validated");
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
                    //$("#btn-send").text("กำลังบันทึก....");
                    var mrno = $('#mrno').val();
                    var item = $('#item').val();
                    var ROLL = table.$('#txt0').serializeArray();
                    var PALET = table.$('#txt1').serializeArray();
                    var QUANTITY = table.$('#txt2').serializeArray();
                    var BATCH = table.$('#txt3').serializeArray();
                    
                    var arrROLL = new Array();
                    var arrPALET = new Array();
                    var arrQUANTITY = new Array();
                    var arrBATCH = new Array();
                    
                    $.each(ROLL,function(k,v){
                        arrROLL.push(ROLL[k].value);
                        arrPALET.push(PALET[k].value);
                        arrQUANTITY.push(QUANTITY[k].value);
                        arrBATCH.push(BATCH[k].value);
                    });
                   
                    $.ajax({
                        type: "POST",
                        url: "edititem?status=G1",
                        data:{
                            arrROLL:arrROLL,
                            arrPALET:arrPALET,
                            arrQUANTITY:arrQUANTITY,
                            arrBATCH:arrBATCH,
                            mrno:mrno,
                            item:item  
                        },
                        success: function(msg,status){
                            if(msg == "false"){ 
                                Swal.fire({
                                    icon: 'error',
                                    title: 'ไม่สำเร็จ',
                                    text: 'บันทึกข้อมูลไม่สำเร็จ'
                                })
                                $("#btn-send").removeClass("disabled");
                                $("#btn-send").addClass("disabled");
                                $("#btn-send").text("กำลังบันทึก");
                            }else if(msg == "true"){
                                Swal.fire({
                                    icon: 'success',
                                    title: 'สำเร็จ',
                                    text: 'บันทึกข้อมูลสำเร็จ'
                                })
                                $("#btn-send").removeClass("disabled");
                                $("#btn-send").text("บันทึก");
                            } 
                                        
                        }    
                    });
                           
                        
                   
                    //getdata($("#mrno").val(),$("#item").val());   
                   
                                    
                    
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