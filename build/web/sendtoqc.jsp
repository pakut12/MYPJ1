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
                                ส่งข้อมูลให้ทาง QC
                            </div>
                            <div class="card-body">  
                                <form id="myform" class="">
                                    <div class="row mb-3">
                                        <div class="col-sm-12 col-md-6">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <button class="btn btn-secondary mt-4 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                            <button class="btn btn-success mt-4 btn-sm mx-1" id="btn-send" type="button"><i class="bi bi-box-arrow-in-right"></i> ส่งข้อมูลไป QC</button>
                                        </div>
                                    </div>
                                </form> 
                                <table class="table table-sm table-bordered text-center " id="mytable" >
                                    <thead>
                                        <tr>
                                            <th></th>
                                            
                                            <th class="text-center">MRNO </th>
                                            <th class="text-center">ITEM </th>
                                            <th class="text-center">ROLL </th>
                                            <th class="text-center">QTY </th>
                                            <th class="text-center">UNIT </th>
                                            <th class="text-center">PALET </th>
                                            <th class="text-center">PLANT </th>
                                            <th class="text-center">PO</th>
                                            <th class="text-center">POLN </th>
                                            <th class="text-center">INV </th>
                                            <th class="text-center">INV.DATE </th>
                                            <th class="text-center">DESC1 </th>
                                            <th class="text-center">DESC2 </th>
                                            <th class="text-center">DESC3 </th>
                                            <th class="text-center">BARCODE </th>
                                            <th class="text-center">BATCH </th>
                                            <th class="text-center">COLOR </th>
                                            <th class="text-center">GRADE </th>
                                            
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
                function getdata(re){
                    var url = 'getdatawm?status=G1&mrno='+re;
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: url,
                        responsive: false,
                        scrollX: true,
                        scrollY: true,
                        columnDefs: [{      
                                target:0,
                                checkboxes:{
                                    selectRow:true
                                }
                            },
                            { "width": "10rem", "targets":2 },
                            { "width": "10rem", "targets": 11 },
                            { "width": "23rem", "targets": 12 },
                            { "width": "23rem", "targets": 13 },
                            { "width": "23rem", "targets": 14 },
                            { "width": "10rem", "targets": 16 },
                        ],
                        'select': {
                            'style': 'multi'
                        }
                    });  
                    
                    $.ajax({
                        type:"post",
                        url:url,
                        success:function(msg,status){
                            if(re != ""){
                                var de = $.parseJSON(msg);
                                if(de.status == "true"){
                                    Swal.fire({
                                        icon:"success",
                                        title:"ดึงข้อมูลสำเร็จ",
                                        text:"ดึงข้อมูลสำเร็จ"
                                    });
                                }else if(de.status == "false"){
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
                getdata("");
                
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == "" ){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                       
                    }else{
                        $("#btn-send").removeClass("disabled");
                        getdata($("#mrno").val());  
                    }
                             
                });
         
                $("#btn-send").click(function(){
                    var select_row = table.column(0).checkboxes.selected();
                    var arr = [];
                    var txt1 = null ;
                    if(select_row.length <= 0){
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาเลือกข้อมูลให้ถูกต้อง'
                        })
                    }else{
                        $("#btn-send").addClass("disabled");
                        $("#btn-send").text("กำลังส่ง....");
                        $.each(select_row,function(k,v){
                            if(v !== txt1){
                                arr.push(v);
                            }
                            txt1 = v;
                            //console.log(v);
                        }); 
                     
                        var row = 0;
                        $.each(arr,function(k,v){
                            $.ajax({
                                type: "POST",
                                url: 'sendtoqc?mrno='+v,
                                success: function(msg,status){
                                    if(msg == "false"){ 
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'ไม่สำเร็จ',
                                            text: 'บันทึกข้อมูลไม่สำเร็จ'
                                        })
                                        $("#btn-send").removeClass("disabled");
                                        $("#btn-send").addClass("disabled");
                                        $("#btn-send").text("ส่งข้อมูลไป QC");
                                    }else if(msg == "true"){
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'สำเร็จ',
                                            text: 'บันทึกข้อมูลสำเร็จ'
                                        })
                                        $("#btn-send").removeClass("disabled");
                                        $("#btn-send").text("ส่งข้อมูลไป QC");
                                    }                          
                                }    
                            });
                            
                        }); 
                        

                    }
                    
                   
                                    
                    
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