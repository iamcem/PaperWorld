<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- paper (reading & readed) data source -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:8889/paperworld"
                   user="root"  password="root" />

<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PaperWorld - Home</title>

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

        <!-- reading section -->
        <div class="well col-lg-10">
            <div class="page-header" style="margin:0px">
                <h4><span class="mdi-action-visibility"> &nbsp;Reading</span></h4>
            </div>

            <c:choose>
                <c:when test="${reading.rowCount == 0}">
                    <p style="margin-top: 20px; text-align: center">No reading paper. Let's <a href="explore.jsp">explore</a> the world.</p>
                </c:when>
                <c:otherwise>

                    <sql:query dataSource="${snapshot}" var="reading">
                        SELECT * from reading r, paper where r.user_id = '${fbUser.id}' and r.paper_id = paper.paper_id
                    </sql:query>

                    <c:forEach var="readingRow" items="${reading.rows}">
                        <div class="col-lg-12 page-header" style="margin-top: 0px">
                            <div style="width:670px; padding-top: 3%;">
                                <a style="text-decoration: none;" href="Discussion?paperId=${readingRow.paper_id}">${readingRow.title}</a>
                                <p>${readingRow.author}</p>

                                <sql:query dataSource="${snapshot}" var="readingScore">
                                    select summing / counting as score
                                    from (select sum(score) as summing from readed where paper_id = '${readingRow.paper_id}') as summing, (select count(score) as counting from readed where paper_id = '${readingRow.paper_id}') as counting
                                </sql:query>

                                <c:forEach var="readingRating" items="${readingScore.rows}">
                                    <c:choose>
                                        <c:when test="${readingRating.score >= 1 && readingRating.score < 2}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readingRating.score >= 2 && readingRating.score < 3}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readingRating.score >= 3 && readingRating.score < 4}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readingRating.score >= 4 && readingRating.score < 5}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readingRating.score >= 5}">
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
                            </div>
                            <span style="position: absolute; right: 10px; bottom: 50px">
                                <a href="#" style="text-decoration: none; color: black;" onclick="return confirm('Are you sure you want to delete this paper from reading list?');">
                                    <span class="mdi-action-delete"></span>
                                </a>
                            </span>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <!-- end of reading section -->

        <!-- readed section -->
        <div class="well col-lg-10">
            <div class="page-header" style="margin:0px">
                <h4><span class="mdi-action-done"> &nbsp;Read</span></h4>
            </div>
            <c:choose>
                <c:when test="${readed.rowCount == 0}">
                    <p style="margin-top: 20px; text-align: center">No read paper</p>
                </c:when>
                <c:otherwise>
                    
                    <sql:query dataSource="${snapshot}" var="readed">
                        SELECT * from readed r, paper where r.user_id = '${fbUser.id}' and r.paper_id = paper.paper_id
                    </sql:query>

                    <c:forEach var="readedRow" items="${readed.rows}">
                        <div class="col-lg-12 page-header">
                            <span style="width:670px;">
                                <a style="text-decoration: none;" href="Discussion?paperId=${readedRow.paper_id}">${readedRow.title}</a>
                                <p>${readedRow.author}</p>

                                <sql:query dataSource="${snapshot}" var="readedScore">
                                    select summing / counting as score
                                    from (select sum(score) as summing from readed where paper_id = '${readedRow.paper_id}') as summing, (select count(score) as counting from readed where paper_id = '${readedRow.paper_id}') as counting
                                </sql:query>

                                <c:forEach var="readedScoreRow" items="${readedScore.rows}">
                                    <c:choose>
                                        <c:when test="${readedScoreRow.score >= 1 && readedScoreRow.score < 2}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readedScoreRow.score >= 2 && readedScoreRow.score < 3}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readedScoreRow.score >= 3 && readedScoreRow.score < 4}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readedScoreRow.score >= 4 && readedScoreRow.score < 5}">
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite mdi-material-pink"></i>
                                            <i class="mdi-action-favorite-outline mdi-material-pink"></i>
                                        </c:when>
                                        <c:when test="${readedScoreRow.score >= 5}">
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
                            </span>
                            <span style="position: absolute; right: 10px; bottom: 50px">
                                <a href="#" style="text-decoration: none; color: black;" onclick="return confirm('Are you sure you want to delete this paper from reading list?');">
                                    <span class="mdi-action-delete"></span>
                                </a>
                            </span>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <!-- end of readed section -->
    </div>

</body>