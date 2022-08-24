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
                                คีย์ข้อมูลใบเเจ้งเข้าวัตถุดิบ
                            </div>
                            <div class="card-body">
                                
                                <%
            /*
            try {
            String name[] = request.getParameterValues("chkItem");
            if (name == null) {
            out.print("");
            } else {
            for (String x : name) {
            out.print(x);
            }
            }
            
            } catch (Exception e) {
            e.printStackTrace();
            }
             */

                                %>
                                
                                <form action="" method="post" name="myform" class="needs-validation" novalidate>
                                    <div class="row mb-3">
                                        <div class="col-3">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label>จำนวนเเถวทั้งหมด : </label>
                                            <input class="form-control form-control-sm" type="number" name="count" id="count" readonly></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-getdata" type="button">ดึงข้อมูล</button>
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button">Test</button>
                                        </div>
                                    </div>
                                </form> 
                                
                                <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                    <thead >
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
                                                     
                        }    
                    });                    
                }
                


                $("#page2").addClass("active");
                //$("#btn-send").addClass("disabled");
                getdata("902208002776","90BKL0174-DG65");
                
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
                    var mrno = $('#mrno').val();
                    var item = $('#item').val();
                    var ROLL = table.$('#txt0').serializeArray();
                    var PALET = table.$('#txt1').serializeArray();
                    var QUANTITY = table.$('#txt2').serializeArray();
                    var BATCH = table.$('#txt3').serializeArray();
                    $.each(ROLL,function(k,v){
                        console.log("edititem?status=UP&mrno="+mrno+"&item="+item+"&ROLL="+ROLL[k].value+"&PALET="+PALET[k].value+"&QUANTITY="+QUANTITY[k].value+"&BATCH="+BATCH[k].value);
                        
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
        <br><br><br><br><br>
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>