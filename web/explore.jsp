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

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:8889/paperworld"
                           user="root"  password="root"/>

        <sql:query dataSource="${snapshot}" var="result">
            select * from paper where title like '%${inputSearch}%'
        </sql:query>

        <div class="container">

            <div class="well col-lg-12">
                <div class="row">
                    <div class="col-lg-12 page-header">
                        <div class="col-lg-5">
                            <c:choose>
                                <c:when test="${result.rowCount == 0}">
                                    <h2>We couldn't find any results for "${inputSearch}".</h2>
                                </c:when>
                                <c:when test="${result.rowCount != 0}">
                                    <h2>Viewing ${result.rowCount} papers matching</h2>
                                </c:when>
                            </c:choose>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-control-wrapper">
                                <form method="POST" action="Explore">
                                    <div class="col-lg-11" style="padding-top: 15px;">
                                        <input style="text-align: center; height: 30px; font-size: 20px;" type="text" name="inputSearch" value="${inputSearch}" class="form-control empty" id="inputSearch" placeholder="Search for a paper in PaperWorld"><span class="material-input"></span>
                                    </div>
                                    <div class="col-lg-1">
                                        <button type="submit" class="btn btn-primary withripple"><i class="mdi-action-search"></i><div class="ripple-wrapper"></div></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <c:forEach var="row" items="${result.rows}">
                        <div class="col-lg-12 page-header">
                            <h3><a style="color: black; text-decoration: none;" href=""><c:out value="${row.title}"/></a></h3>
                            <h4><c:out value="${row.author}"/></h4>
                            <br>Example:<br><br>
                            <i class="mdi-action-favorite mdi-material-pink" style="font-size: 40pt;"></i>
                            <i class="mdi-action-favorite mdi-material-lime" style="font-size: 40pt;"></i>
                            <i class="mdi-action-favorite mdi-material-teal" style="font-size: 40pt;"></i>
                            <i class="mdi-action-favorite mdi-material-red" style="font-size: 40pt;"></i>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </body>
</html>
