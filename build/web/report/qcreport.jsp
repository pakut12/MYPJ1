<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Map" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.io.*" %>
<%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="../js/pdfmake.min.js"></script>
        <script src="../js/vfs_fonts.js"></script>
        
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <script>
            pdfMake.fonts = {
                THSarabunNew: {
                    normal: 'THSarabunNew.ttf',
                    bold: 'THSarabunNew-Bold.ttf',
                    italics: 'THSarabunNew-Italic.ttf',
                    bolditalics: 'THSarabunNew-BoldItalic.ttf'
                },
                Roboto: {
                    normal: 'Roboto-Regular.ttf',
                    bold: 'Roboto-Medium.ttf',
                    italics: 'Roboto-Italic.ttf',
                    bolditalics: 'Roboto-MediumItalic.ttf'
                }
            }
            var docDefinition = {
                pageSize: {
                    width: 595.28,
                    height: 'auto'
                },
                
               
                content: [{
                        columns: [
                            {
                                width: '*',
                                text: 'สาขา : ',
                                fontSize: 12,
                                alignment: 'left'
                            },
                            {
                                width: '*',
                                text: 'บริษัท ไทยสปอร์ตการ์เมนต์ จำกัด \n ใบตรวจสอบผ้าถัก',
                                fontSize: 15,
                                alignment: 'center',
                                bold:true
                            },
                            {
                                width: '*',
                                text: 'หน้า : ',
                                fontSize: 12,
                                alignment: 'right'
                            }
                            
                        ]
                    },
                    {
                        columns: [{
                                width: '*',
                                text: 'รหัส : ',
                                fontSize: 12,
                                alignment: 'left'
                            },
                            {
                                width: '*',
                                text: 'เลขที่ใบสั้งซื้อ : ',
                                fontSize: 12,
                                alignment: 'center'
                            },
                            {
                                width: '*',
                                text: 'เลขที่บิล : ',
                                fontSize: 12,
                                alignment: 'center'
                            },
                            {
                                width: '*',
                                text: 'วันที่บิล : ',
                                fontSize: 12,
                                alignment: 'right'
                            }]
                    },
                    {
                        columns: [{
                                width: '*',
                                text: 'Description 1/หน้าผ้าที่สั่งซื้อ : ',
                                fontSize: 12,
                                alignment: 'left'
                            },
                            
                            {
                                width: '*',
                                text: 'พาเลต : ',
                                fontSize: 12,
                                alignment: 'right'
                            }]
                    }
                    ,{
                        columns: [
                            {
                                width: '*',
                                text: 'Description 2 : ',
                                fontSize: 12,
                                alignment: 'left'
                            }, 
                            {
                                width: '*',
                                text: 'Description 3 : ',
                                fontSize: 12,
                                alignment: 'right'
                            }
                            
                        ]
                    },
                    {
                        columns: [{
                                width: '*',
                                text: 'ร้านค้า : ',
                                fontSize: 12,
                                alignment: 'left'
                            },
                            {
                                width: '*',
                                text: 'เลขที่เอกสาร : ',
                                fontSize: 12,
                                alignment: 'center'
                            },
                            {
                                width: '*',
                                text: 'หน่วยนับ : ',
                                fontSize: 12,
                                alignment: 'center'
                            },
                            {
                                width: '*',
                                text: 'วันที่ : ',
                                fontSize: 12,
                                alignment: 'right'
                            }]
                    },
                    {
                        style: 'tableExample',
                        table: {
                           
                            widths: ['auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto', 
                                'auto'],
                            body: [
                                ['ม้วนที่', 
                                    'หน้าผ้า\nที่วัดได้', 
                                    'สี', 
                                    'มาตรฐาน\nสี', 
                                    'จำนวน\nที่มา', 
                                    'จำนวน\nที่ได้', 
                                    'จุดสี-น้ำมัน-สกปรก', 
                                    'ลาย\nขวาง', 
                                    'ความกว้าง\nไม่ได้\nมาตรฐาน', 
                                    'ปุ่ม\nปม', 
                                    'เส้นด้าย\nขาด', 
                                    'รอย\nด่าง', 
                                    'รอย\nเข็ม', 
                                    'รอยเข็ม\nเข้าลึก', 
                                    'บาร์โค็ด\nร้านค้า', 
                                    'หม้อ\nย้อม', 
                                    'ตำหนิ\nรวม', 
                                    'คะเเนน', 
                                    'MARK'],
                                <%
            for (int a = 0; a < 25; a++) {
                                %>
                               
                                                        [49, 
                                                            170, 
                                                            4.5, 
                                                            2.3, 
                                                            44, 
                                                            44, 
                                                            0, 
                                                            0, 
                                                            1, 
                                                            0, 
                                                            0, 
                                                            0, 
                                                            0, 
                                                            0, 
                                                            0, 
                                                            603104421, 
                                                            'KH-602/25', 
                                                            1, 
                                                            '*'],
                                <%            }
                               %>
                                                   ]
                                               }
                                           },
                                           {
                                               columns: [
                                                   {
                                                       width: '*',
                                                       text: 'จำนวนที่มา : 10 \n จำนวนที่ได้ : 10',
                                                       fontSize: 12,
                                                       alignment: 'left'
                                                   },
                                                   {
                                                       width: '*',
                                                       text: 'สรุปผล \n re1\n re1\n re1',
                                                       fontSize: 12,
                                                       alignment: 'center'
                               
                                                   },
                                                   {
                                                       width: '*',
                                                       text: 'น้ำหนัก KG/M: \n 0',
                                                       fontSize: 12,
                                                       alignment: 'center'
                               
                                                   },
                                                   {
                                                       width: '*',
                                                       text: 'ชื่อผู้ตรวจสอบ.................................\n ผู้รับผิดชอบ.................................\n จัดซื้อ.................................\n สต็อกวัตถุดิบ.................................\n เเผนกตัด.................................\n',
                                                       fontSize: 12,
                                                       alignment: 'right'
                                                   }
                            
                                               ]
                                           }
                    
                                       ],
                                       styles: {
                                           footer:{
                                               margin: [0, 5, 0, 15]
                                           },
                                           tableExample: {
                                               margin: [0, 5, 0, 15],
                                               fontSize: 10,
                                               alignment: 'center'
                                           }
                    
                                       },
                                       defaultStyle: {
                                           font: 'THSarabunNew'
                                       }
                                   };
                                   pdfMake.createPdf(docDefinition).open({}, window);
        </script>
    </body>
</html>