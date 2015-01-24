<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PaperWorld - Explore</title>

        <link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>

        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="dist/css/ripples.min.css" rel="stylesheet">
        <link href="dist/css/material-wfont.css" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">

            <jsp:include page="/header.jsp" flush="true" />

            <div class="well" style="text-align: center;">
                <h4>Enjoy reading with readers from around the world</h4><br>
                <table>
                    <tr>
                        <td width="670px">
                            <form method="POST" action="Explore">
                                <input style="text-align: center; height: 30px; font-size: 14px;" type="text" class="form-control empty" name="inputSearch" placeholder="Search for a paper in PaperWorld">
                                <span class="material-input"></span>
                            </form>
                        </td>
                        <td>
                            <i class="mdi-action-search"></i>
                        </td>
                    </tr>
                </table>   
            </div>
        </div>
    </body>
</html>
