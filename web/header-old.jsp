<style type="text/css">
    
    #auth-display-img {
        height:30px; 
        float:left;
    }

    #auth-display-name {
        height:30px; 
        float:left; 
        width:120px; 
        background-color:rgb(51,95,156);
        color:white; 
        font-family:tahoma; 
        font-weight:bold;
        font-size:12px; 
        line-height:30px;		
    }

    #auth-info {
        text-align:left;
        font-family:tahoma; 
        font-size:14px;
    }

    b {
        font-weight:normal;
        color:blue;
    }

    i {
        font-weight:bold;
        font-size:20px;
        text-transform:capitalize;
    }

    #logout {
        margin: 0px auto;
        width:80px;
        height:23px;
        background-color: blue; 
        color:white;
    }		
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="utf-8">

<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<link href="dist/css/ripples.min.css" rel="stylesheet">
<link href="dist/css/material-wfont.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="dist/js/ripples.min.js"></script>
<script src="dist/js/material.min.js"></script>
<script src="http://fezvrasta.github.io/snackbarjs/dist/snackbar.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/noUiSlider/6.2.0/jquery.nouislider.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    #banner{border-bottom:none}.page-header h1{font-size:4em}.bs-docs-section{margin-top:0em // form 8 to 0}.bs-component{position:relative}.bs-component .modal{position:relative;top:auto;right:auto;left:auto;bottom:auto;z-index:1;display:block}.bs-component .modal-dialog{width:90%}.bs-component .popover{position:relative;display:inline-block;width:220px;margin:20px}#source-button{position:absolute;top:0;right:0;z-index:100;font-weight:bold;padding: 5px 10px;}.progress{margin-bottom:10px}footer{margin:5em 0}footer li{float:left;margin-right:1.5em;margin-bottom:1.5em}footer p{clear:left;margin-bottom:0}.splash{padding:4em 0 0;background-color:#141d27;color:#fff;text-align:center}.splash h1{font-size:4em}.splash #social{margin:2em 0}.splash .alert{margin:2em 0}.section-tout{padding:4em 0 3em;border-bottom:1px solid rgba(0,0,0,0.05);background-color:#eaf1f1}.section-tout .fa{margin-right:.5em}.section-tout p{margin-bottom:3em}.section-preview{padding:4em 0 4em}.section-preview .preview{margin-bottom:4em;background-color:#eaf1f1}.section-preview .preview .image{position:relative}.section-preview .preview .image:before{box-shadow:inset 0 0 0 1px rgba(0,0,0,0.1);position:absolute;top:0;left:0;width:100%;height:100%;content:"";pointer-events:none}.section-preview .preview .options{padding:1em 2em 2em;border:1px solid rgba(0,0,0,0.05);border-top:none;text-align:center}.section-preview .preview .options p{margin-bottom:2em}.section-preview .dropdown-menu{text-align:left}.section-preview .lead{margin-bottom:2em}@media (max-width:767px){.section-preview .image img{width:100%}}.sponsor{text-align:center}.sponsor a:hover{text-decoration:none}@media (max-width:767px){#banner{margin-bottom:2em;text-align:center}}
                                                                                  .infobox .btn-sup { color: rgba(0,0,0,0.5); font-weight: bold; font-size: 15px; line-height: 30px; }
                                                                              .infobox .btn-sup img { opacity: 0.5; height: 30px;}
                                                                              .infobox .btn-sup span { padding-left: 10px; position: relative; top: 2px; }
                                                                              .icons-material .row { margin-bottom: 20px; }
                                                                              .icons-material .col-xs-2 { text-align: center; }
                                                                              .icons-material i { font-size: 34pt; }

                                                                              .icon-preview {
                                                                                  display: inline-block;
                                                                                  padding: 10px;
                                                                                  margin: 10px;
                                                                                  background: #D5D5D5;
                                                                                  border-radius: 3px;
                                                                                  cursor: pointer;
                                                                              }
                                                                              .icon-preview span {
                                                                                  display: none;
                                                                                  position: absolute;
                                                                                  background: black;
                                                                                  color: #EEE;
                                                                                  padding: 5px 8px;
                                                                                  font-size: 15px;
                                                                                  font-family: Roboto;
                                                                                  border-radius: 2px;
                                                                                  z-index: 10;
                                                                              }
                                                                              .icon-preview:hover i { color: #4285f4; }
                                                                              .icon-preview:hover span { display: block; cursor: text; }
    </style>


    <!--div id="header" style="width: 100%; color: white; background-color: gray; padding: 5px;">
    
        <h3>
            <a href="/PaperWorld/welcome.jsp" style="text-decoration: none; color: white;">HOME</a>  |  
            <a href="javascript:{}" onclick="document.getElementById('play').submit();">PLAY</a>
        </h3>
        <form id="play" action="Play" method="POST">
            <input type="hidden" name="id" value="${fbUser.id}" />
        </form>
        <p>Hello! ${fbUser.name} with level ${score}</p>
    </div-->

    <div class="bs-docs-section clearfix">
        <div class="row">
            <div class="col-lg-12">
                <div class="bs-component">
                    <div class="navbar navbar-default" style="font-size: 130%">
                            <div class="navbar-header">
                                <a class="navbar-brand" href="home.jsp">PaperWorld</a>
                            </div>

                            <c:choose>
                                <c:when test="${pageContext.request.requestURI.equals('/PaperWorld/home.jsp')}">
                                    <div class="navbar-collapse collapse navbar-responsive-collapse">
                                        <ul class="nav navbar-nav">
                                            <li class="active">
                                                <a href="home.jsp">
                                                    <span class="mdi-action-account-circle"></span> HOME
                                                </a>
                                            </li>
                                            <li>
                                                <a href="search.jsp">
                                                    <span class="mdi-action-account-child"></span>
                                                    EXPLORE
                                                </a>
                                            </li>
                                        </ul>

                                        <ul class="nav navbar-nav navbar-right">
                                            <li>
                                                <a style="margin-top: -3px;">
                                                <span class="mdi-action-assignment-ind"></span> ${fbUser.name}
                                            </a>
                                        </li>
                                        <li>
                                            <a style="margin-top: -3px;">
                                                <span class="mdi-action-assessment"></span>
                                                ${score} Pts.
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:when test="${pageContext.request.requestURI.equals('/PaperWorld/history.jsp')}">
                                    <div class="navbar-collapse collapse navbar-responsive-collapse">
                                        <ul class="nav navbar-nav">
                                            <li class="active">
                                                <a href="home.jsp">
                                                    <span class="mdi-action-account-circle"></span> HOME
                                                </a>
                                            </li>
                                            <li>
                                                <a href="search.jsp">
                                                    <span class="mdi-action-account-child"></span>
                                                    EXPLORE
                                                </a>
                                            </li>
                                        </ul>

                                        <ul class="nav navbar-nav navbar-right">
                                            <li>
                                                <a style="margin-top: -3px;">
                                                <span class="mdi-action-assignment-ind"></span> ${fbUser.name}
                                            </a>
                                        </li>
                                        <li>
                                            <a style="margin-top: -3px;">
                                                <span class="mdi-action-assessment"></span>
                                                ${score} Pts.
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="navbar-collapse collapse navbar-responsive-collapse">
                                    <ul class="nav navbar-nav">
                                        <li>
                                            <a href="home.jsp">
                                                <span class="mdi-action-account-circle"></span> HOME
                                            </a>
                                        </li>
                                        <li class="active">
                                            <a href="search.jsp">
                                                <span class="mdi-action-account-child"></span>
                                                EXPLORE
                                            </a>
                                        </li>
                                    </ul>

                                    <ul class="nav navbar-nav navbar-right">
                                        <li>
                                            <a style="margin-top: -3px;">
                                                <span class="mdi-action-assignment-ind"></span> ${fbUser.name}
                                            </a>
                                        </li>
                                        <li>
                                            <a style="margin-top: -3px;">
                                                <span class="mdi-action-assessment"></span>
                                                ${score} Pts.
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>



                    </div>
                </div>
            </div>
        </div>
    </div>