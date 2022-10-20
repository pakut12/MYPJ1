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
                        <div class="card shadow  h-25" >
                            <div class="card-header text-center">
                                โปรเเกรมคีย์เเละเเก้ไขข้อมูลใบ Invoice
                            </div>
                            <div class="card-body">
                                <form id="myform" class="">
                                    <div class="row ">
                                        <div class="col-sm-12 col-md-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required ></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>                                        
                                        <div class="col-sm-12 col-md-4">
                                            <button class="btn btn-secondary mt-4 mx-1 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i>  ดึงข้อมูล</button>
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-hdd"></i> บันทึก</button>
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col-sm-12 col-md-3">
                                            <label>สาขา : </label>
                                            <input class="form-control form-control-sm text-center "  type="number" name="PLANT" id="PLANT" value="" readonly></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>รหัสใบสั่งซื้อ : </label>
                                            <input class="form-control form-control-sm text-center" type="number" name="PO" id="PO" value="" readonly></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>Sup.Name : </label>
                                            <input class="form-control form-control-sm text-center" type="text" name="SUPNAME" id="SUPNAME" value="" readonly></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>Delivery No : </label>
                                            <input class="form-control form-control-sm text-center" type="number" name="DELIVERYNO" id="DELIVERYNO" value="" readonly></input>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-3">
                                            <label>Invoice : </label>
                                            <input class="form-control form-control-sm text-center" type="text" name="INVOICE" id="INVOICE" value="" required></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>Invoice date : </label>
                                            <input class="form-control form-control-sm text-center" type="date" name="INVOICEDATE" id="INVOICEDATE" value="" required></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>เลขที่ Lot : </label>
                                            <input class="form-control form-control-sm text-center" type="number" name="LOT" id="LOT" value="" required></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>จำนวนทั้งหมด : </label>
                                            <input class="form-control form-control-sm text-center" type="number" name="count" id="count" value="" readonly></input>
                                        </div>
                                        
                                    </div>
                                    
                                </form> 
                                <div class="row mt-3">
                                    <table class="table table-sm table-bordered  text-center w-100" id="mytable"  >
                                        <thead >
                                            <tr>
                                                <th class="text-center">ลำดับ</th>
                                                <th class="text-center">รหัสวัตดุดิบ</th>
                                                <th class="text-center">ม้วน</th> 
                                                <th class="text-center">จำนวน</th>
                                                <th class="text-center">หน่วยนับ</th>
                                                <th class="text-center">พาเลท</th>
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
        
        <script>   
          
          
            $(document).ready(function () {
               
                var table;
                function getdata(mrno){
                    $.fn.dataTable.ext.order['dom-text'] = function(settings, col) {
                        return this.api().column(col, {
                            order: 'index'
                        }).nodes().map(function(td, i) {
                            return $('input', td).val();
                        });
                    };
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G3&mrno='+mrno,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                        columnDefs: [
                            { 
                               
                                targets: 0 ,
                                orderDataType: "dom-text",
                                type: 'num',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                            { 
                                width: "15rem", 
                                targets: 1 ,
                                orderDataType: "dom-text",
                                type: 'num',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                            {
                                width: "5rem",
                                targets: 2,
                                orderDataType: "dom-text",
                                type: 'num',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                } 
                            },
                            { 
                                width: "5rem", 
                                targets: 3 ,
                                orderDataType: "dom-text",
                                type: 'string',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                            { 
                                width: "5rem", 
                                targets: 4 ,
                                orderDataType: "dom-text",
                                type: 'string',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                            { 
                                width: "5rem", 
                                targets: 5 ,
                                orderDataType: "dom-text",
                                type: 'string',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                            { 
                                width: "5rem", 
                                targets: 6 ,
                                orderDataType: "dom-text",
                                type: 'string',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                            { 
                                width: "5rem", 
                                targets: 7,
                                orderDataType: "dom-text",
                                type: 'string',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                            { 
                                width: "25rem", 
                                targets: 8,
                                orderDataType: "dom-text",
                                type: 'string',
                                render: function(data, type, row, meta) {
                                    if (type === 'filter') {
                                        return $(data).val();
                                    }
                                    return data;
                                }
                            },
                          
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
                            // console.log(de);       
                            if(mrno != ""){
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
                
                
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == ""){
                        $("#mrno").addClass("is-invalid");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                    }else{
                        $("#mrno").removeClass("is-invalid");
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#mrno").val(),$("#item").val());  
                       
                    }         
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
                            $("#btn-send").addClass("disabled");
                            $("#btn-send").text("กำลังบันทึก....");
                            var ITEM = table.$('#txt0').serializeArray();
                            var ROLL = table.$('#txt1').serializeArray();
                            var QUANTITY = table.$('#txt2').serializeArray();
                            var UNIT = table.$('#txt3').serializeArray();
                            var COLOR = table.$('#txt4').serializeArray();
                            var BATCH = table.$('#txt5').serializeArray();
                            var DESC1 = table.$('#txt6').serializeArray();
                            var INVOICE = $("#INVOICE").val();
                            var INVOICEDATE = $("#INVOICEDATE").val();
                            var LOT = $("#LOT").val();
                            var MRNO = $("#mrno").val();  
                            var ITEM1 = table.$('#txt7').serializeArray();
                            var ROLL1 = table.$('#txt8').serializeArray();
                            var PALET = table.$('#txt9').serializeArray();
                  
                  
                            var arrITEM = new Array();
                            var arrROLL = new Array();
                            var arrQUANTITY = new Array();
                            var arrUNIT = new Array();
                            var arrCOLOR = new Array();
                            var arrBATCH = new Array();
                            var arrDESC1 = new Array();
                            var arrITEM1 = new Array();
                            var arrROLL1 = new Array();
                            var arrPALET = new Array();
                    
                            $.each(ITEM,function(k,v){
                                arrITEM.push(ITEM[k].value.toUpperCase());
                                arrROLL.push(ROLL[k].value);
                                arrQUANTITY.push(QUANTITY[k].value);
                                arrUNIT.push(UNIT[k].value);
                                arrCOLOR.push(COLOR[k].value);
                                arrBATCH.push(BATCH[k].value);
                                arrDESC1.push(DESC1[k].value);
                                arrITEM1.push(ITEM1[k].value);
                                arrROLL1.push(ROLL1[k].value);
                                arrPALET.push(PALET[k].value);
                            });
                  
                            var url = "edititem?status=G2";
                            $.ajax({
                                type: "POST",
                                url: url,
                                data: {
                                    arrITEM:arrITEM,
                                    arrROLL:arrROLL,
                                    arrQUANTITY:arrQUANTITY,
                                    arrUNIT:arrUNIT,
                                    arrCOLOR:arrCOLOR,
                                    arrBATCH:arrBATCH,
                                    arrDESC1:arrDESC1,
                                    arrITEM1:arrITEM1,
                                    arrROLL1:arrROLL1,
                                    arrPALET:arrPALET,
                                    INVOICE:INVOICE,
                                    INVOICEDATE:INVOICEDATE,
                                    LOT:LOT,
                                    MRNO:MRNO
                                },
             
                                success: function(msg,status){ 
                                    console.log(msg);
                                    if(msg == "false"){ 
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'ไม่สำเร็จ',
                                            text: 'บันทึกข้อมูลไม่สำเร็จ'
                                        })
                                        $("#btn-send").removeClass("disabled");
                                        $("#btn-send").text("บันทึก");
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
        
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>