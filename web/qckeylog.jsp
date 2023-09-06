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
    <style>
        
    </style>
    <body>
        
        <%@include file="share/nav.jsp" %>
        <form id="myform" >
            <div class="container ">
                <div class="row">
                    
                    <div class="col-sm-12 col-md-12">
                        <div id="pageview">
                            <div class="card shadow ">
                                <div class="card-header text-center">
                                    โปรเเกรมคีย์สรุปผลการตรวจสอบผ้าถัก
                                </div>
                                <div class="card-body">
                                    <div class="row ">
                                        <div class="col-sm-12 col-md-3">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" value="" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <button class="btn btn-secondary mt-4 btn-sm " id="getpalet" type="button"><i class="bi bi-download"></i> ดึงเลขที่พาเลต</button>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <label>พาเลท : </label>
                                            <select class="form-select form-select-sm" id="pallet" name="pallet">
                                                
                                            </select>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item" value="" readonly></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <label>จำนวนม้วนผ้า : </label>
                                            <input class="form-control form-control-sm" type="text" name="count" id="count" value="" readonly></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <label>รายงานละเอียดวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="desc1" id="desc1" value="" readonly></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-12 col-md-6">
                                            <button class="btn btn-secondary mt-4 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                            <a href="qckeylog.jsp"><button class="btn btn-danger mt-4 btn-sm" id="btn-reset" type="button"><i class="bi bi-arrow-clockwise"></i> เคลียร์ข้อมูล</button></a>
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-hdd"></i> บันทึกข้อมูล</button>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-sm-12 col-md-12">
                                            
                                            
                                            <table class="table table-sm table-bordered  text-center w-100" id="mytable"  >
                                                <thead >
                                                    <tr>
                                                        <th class="text-center p-0">ม้วนที่</th>
                                                        <th class="text-center p-0">หน้าผ้าที่วัดได้</th>
                                                        <th class="text-center p-0">จำนวนที่มา</th>
                                                        <th class="text-center p-0">จำนวนที่ได้</th>
                                                        <th class="text-center p-0">จุดสี-น้ำมัน-สกปรก</th>
                                                        <th class="text-center p-0">ลายขวาง</th>
                                                        <th class="text-center p-0">รอยยับ</th>
                                                        <th class="text-center p-0">ปุ่มปม</th>
                                                        <th class="text-center p-0">เส้นด้ายขาด</th>
                                                        <th class="text-center p-0">รอยต่าง</th>
                                                        <th class="text-center p-0">เส้นแนวตั้ง</th>
                                                        <th class="text-center p-0">อื่นๆ</th>
                                                        <th class="text-center p-0">คะเเนน</th>
                                                        <th class="text-center p-0">% คะเเนน</th>
                                                        <th class="text-center p-0">บาร์โค๊ด</th>
                                                        <th class="text-center p-0">บาร์โค๊ดร้านค้า</th>
                                                        <th class="text-center p-0">Mark</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                </tbody>
                                                
                                            </table> 
                                            
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row mt-3">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    คีย์สรุปผลการตรวจสอบ
                                                </div>
                                                <div class="card-body">
                                                    <label> Remack1 : </label>
                                                    <input class="form-control form-control-sm " type="text" name="remark1" id="remark1" value="" ></input>
                                                    <label> Remack2  : </label>
                                                    <input class="form-control form-control-sm " type="text" name="remark2" id="remark2" value="" ></input>
                                                    <label> Remack3 : </label>
                                                    <input class="form-control form-control-sm " type="text" name="remark3" id="remark3" value="" ></input>
                                                </div>
                                            </div> 
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    ระบุข้อมูลเพื่อคำนวน % การสูญเสีย
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-sm-12 col-md-6">
                                                            <label>จำนวนที่มารวม : </label>
                                                            <input class="form-control form-control-sm" type="text" name="sumq" id="sumq" value="" readonly></input>
                                                            <div class="invalid-feedback mb-3 text-center">
                                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12 col-md-6">
                                                            <label>จำนวนที่ได้รวม : </label>
                                                            <input class="form-control form-control-sm" type="text" name="suma" id="suma" value="" readonly></input>
                                                            <div class="invalid-feedback mb-3 text-center">
                                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-12 col-md-6">
                                                            <label>จำนวนม้วนที่ * : </label>
                                                            <input class="form-control form-control-sm" type="text" name="countstar" id="countstar" value="" readonly></input>
                                                            <div class="invalid-feedback mb-3 text-center">
                                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12 col-md-6">
                                                            <label>จำนวนรวม * : </label>
                                                            <input class="form-control form-control-sm" type="text" name="sumstar" id="sumstar" value="" readonly></input>
                                                            <div class="invalid-feedback mb-3 text-center">
                                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-12 col-md-6">
                                                            <label> % การสูญเสีย : </label>
                                                            <input class="form-control form-control-sm" type="text" name="gradeqc" id="gradeqc" value="" readonly></input>
                                                            <div class="invalid-feedback mb-3 text-center">
                                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%@ include file="share/footer.jsp" %>
        <script>
            
            $(document).ready(function () {
                function getpalet(mrno){
                    $("#pallet").empty();
                    $("#btn-getdata").removeClass("disabled");
                    
                    var url = "getdatawm?status=G19";
                    var data = '&mrno='+mrno;
                    $.ajax({
                        type: "POST",
                        url: url,
                        data:data,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            if(de.status == "true"){
                                Swal.fire({
                                    icon:"success",                    
                                    title:"ดึงเลขที่พาเลตสำเร็จ",
                                    text:"ดึงเลขที่พาเลตสำเร็จ" 
                                });
                                $.each(de.palet,function(k,v){
                                    $("#pallet").append( "<option value='"+v+"'>"+v+"</option>" ); 
                                });
                            }else if(de.status == "false"){
                                Swal.fire({
                                    icon:"error",                    
                                    title:"ดึงเลขที่พาเลตไม่สำเร็จ",
                                    text:"ดึงเลขที่พาเลตไม่สำเร็จ" 
                                });
                            }
                                  
                        }    
                    });
                     
                }
                $("#getpalet").click(function(){
                    var mrno = $("#mrno").val();
                    getpalet(mrno);
                })
                var table;
                function getdata(mrno,pallet){
                    $("#suma").val(0);
                    $("#countstar").val(0);          
                    $("#sumq").val(0);
                    $("#gradeqc").val(0);
                    $("#sumstar").val(0);
                    
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G12&mrno='+mrno+'&pallet='+pallet,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                        columnDefs: [
                            { "width": "7rem", "targets":14 },
                           
                        ],
                        select: true
                                             
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G12&mrno='+mrno+'&pallet='+pallet,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            if(mrno != "" &&  pallet != ""){
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
                            $("#count").val(de.count);   
                            $("#item").val(de.item); 
                            $("#desc1").val(de.desc1); 
                            $("#suma").val(de.suma);
                            $("#countstar").val(de.countstar);          
                            $("#sumq").val(de.sumq);
                            $("#gradeqc").val(de.gradeqc.toFixed(2));
                            $("#sumstar").val(de.sumstar);
                            
                        }    
                    });  
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G14&mrno='+mrno+'&pallet='+pallet,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            console.log(de);
                            $("#remark1").val(de.remark1);
                            $("#remark2").val(de.remark2);
                            $("#remark3").val(de.remark3);
                            
                        }    
                    });                    
                }
               
                $("#page3").addClass("active");
                $("#btn-send").addClass("disabled");
                getdata("","");  
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == "" || $("#pallet").val() == ""){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                    }else{
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#mrno").val(),$("#pallet").val());  
                       
                    }         
                });
                $('body').on('click','td', function() {
                    var table = $("#mytable").DataTable();
                    var data = table.rows('.selected').data();
                    var url = 'getdatawm?status=G13&mrno='+$("#mrno").val()+'&item='+$("#item").val()+'&roll='+data[0][0];
                
                    $.ajax({
                        type: "POST",
                        url: url,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#remark1").val(de.remark1);
                            $("#remark2").val(de.remark2);
                            $("#remark3").val(de.remark3);
                        }    
                    });       
                });
                $("#btn-send").click(function(){
                    Swal.fire({
                        title: 'คุณต้องการบันทึกหรือไม่',
                        text: "คุณต้องการบันทึกหรือไม่",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'OK'
                    }).then(function(result){
                        if (result.isConfirmed) {
                            var mrno = $("#mrno").val();
                            var pallet = $("#pallet").val();
                   
                            var remark1 = $("#remark1").val();
                            var remark2 = $("#remark2").val();
                            var remark3 = $("#remark3").val();
                            var gradeqc = $("#gradeqc").val();
                            var mrno = $("#mrno").val();
                            var item = $("#item").val();
                    
                            if(mrno == "" || pallet == ""){
                                Swal.fire({
                                    icon: 'error',
                                    title: 'ข้อมูลไม่ถูกต้อง',
                                    text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                                })
                            }else{
                       
                       
                                $.ajax({
                                    type: "POST",
                                    url: 'getdatawm?status=G12&mrno='+mrno+'&pallet='+pallet,
                                    success: function(msg,status){
                                        var de = $.parseJSON(msg);
                                        var url = 'edititem?status=G4';
                                        $.ajax({
                                            type: "POST",
                                            url: url,
                                            data:{
                                                remark1:remark1,
                                                remark2:remark2,
                                                remark3:remark3,
                                                mrno:mrno,
                                                item:item,
                                                roll:de.arrroll,
                                                gradeqc:gradeqc            
                                            },
                                            success: function(msg,status){
                                                if(msg == 'true'){
                                                    Swal.fire({
                                                        icon: 'success',
                                                        title: 'บันทึกข้อมูลสำเร็จ',
                                                        text: 'บันทึกข้อมูลสำเร็จ'
                                                    }) 
                                                }else if(msg == 'false'){
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'บันทึกข้อมูลไม่สำเร็จ',
                                                        text: 'บันทึกข้อมูลไม่สำเร็จ'
                                                    })
                                                }
                                            }    
                                        });   
                              
                                    }
                                });   
                            }
                  
                        }
                    });
                   
       
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
        
        
        
    </body>
</html>