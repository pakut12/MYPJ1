<%-- 
    Document   : head
    Created on : 30 ก.ค. 2565, 8:21:49
    Author     : Gus
--%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String statusqi1 = (String) session.getAttribute("statusqi");
            try {


                String pattern = "dd/MM/yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String date = simpleDateFormat.format(new Date());

                String status0 = (String) session.getAttribute("status");


%>
<%

                String x = null;

                if (status0.equals("01")) {
                    x = "Admin";
%>
<nav class="navbar navbar-expand-lg bg-light fixed-top shadow ">
    <div class="container">
        <a class="navbar-brand" href="#">Admin RM / QC RM</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <li class="nav-item"> 
                    <a class="nav-link " aria-current="page" href="home.jsp" id="page1">
                        <i class="bi bi-house-door-fill "></i>
                    หน้าเเรก</a>
                </li>
                <li class="nav-item"> 
                    <a class="nav-link " aria-current="page" href="displayuser.jsp" id="page5">
                        <i class="bi bi-people-fill"></i>
                    ระบบจัดการรายชื่อ</a>
                </li>
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page2">
                        <i class="bi bi-list"></i> RM
                    </a>
                    <ul class="dropdown-menu">
                        <li><h6 class="dropdown-header">เมนูผ้าถัก</h6></li>
                        <li><a class="dropdown-item" href="getdatafromsap.jsp"><i class="bi bi-arrow-bar-down"></i> ดึงข้อมูลจาก SAP ด้วยเลขที่ PO</a></li>
                        <li><a class="dropdown-item" href="keyitem.jsp"><i class="bi bi-key"></i> คีย์ข้อมูลใบเเจ้งเข้าวัตถุดิบ</a></li>
                        <li><a class="dropdown-item" href="printitemrm.jsp"><i class="bi bi-printer"></i> พิมพ์ใบเเจ้งเข้าวัตถุดิบ</a></li> 
                        <li><a class="dropdown-item" href="sendtoqc.jsp"><i class="bi bi-send"></i> ส่งข้อมูลให้ทาง QC</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><h6 class="dropdown-header">เมนูควบคุม</h6></li>
                        <li><a class="dropdown-item" href="keyandeditinvoice.jsp"><i class="bi bi-keyboard"></i> โปรเเกรมคีย์เเละเเก้ไขข้อมูลใบ Invoice</a></li>
                        <li><a class="dropdown-item" href="displayshowdoc.jsp"><i class="bi bi-bar-chart"></i> โปรเเกรมเเสดงข้อมูลตามเลขที่เอกสาร</a></li>
                        <li><a class="dropdown-item" href="displayshowpo.jsp"><i class="bi bi-book"></i> โปรเเกรมเเสดงข้อมูลตามเลขที่ใบสั้งซื้อ (PO)</a></li>
                        <li><a class="dropdown-item" href="displayshowitamfinddate.jsp"><i class="bi bi-box-seam"></i> โปรเเกรมเเสดงข้อมูลตามรหัสวัตถุดิบเเละวันที่สร้างรหัส</a></li>
                        <li><a class="dropdown-item" href="deldoc.jsp"><i class="bi bi-trash"></i> โปรเเกรมลบข้อมูลตามเลขที่เอกสาร</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-list"></i> QC RM
                    </a>
                    <ul class="dropdown-menu">
                        <li><h6 class="dropdown-header">เมนูผ้าถัก</h6></li>
                        <li><a class="dropdown-item" href="qckeydata.jsp"><i class="bi bi-keyboard"></i> โปรเเกรมคีย์ข้อมูลการตรวจสอบผ้าถัก</a></li>
                        <li><a class="dropdown-item" href="qckeylog.jsp"><i class="bi bi-briefcase"></i> โปรเเกรมคีย์สรุปผลการตรวจสอบผ้าถัก</a></li>
                        <li><a class="dropdown-item" href="printqc.jsp"><i class="bi bi-bar-chart"></i> โปรเเกรมพิมพ์ใบตรวจสอบผ้าถัก</a></li>
                        
                    </ul>
                </li>
                
            </ul>
            <ul class="navbar-nav ">
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-person-lines-fill"></i> คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%>
                    </a>
                    <ul class="dropdown-menu" style="width: 15rem;">
                        <li><h6 class="dropdown-header">เมนูผู้ใช้</h6></li>
                        <li><p class="mx-4">วันที่ : <%=date%></p></li>
                        <li> <p class="mx-4">สถานะ : <%= x%></p></li>
                        <li> <p class="mx-4">ไอดี : <%= session.getAttribute("user")%></p></li>
                        <li> <p class="mx-4">ชื่อ : คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%></p></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger text-center " href="index.jsp?logout=1"><i class="bi bi-box-arrow-left"></i> ออกจากระบบ</a></li>
                        
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br><br>
<%
                } else if (status0.equals("02")) {
                    x = "RM";
%>
<nav class="navbar navbar-expand-lg bg-light fixed-top shadow ">
    <div class="container">
        <a class="navbar-brand" href="#">RM</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <li class="nav-item"> 
                    <a class="nav-link " aria-current="page" href="home.jsp" id="page1">
                        <i class="bi bi-house-door-fill "></i>
                    หน้าเเรก</a>
                </li>
                
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page2">
                        <i class="bi bi-list"></i> RM
                    </a>
                    <ul class="dropdown-menu">
                        <li><h6 class="dropdown-header">เมนูผ้าถัก</h6></li>
                        <li><a class="dropdown-item" href="getdatafromsap.jsp"><i class="bi bi-arrow-bar-down"></i> ดึงข้อมูลจาก SAP ด้วยเลขที่ PO</a></li>
                        <li><a class="dropdown-item" href="keyitem.jsp"><i class="bi bi-key"></i> คีย์ข้อมูลใบเเจ้งเข้าวัตถุดิบ</a></li>
                        <li><a class="dropdown-item" href="printitemrm.jsp"><i class="bi bi-printer"></i> พิมพ์ใบเเจ้งเข้าวัตถุดิบ</a></li> 
                        <li><a class="dropdown-item" href="sendtoqc.jsp"><i class="bi bi-send"></i> ส่งข้อมูลให้ทาง QC</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><h6 class="dropdown-header">เมนูควบคุม</h6></li>
                        <li><a class="dropdown-item" href="keyandeditinvoice.jsp"><i class="bi bi-keyboard"></i> โปรเเกรมคีย์เเละเเก้ไขข้อมูลใบ Invoice</a></li>
                        <li><a class="dropdown-item" href="displayshowdoc.jsp"><i class="bi bi-bar-chart"></i> โปรเเกรมเเสดงข้อมูลตามเลขที่เอกสาร</a></li>
                        <li><a class="dropdown-item" href="displayshowpo.jsp"><i class="bi bi-book"></i> โปรเเกรมเเสดงข้อมูลตามเลขที่ใบสั้งซื้อ (PO)</a></li>
                        <li><a class="dropdown-item" href="displayshowitamfinddate.jsp"><i class="bi bi-box-seam"></i> โปรเเกรมเเสดงข้อมูลตามรหัสวัตถุดิบเเละวันที่สร้างรหัส</a></li>
                        <li><a class="dropdown-item" href="deldoc.jsp"><i class="bi bi-trash"></i> โปรเเกรมลบข้อมูลตามเลขที่เอกสาร</a></li>
                    </ul>
                </li>
                
                
            </ul>
            <ul class="navbar-nav ">
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-person-lines-fill"></i> คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%>
                    </a>
                    <ul class="dropdown-menu" style="width: 15rem;">
                        <li><h6 class="dropdown-header">เมนูผู้ใช้</h6></li>
                        <li><p class="mx-4">วันที่ : <%=date%></p></li>
                        <li> <p class="mx-4">สถานะ : <%= x%></p></li>
                        <li> <p class="mx-4">ไอดี : <%= session.getAttribute("user")%></p></li>
                        <li> <p class="mx-4">ชื่อ : คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%></p></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger text-center " href="index.jsp?logout=1"><i class="bi bi-box-arrow-left"></i> ออกจากระบบ</a></li>
                        
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br><br>
<%
                } else if (status0.equals("03")) {
                    x = "QC RM";
%>
<nav class="navbar navbar-expand-lg bg-light fixed-top shadow ">
    <div class="container">
        <a class="navbar-brand" href="#">QC RM</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <li class="nav-item"> 
                    <a class="nav-link " aria-current="page" href="home.jsp" id="page1">
                        <i class="bi bi-house-door-fill "></i>
                    หน้าเเรก</a>
                </li>
                
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-list"></i> QC RM
                    </a>
                    <ul class="dropdown-menu">
                        <li><h6 class="dropdown-header">เมนูผ้าถัก</h6></li>
                        <li><a class="dropdown-item" href="qckeydata.jsp"><i class="bi bi-keyboard"></i> โปรเเกรมคีย์ข้อมูลการตรวจสอบผ้าถัก</a></li>
                        <li><a class="dropdown-item" href="qckeylog.jsp"><i class="bi bi-briefcase"></i> โปรเเกรมคีย์สรุปผลการตรวจสอบผ้าถัก</a></li>
                        <li><a class="dropdown-item" href="printqc.jsp"><i class="bi bi-bar-chart"></i> โปรเเกรมพิมพ์ใบตรวจสอบผ้าถัก</a></li>
                        
                    </ul>
                </li>
                
            </ul>
            <ul class="navbar-nav ">
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-person-lines-fill"></i> คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%>
                    </a>
                    <ul class="dropdown-menu" style="width: 15rem;">
                        <li><h6 class="dropdown-header">เมนูผู้ใช้</h6></li>
                        <li><p class="mx-4">วันที่ : <%=date%></p></li>
                        <li> <p class="mx-4">สถานะ : <%= x%></p></li>
                        <li> <p class="mx-4">ไอดี : <%= session.getAttribute("user")%></p></li>
                        <li> <p class="mx-4">ชื่อ : คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%></p></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger text-center " href="index.jsp?logout=1"><i class="bi bi-box-arrow-left"></i> ออกจากระบบ</a></li>
                        
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br><br>
<%
                } else if (status0.equals("04")) {
                    x = "CUT";

%>
<nav class="navbar navbar-expand-lg bg-light fixed-top shadow ">
    <div class="container">
        <a class="navbar-brand" href="#">CUT</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <li class="nav-item"> 
                    <a class="nav-link " aria-current="page" href="home.jsp" id="page1">
                        <i class="bi bi-house-door-fill "></i>
                    หน้าเเรก</a>
                </li>
                
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-list"></i> CUT
                    </a>
                    <ul class="dropdown-menu">
                        <li><h6 class="dropdown-header">เมนูผ้าถัก</h6></li>
                        
                        <li><a class="dropdown-item" href="printqc.jsp"><i class="bi bi-bar-chart"></i> โปรเเกรมพิมพ์ใบตรวจสอบผ้าถัก</a></li>
                        
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav ">
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-person-lines-fill"></i> คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%>
                    </a>
                    <ul class="dropdown-menu" style="width: 15rem;">
                        <li><h6 class="dropdown-header">เมนูผู้ใช้</h6></li>
                        <li><p class="mx-4">วันที่ : <%=date%></p></li>
                        <li> <p class="mx-4">สถานะ : <%= x%></p></li>
                        <li> <p class="mx-4">ไอดี : <%= session.getAttribute("user")%></p></li>
                        <li> <p class="mx-4">ชื่อ : คุณ <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%></p></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger text-center " href="index.jsp?logout=1"><i class="bi bi-box-arrow-left"></i> ออกจากระบบ</a></li>
                        
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br><br><br><br>
<%                }
            } catch (Exception e) {
                response.sendRedirect("index.jsp");
            }
%>