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
        <jsp:include page="/header.jsp" flush="true" />
        <div class="container">

            <div class="well col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div style="text-align: center;">

                            <h2>Enjoy reading with readers from around the world</h2>

                            <br>

                            <div class="form-control-wrapper">
                                <form method="POST" action="Explore">
                                    <div class="col-lg-11" style="padding-top: 15px;">
                                        <input style="text-align: center; height: 30px; font-size: 20px;" type="text" class="form-control empty" name="inputSearch" placeholder="Search for a paper in PaperWorld"><span class="material-input"></span>
                                    </div>
                                    <div class="col-lg-1">
                                        <button type="submit" class="btn btn-primary withripple"><i class="mdi-action-search"></i><div class="ripple-wrapper"></div></button>
                                    </div>
                                </form>
                            </div>       

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
