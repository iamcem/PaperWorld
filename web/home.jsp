<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PaperWorld - Home</title>
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />
        <div class="container">

            <div class="navbar col-lg-2" style="font-size: 130%;">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-header" style="font-size: 110%;">
                            <p><a href="" style="color: rgba(255,255,255,0.84); text-decoration: none;">
                                    <span class="mdi-action-visibility"></span> 
                                    &nbsp;Reading
                                </a></p>
                            <p><a href="" style="color: rgba(255,255,255,0.84); text-decoration: none;">
                                    <span class="mdi-action-done"></span> 
                                    &nbsp;Read
                                </a></p>
                        </div>
                    </div>
                </div>
            </div>

            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost:8889/paperworld"
                               user="root"  password="root"/>

            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from paper;
            </sql:query>


            <div class="well col-lg-7">
                <c:forEach var="row" items="${result.rows}">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-header">
                                <h2><a style="color: black; text-decoration: none;" href=""><c:out value="${row.title}"/></a></h2>
                                <h4><c:out value="${row.author}"/></h4>
                                <br>Example:<br><br>
                                <i class="mdi-action-favorite mdi-material-pink" style="font-size: 40pt;"></i>
                                <i class="mdi-action-favorite mdi-material-lime" style="font-size: 40pt;"></i>
                                <i class="mdi-action-favorite mdi-material-teal" style="font-size: 40pt;"></i>
                                <i class="mdi-action-favorite mdi-material-red" style="font-size: 40pt;"></i>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </body>
</html>
