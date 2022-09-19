<%-- 
    Document   : test
    Created on : 20 ส.ค. 2565, 17:23:49
    Author     : Gus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            font-size:11px;
            height:5.0in;
            width:9in; 
            margin: 15px;          
            
        }
    </style>
    <%!
    public static String ctoD(String txt) {
        String Y = txt.substring(0, 4);
        String M = txt.substring(5, 7);
        String D = txt.substring(8, 10);
        String F = D + "/" + M + "/" + Y;
        return F;
    }
    %>
    
    <body >
        
        <div class="h3 fw-bold">ใบเเจ้งเข้าวัตถุดิบ</div>
        
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Name of Vendor : </label>
                <label><%=request.getAttribute("SUPNAME")%></label> 
            </div>
            
            <div  class="col-4">
                <label class="fw-bold">Documaent No. :</label>
                <label><%=request.getAttribute("MRNO")%></label> 
            </div>
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Po No. : </label>
                <label><%=request.getAttribute("PO")%>  / <%=request.getAttribute("POLN")%></label> 
            </div>
            
            <div  class="col-4 ">
                <label class="fw-bold">Pallet : </label>
                <label><%=request.getAttribute("PALET")%></label> 
            </div> 
        </div>
        <div class="row">
            <div  class="col-4 ">
                <label class="fw-bold">Current Date : </label>
                <label id="today"></label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">วันที่ผ้าเข้า : </label>
                <label class="h3" id="today1"><%=ctoD(request.getAttribute("CREATEDATE").toString())%></label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">Invoice No : </label>
                <label><%=request.getAttribute("INVOICE")%></label> 
            </div> 
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Plant : </label>
                <label><%=request.getAttribute("PLANT")%></label> 
            </div>
            
            <div  class="col-4 ">
                <label class="fw-bold">Invoice date : </label>
                <label><%=ctoD(request.getAttribute("INVOICEDATE").toString())%></label> 
            </div> 
            
            
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold ">Materal : </label>
                <label class="h3"><%=request.getAttribute("ITEM")%></label> 
            </div>
            
            <div  class="col-4 ">
                <label><%=request.getAttribute("DESC1")%></label> 
            </div> 
            
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Lot : </label>
                <label><%=request.getAttribute("LOT")%></label> 
            </div>
            
            <div  class="col-4 ">
                <label class="fw-bold">Quantity : </label>
                <label class="h3"><%=request.getAttribute("roll")%></label> 
                <label><%=request.getAttribute("UNIT")%></label> 
            </div> 
        </div>
        
        <div class="row ">
            <div  class="col-12 ">
                <table class="table table-bordered border-dark text-center w-100">
                    <thead>
                        <tr>
                            <th>เบอร์สี</th>
                            <th>หน้า</th>
                            <th colspan="10">รายการ</th>
                            <th colspan="2">หน่วย</th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>กว้าง</th>
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>5</th>
                            <th>6</th>
                            <th>7</th>
                            <th>8</th>
                            <th>9</th>
                            <th>10</th>
                            <th><%=request.getAttribute("UNIT")%></th>
                            <th>ม้วน</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
            String num[] = (String[]) request.getAttribute("data");

            int cal = 0;
            cal = (int) Math.ceil(num.length / 10);
            int x = 0;
            for (int row = 0; row < 4; row++) {

                        %>       
                        <tr>
                            <td></td>
                            <td></td>
                            <%
                            for (int col = 1; col <= 10; col++) {
                                try {
                                    out.print("<td>" + num[x] + "</td>");
                                } catch (Exception e) {
                                    out.print("<td height='30'> </td>");
                                }
                                x++;
                            }
                            if (row == 0) {
                            %>
                            <td><%=request.getAttribute("roll")%></td>
                            <td><%=request.getAttribute("row")%></td> 
                        </tr>
                        <%
                } else {
                    out.print("<td></td>");
                    out.print("<td></td>");
                }
            }
                        %>
                    </tbody>
                </table>
            </div>
            
        </div>
        <div class="row mt-4">
            <div  class="col-4 ">
                <label class="fw-bold">ผู้เเจ้งเข้า : </label>
                <label>.........................</label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">ผู้รับเข้าตรวจสอบ : </label>
                <label>.........................</label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">วันที่ตรวจเสร็จ : </label>
                <label>.........................</label> 
            </div> 
            
        </div>
        
        
        <script>
            $(document).ready(function(){
                function today(){
                    var date = new Date();
                    var d =date.getDate()
                    var m = date.getMonth()+1;
                    var y = date.getFullYear();
                    var h = date.getHours();
                    var i = date.getMinutes()
                    var s = date.getSeconds();
                    if(m <10){
                        m = "0"+m;
                    }
                    if(i<10){
                        i = "0"+i;
                    }
                    if(s<10){
                        s = "0"+s;
                    }
                    if(d<10){
                        d = "0"+d;
                    }
                    if(h<10){
                        h = "0"+h;
                    }
                    var today = d+"/"+m+"/"+y+" "+h+":"+i+":"+s;
                    return today;
                }
                function today1(){
                    var date = new Date();
                    var d =date.getDate()
                    var m = date.getMonth()+1;
                    var y = date.getFullYear();
                    var h = date.getHours();
                    var i = date.getMinutes()
                    var s = date.getSeconds();
                    if(m <10){
                        m = "0"+m;
                    }
                    
                    if(d <10){
                        d = "0"+d;
                    }
                    var today = d+"/"+m+"/"+y;
                    return today;
                }
                $("#today").text(today());
                $("#today1").text(today1());
    
    
    
                window.print();
                
            });
        </script>
        
        
    </body>
</html>
