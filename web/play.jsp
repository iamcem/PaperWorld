<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PLAY</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="/header.jsp" flush="true" />
            ${msg}
            <br/>
            <h1>LEVEL<br/><br/>${score}</h1>

            <br/>
            <p>${score} + ${score} = ?</p>

            <form action="Play" method="POST">
                <input type="text" name="answer" size="10px" placeholder="ANSWER" 
                       style="text-align: center; height: 30px; font-size: 20px;" />
                <input type="hidden" name="id" value="${fbUser.id}"/>
            </form>

        </div>
    </body>
</html>