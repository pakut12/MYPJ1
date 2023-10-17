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
                                    <div class="row ">
                                        
                                        <div class="col-sm-12 col-md-3">
                                            <label>Purchase Order : </label>
                                            <input class="form-control form-control-sm" type="number" name="PO" id="PO" required></input>
                                            <div class="invalid-feedback  text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="DOCQC" id="DOCQC" required></input>
                                            <div class="invalid-feedback text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <label>หน้าผ้าที่ซื้อ (นิ้ว): </label>
                                            <input class="form-control form-control-sm" type="number" name="CLOTHBUY" id="CLOTHBUY" required></input>
                                            <div class="invalid-feedback text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <label>CM: </label>
                                            <input class="form-control form-control-sm" type="number" name="CM" id="CM" disabled></input>
                                            <div class="invalid-feedback text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <label>CM<sup>2</sup> : </label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="CM2" id="CM2" value="9144" required checked >
                                                <label class="form-check-label" for="CM2">
                                                    CM<sup>2</sup> หลา 9,144
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="CM2" id="CM2" value="10000" required>
                                                <label class="form-check-label" for="CM2">
                                                    CM<sup>2</sup> เมตร 10,000
                                                </label>
                                            </div>
                                            <div class="invalid-feedback text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-12 col-md-12 text-end ">
                                            <button class="btn btn-secondary mt-4 btn-sm mx-1" type="button" name="getdata_sap" id="getdata_sap"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                            <button class="btn btn-success mt-4 btn-sm mx-1" type="button" name="savedata_sap" id="savedata_sap"><i class="bi bi-hdd"></i> จัดเก็บข้อมูล</button>
                                            <button class="btn btn-danger mt-4 btn-sm mx-1" type="button" name="claerdata_sap" id="claerdata_sap"><i class="bi bi-arrow-clockwise"></i> เคลียร์ข้อมูล</button>
                                        </div>  
                                    </div>
                                </form> 
                                <div class="col-auto">
                                    <table class="table table-sm table-bordered text-center text-nowrap" id="mytable" >
                                        <thead>
                                            <tr> 
                                                <th class="text-center">ลำดับ </th>
                                                <th class="text-center">MRNO </th>
                                                <th class="text-center">ITEM </th>
                                                <th class="text-center">ROLL </th>
                                                <th class="text-center">QTY </th>
                                                <th class="text-center">UNIT </th>
                                                <th class="text-center">PALET </th>
                                                <th class="text-center">PLANT </th>
                                                <th class="text-center">หน้าผ้าที่ซื้อ (CM)</th>
                                                <th class="text-center">CM<sup>2</sup> </th>
                                                <th class="text-center">INV </th>
                                                <th class="text-center">INV.DATE </th>
                                                <th class="text-center">BARCODE </th>
                                                <th class="text-center">BATCH </th>
                                                <th class="text-center">COLOR </th>
                                                <th class="text-center">GRADE </th>
                                                <th class="text-center">DESC1 </th>
                                                <th class="text-center">DESC2 </th>
                                                <th class="text-center">DESC3 </th>
                                                <th class="text-center">PO</th>
                                                <th class="text-center">POLN </th>
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
                
                $("#CLOTHBUY").on("input",function(){
                    var clothbuy = $("#CLOTHBUY").val();
                    var cm = 2.54 ;
                    var cm2 = clothbuy * 2.54
                    $("#CM").val(cm2.toFixed(2))
                })
        
        
                $("#page2").addClass("active");
               
                function getdatasap(po,docqc){
                    $.fn.dataTable.ext.errMode = 'none';
                    var url = 'sap?stasus=G&PO='+po+'&DOCQC='+docqc;
                    $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: {
                            type:"post",
                            url:url,
                            dataSrc:function(json){
                            
                                var arr = [];
                                var cm = $("#CM").val()
                                var cm2 = $('input[name="CM2"]:checked').val();
                          
                                $.each(json.data,function(k,v){
                                   
                               
                                    var result = {
                                        NO:v[0],
                                        MRNO:v[1],
                                        ITEM:v[2],
                                        ROLL:v[3],
                                        QTY:v[4],
                                        UNIT:v[5],
                                        PALET:v[6],
                                        PLANT:v[7],
                                        PO:v[8],
                                        POLN:v[9],
                                        INV:v[10],
                                        INVDATE:v[11],
                                        BARCODE:v[12],
                                        BATCH:v[13],
                                        COLOR:v[14],
                                        GRADE:v[15],
                                        DESC1:v[16],
                                        DESC2:v[17],
                                        DESC3:v[18],
                                        CM:cm,
                                        CM2:cm2
                                   
                                    }
                                
                                    arr.push(result);
                             
                                })
                            
                                return arr
                            }
                        },
                        select: true,
                        scrollY: true,    
                        scrollX: true,
                        columns: [
                            {
                                title : 'ลำดับ',
                                data : 'NO'
                            },
                            {
                                title:'MRNO',
                                data : 'MRNO' 
                            },
                            {
                                title:'ITEM',
                                data : 'ITEM' 
                            },
                       
                            {
                                title:'ROLL',
                                data : 'ROLL' 
                            },
                            {
                                title:'QTY',
                                data : 'QTY' 
                            },
                            {
                                title:'UNIT',
                                data : 'UNIT' 
                            },
                            {
                                title:'PALET',
                                data : 'PALET' 
                            },
                            {
                                title:'PLANT',
                                data : 'PLANT' 
                            },
                            {
                                title:'หน้าผ้าที่ซื้อ (CM)',
                                data : 'CM' 
                            },
                            {
                                title:'CM2',
                                data : 'CM2' 
                            },
                            
                            {
                                title:'INV',
                                data : 'INV' 
                            },
                            {
                                title:'INVDATE',
                                data : 'INVDATE' 
                            }, 
                            {
                                title:'BARCODE',
                                data : 'BARCODE' 
                            }, 
                            {
                                title:'BATCH',
                                data : 'BATCH' 
                            }, 
                            {
                                title:'COLOR',
                                data : 'COLOR' 
                            }, 
                            {
                                title:'GRADE',
                                data : 'GRADE' 
                            },
                            {
                                title:'DESC1',
                                data : 'DESC1' 
                            },
                            {
                                title:'DESC2',
                                data : 'DESC2' 
                            },
                            {
                                title:'DESC3',
                                data : 'DESC3' 
                            }, 
                            {
                                title:'PO',
                                data : 'PO' 
                            },
                            {
                                title:'POLN',
                                data : 'POLN' 
                            },                            
                        
                        ]
                       
                        
                    }); 
                    $.ajax({
                        type:"post",
                        url:url,
                        success:function(msg,status){
                            var de = $.parseJSON(msg);
                            console.log(de.status);
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
                    });
                }
               
                
                getdatasap("", "");
                $("#savedata_sap").addClass("disabled");
              
                
                $("#getdata_sap").click(function(){
                    var getpo =  $("#PO").val();
                    var getdocqc = $("#DOCQC").val();
                    var CLOTHBUY = $("#CLOTHBUY").val();
                    var CM2 = $('input[name="CM2"]').is(':checked');
                    
                    console.log(CM2)
                    if(!getpo || !getdocqc || !CLOTHBUY  || !CM2){
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
                            var getpo =  $("#PO").val();
                            var getdocqc = $("#DOCQC").val();
                            var cm = $("#CM").val()
                            var cm2 = $('input[name="CM2"]:checked').val();
                            
                            $("#savedata_sap").text("กำลังบันทึก...");
                            $("#savedata_sap").addClass("disabled");
                            
         
                            $.ajax({
                                type: "POST",
                                url: 'sap',
                                data:{
                                    stasus:"S",
                                    PO:getpo,
                                    DOCQC:getdocqc,
                                    CM:cm,
                                    CM2:cm2
                                },
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
                        }
                    });
                    
        
                });
    
    
                $("#claerdata_sap").click(function(){
                    location.reload()
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
