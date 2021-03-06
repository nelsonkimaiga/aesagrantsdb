<%-- 
    Document   : index
    Created on : Jul 27, 2017, 10:19:22 AM
    Author     : kimaiga
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, backend.DbConn;"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>AESA Grantees Database</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
        <!--font-awesome-->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#myTable').dataTable();
            });
        </script>
    </head>
    <body>
        <div class="container">
            <br>
            <div class="row">
                <h5 style="text-align: center;">AESA - Database of Grantees</h5>
            </div>
            <hr>
            <br>
            <!--data table-->
            <div class="row">
                <div class="large-8 large-centered columns">
                    <%
                        Connection connection = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/grantsdb", "root", "303seminarian");
                        Statement statement = connection.createStatement();
                        ResultSet resultset = statement.executeQuery("select * from grantees");
                        while (resultset.next()) {%>
                                             
                    <table class="hover" id="myTable">
                        <thead>
                            <tr>
                                <th>Grantee</th>
                                <th>Year</th>
                                <th>Issue</th>
                                <th>Program</th>
                                <th>Amount</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td><%= resultset.getString("grantee-name")%></td>
                                <td><%= resultset.getString(2) %></td>
                                <td><%= resultset.getString(3) %></td>
                                <td><%= resultset.getString(4) %></td>
                                <td>$ <%= resultset.getString(5) %></td>
                            </tr>

                        </tbody>

                    </table>
                        }
                    %>
                                        

                    <!--                    <a href="add-new.jsp" target="_blank" class="button success" >Add a new grantee entry</a>-->

                </div>
            </div>        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/js/foundation.min.js"></script>
    </body>
</html>
