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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.5/pdfmake.min.js" integrity="sha512-rDbVu5s98lzXZsmJoMa0DjHNE+RwPJACogUCLyq3Xxm2kJO6qsQwjbE5NDk2DqmlKcxDirCnU1wAzVLe12IM3w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.5/pdfmake.js" integrity="sha512-iKv9YWIwhexI0fRGos8mMuFFHhUCbpHTHFPrdByZc6C3QqMRuFN+3fdIbq6EDClHh+hYSAOf10T9VrBDPF92jA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.5/vfs_fonts.js" integrity="sha512-cktKDgjEiIkPVHYbn8bh/FEyYxmt4JDJJjOCu5/FQAkW4bc911XtKYValiyzBiJigjVEvrIAyQFEbRJZyDA1wQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.5/vfs_fonts.min.js" integrity="sha512-BDZ+kFMtxV2ljEa7OWUu0wuay/PAsJ2yeRsBegaSgdUhqIno33xmD9v3m+a2M3Bdn5xbtJtsJ9sSULmNBjCgYw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <meta http-equiv="Content-Type" content="application/Pdf">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <script>
            var docDefinition = {
                content: [
                    // if you don't need styles, you can use a simple string to define a paragraph
                    'asd>',

                    // using a { text: '...' } object lets you set styling properties
                    { text: 'This paragraph will have a bigger font', fontSize: 15 },

                    // if you set the value of text to an array instead of a string, you'll be able
                    // to style any part individually
                    {
                        text: [
                            'This paragraph is defined as an array of elements to make it possible to ',
                            { text: 'restyle part of it and make it bigger ', fontSize: 15 },
                            'than the rest.'
                        ]
                    }
                ]
            };
            pdfMake.createPdf(docDefinition).open({}, window);
        </script>
    </body>
</html>