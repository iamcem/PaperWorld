<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- data source -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:8889/paperworld"
                   user="root"  password="root"/>

<!-- end of data source -->

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

            <sql:query dataSource="${snapshot}" var="paper">
                select * from paper where title like '%${inputSearch}%'
            </sql:query>

            <div class="well">
                <div class="page-header" style="margin:0px">
                    <table>
                        <tr>
                            <td width="270px">
                                <c:choose>
                                    <c:when test="${paper.rowCount == 0}">
                                        <h4>We couldn't find any results for "${inputSearch}".</h4>
                                    </c:when>
                                    <c:when test="${paper.rowCount > 1}">
                                        <h4>Viewing ${paper.rowCount} papers matching</h4>
                                    </c:when>
                                    <c:when test="${paper.rowCount == 1}">
                                        <h4>Viewing ${paper.rowCount} paper matching</h4>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td width="350px">
                                <form method="POST" action="Explore">
                                    <span style="padding-top: 15px; text-align: center;">
                                        <input style="text-align: center; height: 30px; font-size: 14px;" type="text" class="form-control empty" name="inputSearch" placeholder="Search for a paper in PaperWorld" value="${inputSearch}"><span class="material-input"></span>
                                    </span>
                            </td>
                            <td>
                                <i class="mdi-action-search"></i>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- information each paper -->
                <div class="col-lg-10" style="margin-top: 10px">

                    <c:forEach var="paper" items="${paper.rows}">
                        <div class="page-header">
                            <a style="text-decoration: none;" href="Discussion?paperId=${paper.paper_id}">${paper.title}</a>
                            <p><c:out value="${paper.author}"/></p>

                            <sql:query dataSource="${snapshot}" var="rating">
                                select summing / counting as score
                                from (select sum(score) as summing from readed where paper_id = '${paper.paper_id}') as summing, (select count(score) as counting from readed where paper_id = '${paper.paper_id}') as counting
                            </sql:query>

                            <c:forEach var="rating" items="${rating.rows}">
                                <c:choose>
                                    <c:when test="${rating.score >= 1 && rating.score < 2}">
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                    </c:when>
                                    <c:when test="${rating.score >= 2 && rating.score < 3}">
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                    </c:when>
                                    <c:when test="${rating.score >= 3 && rating.score < 4}">
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                    </c:when>
                                    <c:when test="${rating.score >= 4 && rating.score < 5}">
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                    </c:when>
                                    <c:when test="${rating.score >= 5}">
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                        <i class="mdi-action-favorite mdi-material-pink"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <span style="float: right; alignment-baseline: central;">
                                <sql:query dataSource="${snapshot}" var="readingStatus">
                                    select * from reading where user_id = '${fbUser.id}' and paper_id = '${paper.paper_id}'
                                </sql:query>

                                <sql:query dataSource="${snapshot}" var="readedStatus">
                                    select * from readed where user_id = '${fbUser.id}' and paper_id = '${paper.paper_id}'
                                </sql:query>

                                <c:choose>
                                    <c:when test="${readingStatus.rowCount == 1}">
                                        <span class="btn btn disabled">
                                            <span class="mdi-action-visibility"></span> Reading
                                        </span>
                                    </c:when>
                                    <c:when test="${readedStatus.rowCount == 1}">
                                        <span class="btn btn disabled">
                                            <span class="mdi-action-done"></span> Read
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="AddToReading?user_id=${fbUser.id}&paper_id=${row.paper_id}" class="btn btn-flat btn-default withripple">
                                            <span class="mdi-content-add-circle"></span> Add to read
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                    </c:forEach>
                </div>
                <!-- end of information each paper -->
            </div>
        </div>
    </body>
</html>
