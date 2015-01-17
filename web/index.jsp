<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SAMPLE GAME</title> 
        <style type="text/css">
            .container {
                font-family:tahoma;
                width:100%;
                background-color:white;
                text-align:center;
            }

            b {
                font-weight:normal;
                color:blue;
            }

            #logout {
                margin: 0px auto;
                width:80px;
                height:23px;
                background-color: blue; 
                color:white;
            }
        </style>
    </head>
    <body>
            <h1>SAMPLE GAME</h1>
            <a href="login"><img src="./pics/facebook_login.png" /></a>
            <% response.sendRedirect("login"); %>
    </body>
</html>