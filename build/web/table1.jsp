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
                                ส่งข้อมูลให้ทาง QC
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
                                        <div class="col-6">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button">ส่งข้อมูลไป QC</button>
                                        </div>
                                    </div>
                                </form> 
                                <table class="table table-sm table-bordered text-center" id="mytable" >
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
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
        
        <script>
            
            $(document).ready(function () {
                var table;
                function getdata(re){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?mrno='+re,
                        responsive: true,
                        columnDefs: [{      
                                target:1,
                                checkboxes:{
                                    selectRow:true
                                }
                            } ],
                        'select': {
                            'style': 'multi'
                        }
                    });  
                }
                
                $("#page2").addClass("active");
              
                getdata("");
               
                $("#mrno").change(function(){
                    getdata($(this).val());
                   
                });
                $("#mrno").keypress(function(){
                    getdata($(this).val());
                   
                });
                
                
                $("#btn-send").click(function(){
                    var select_row = table.column(1).checkboxes.selected();
                    
                    $.each(select_row,function(k,v){
                        console.log(v);
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
