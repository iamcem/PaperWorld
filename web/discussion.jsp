<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:8889/paperworld"
                   user="root"  password="root"/>

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

            <div class="well col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div style="text-align: center;">

                            <!-- information  paper -->
                            <div class="col-lg-10" style="margin-top: 10px">

                                <sql:query dataSource="${snapshot}" var="paper">
                                    SELECT * from paper where paper_id = ${paperId}
                                </sql:query>

                                <c:forEach var="paper" items="${paper.rows}">
                                    <h4>${paper.title}</h4>
                                    <p>${paper.author}</p>

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

                                    <!-- status of this paper (read, reading, add to read) -->
                                    <div class="col-lg-2">
                                        <sql:query dataSource="${snapshot}" var="readingStatus">
                                            select * from reading where user_id = '${fbUser.id}' and paper_id = '${paper.paper_id}'
                                        </sql:query>

                                        <sql:query dataSource="${snapshot}" var="readedStatus">
                                            select * from readed where user_id = '${fbUser.id}' and paper_id = '${paper.paper_id}'
                                        </sql:query>

                                        <c:choose>
                                            <c:when test="${readingStatus.rowCount == 1}">
                                                <span class="btn btn-primary disabled">
                                                    <span class="mdi-action-visibility"></span> Reading
                                                </span>
                                            </c:when>
                                            <c:when test="${readedStatus.rowCount == 1}">
                                                <span class="btn btn-primary disabled">
                                                    <span class="mdi-action-done"></span> Read
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="AddToReading?user_id=${fbUser.id}&paper_id=${row.paper_id}" class="btn btn-primary btn-raised withripple">
                                                    <span class="mdi-content-add-circle"></span> Add to read
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <hr>
                                    <h4>Readers Summary</h4>

                                    <!-- summary of each reader -->
                                    <span style="text-align: left;">         
                                        <sql:query dataSource="${snapshot}" var="discussion">
                                            select * from discussion where paper_id = '${paper.paper_id}'
                                        </sql:query>

                                        <c:forEach var="discussion" items="${discussion.rows}">
                                            <table style="text-align: center;">
                                                <tr>
                                                    <td width="40px">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <a href="#" style="text-decoration: none; color: gray;">
                                                                        <h3>
                                                                            <span class="mdi-content-add-circle-outline"></span>
                                                                        </h3>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <h3 style="margin: 0;">${discussion.vote}</h3>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <a href="#" style="text-decoration: none; color: gray;">
                                                                        <h3>
                                                                            <span class="mdi-content-remove-circle-outline"></span>
                                                                        </h3>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <blockquote>
                                                            <p>${discussion.summary}</p>
                                                            <small>${discussion.user_id}</small>
                                                        </blockquote>
                                                    </td>
                                                </tr>

                                            </table>
                                        </c:forEach>
                                    </span>

                                </c:forEach>
                            </div>
                        </div>
                        <!-- end of information each paper -->

                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
