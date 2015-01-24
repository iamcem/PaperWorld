<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PaperWorld - Read</title>
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />
        <!--div class="container">

            <div class="navbar col-lg-2" style="font-size: 130%;">
                <div class="row">
                    <div class="col-lg-12" style="padding: 0px">
                        <div class="page-header" style="font-size: 110%;">
                            <p style="padding: 15px 15px 0px 15px">
                                <a href="home.jsp" style="color: rgba(255,255,255,0.84); text-decoration: none;">
                                    <span class="mdi-action-visibility"></span> 
                                    &nbsp;Reading
                                </a>
                            </p>
                            <p style="background-color: rgba(0, 0, 0, 0.05); padding: 15px;">
                                <a href="history.jsp" style="color: rgba(255,255,255,0.84); text-decoration: none;">
                                    <span class="mdi-action-done"></span> 
                                    &nbsp;Read
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div-->

            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost:8889/paperworld"
                               user="root"  password="root"/>

            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from readed r, paper where r.user_id = '${fbUser.id}' and r.paper_id = paper.paper_id
            </sql:query>

            
            <div class="well col-lg-10">
                <div class="page-header" style="margin:0px">
                    <h4><span class="mdi-action-done"> &nbsp;Read</span></h4>
                </div>
                <c:choose>
                    <c:when test="${result.rowCount == 0}">
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="row" items="${result.rows}">
                            <div class="col-lg-12 page-header" style="margin-top: 0px">
                                <span style="width:670px;">
                                    <h5><a style="color: black; text-decoration: none;" href="">${row.title}</a></h5>
                                    <p>${row.author}</p>

                                    <sql:query dataSource="${snapshot}" var="rating">
                                        select summing / counting as score
                                        from (select sum(score) as summing from readed where paper_id = '${row.paper_id}') as summing, (select count(score) as counting from readed where paper_id = '${row.paper_id}') as counting
                                    </sql:query>

                                    <c:forEach var="rowb" items="${rating.rows}">
                                        <c:choose>
                                            <c:when test="${rowb.score >= 1 && rowb.score < 2}">
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            </c:when>
                                            <c:when test="${rowb.score >= 2 && rowb.score < 3}">
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            </c:when>
                                            <c:when test="${rowb.score >= 3 && rowb.score < 4}">
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            </c:when>
                                            <c:when test="${rowb.score >= 4 && rowb.score < 5}">
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            </c:when>
                                            <c:when test="${rowb.score >= 5}">
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                                <i class="mdi-action-favorite mdi-material-pink"></i>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </span>
                                <span style="font-size: 20px; margin-top: 2%">
                                    <a href="#" style="color: black; text-decoration: none;" onclick="return confirm('Are you sure you want to delete this paper from reading list?');">
                                        <span class="mdi-action-delete"></span>
                                    </a>
                                </span>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </body>
</html>
