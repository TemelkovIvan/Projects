<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Business Calculator</title>
    <link href="calc.png" rel="shortcut icon" type="ico">
    <link rel="stylesheet" href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>
</head>
<style type="text/css">
    html, body, div, span, applet, object, iframe,
    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
    a, abbr, acronym, address, big, cite, code,
    del, dfn, em, img, ins, kbd, q, s, samp,
    small, strike, strong, sub, sup, tt, var,
    b, u, i, center,
    dl, dt, dd, ol, ul, li,
    fieldset, form, label, legend,
    table, caption, tbody, tfoot, thead, tr, th, td,
    article, aside, canvas, details, embed,
    figure, figcaption, footer, header, hgroup,
    menu, nav, output, ruby, section, summary,
    time, mark, audio, video {
    	margin: 0;
    	padding: 0;
    	border: 0;
    	font-size: 100%;
    	font: inherit;
    	vertical-align: baseline;
    }
    /* HTML5 display-role reset for older browsers */
    article, aside, details, figcaption, figure,
    footer, header, hgroup, menu, nav, section {
    	display: block;
    }
    body {
    	line-height: 1;
    }
    ol, ul {
    	list-style: none;
    }
    blockquote, q {
    	quotes: none;
    }
    blockquote:before, blockquote:after,
    q:before, q:after {
    	content: '';
    	content: none;
    }
    table {
    	border-collapse: collapse;
    	border-spacing: 0;
    }
    /* ------------------- RESET FOR CSS ------------------- */

    body {
        background-image: url('background.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100%;
    }

    nav{
    	background-color: black;
    	position: sticky;
        top: 0;
    }

 	div .row{
 	    text-transform: uppercase;
 	    color: white;
 	    font-size: 22px;
 	    padding: 2px;
 	}

    div .row a {
        text-decoration: none;
 	    color: white;
    }

 	div a:hover {
         text-decoration: none;
 	     color: orange;
 	}

    @media (max-width:800px){
        #icons {
            display: none;
        }
    }

    @media (min-width:1200px){
        .col-lg-2 {
            height: 85px;
            text-align:center;
            line-height: 20px;
        }

        #icons {
            padding: 10px;
            height: 45px;
            width: 35px;
            border-radius: 50%;
            display: inline-block;
            color: orange;
        }
    }

    .col-lg-2:hover {
        color: orange;
    }

/* ------------------- END NAVBAR ------------------- */

        @media (min-width:800px){
                        h1 {
                            font-family: Gabriola;
                            color: white;
                            margin-top: 25px 0 25px 0;
                            font-weight: bold;
                            font-size: 20px;
                            padding: 5% 0 0 57%;
                            text-transform: uppercase;
                        }

                        h3 {
                            font-family: Gabriola;
                            color: black;
                            margin-top: 0 0 15px 0;
                            font-weight: bold;
                            font-size: 12px;
                            padding: 18% 0 0 12.5%;
                            text-transform: uppercase;
                        }
                    }

        @media (min-width:1000px){
                        h1 {
                            font-family: Gabriola;
                            color: white;
                            margin-top: 25px 0 25px 0;
                            font-weight: bold;
                            font-size: 24px;
                            padding: 5% 0 0 57%;
                            text-transform: uppercase;
                        }

                        h3 {
                            font-family: Gabriola;
                            color: black;
                            margin-top: 0 0 15px 0;
                            font-weight: bold;
                            font-size: 16px;
                            padding: 18% 0 0 12.5%;
                            text-transform: uppercase;
                        }
                    }

        @media (min-width:1300px){
                h1 {
                    font-family: Gabriola;
                    color: white;
                    margin-top: 25px 0 25px 0;
                    font-weight: bold;
                    font-size: 28px;
                    padding: 5% 0 0 57%;
                    text-transform: uppercase;
                }

                h3 {
                    font-family: Gabriola;
                    color: black;
                    margin-top: 0 0 15px 0;
                    font-weight: bold;
                    font-size: 20px;
                    padding: 18% 0 0 12.5%;
                    text-transform: uppercase;
                }
            }

    @media (min-width:1500px){
            h1 {
                font-family: Gabriola;
                color: white;
                margin-top: 25px 0 25px 0;
                font-weight: bold;
                font-size: 32px;
                padding: 5% 0 0 57%;
                text-transform: uppercase;
            }

            h3 {
                font-family: Gabriola;
                color: black;
                margin-top: 0 0 15px 0;
                font-weight: bold;
                font-size: 24px;
                padding: 18% 0 0 12.5%;
                text-transform: uppercase;
            }
        }

    @media (min-width:1700px){
        h1 {
            font-family: Gabriola;
            color: white;
            margin-top: 25px 0 25px 0;
            font-weight: bold;
            font-size: 40px;
            padding: 5% 0 0 57%;
            text-transform: uppercase;
        }

        h3 {
            font-family: Gabriola;
            color: black;
            margin-top: 0 0 15px 0;
            font-weight: bold;
            font-size: 30px;
            padding: 18% 0 0 12.5%;
            text-transform: uppercase;
        }
    }



/* ------------------- START FOOTER ------------------- */

    footer {
          position: absolute;
          bottom: 10px;
          margin 0;
          padding: 10px;
          width: 100%;
    }

    h5 {
        text-transform: uppercase;
    	font-size: 25px;
        text-decoration: none;
        padding-left: 75%;
    }

    h5>a {
        text-decoration: none;
        color: gray;
    }

    h5>a:hover {
        text-decoration: none;
        color: orange;
    }

/* ------------------- END FOOTER ------------------- */

</style>
</head>

<body>
    <nav role="navigation">
                <div class="container-fluid">
                    <div class="row">
                            <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/logout';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                            <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/home';" style="cursor: pointer;"><i id="icons" class="fas fa-home"></i><br>Начало</div>
                            <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/calculator';" style="cursor: pointer;"><i id="icons" class="fas fa-calculator"></i><br>Нов Калкулатор</div>
                            <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/search';" style="cursor: pointer;"><i id="icons" class="fas fa-search"></i><br>Търсене</div>
                            <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/mail';" style="cursor: pointer"><i id="icons" class="fas fa-at"></i><br>Пишете ни</div>
                            <div class="col-lg-2 col-md-4" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
                    </div>
                </div>
            </nav>



    <div>
        <h1>Здравейте, <a href="/user">${name}</a>!!!</h1>

        <h3>&emsp;&emsp;&emsp;&emsp;Добре дошли!
            <br><br>
            Създайте Вашият бизнес калуклатор!
            <br><br>
            &emsp;&emsp;Изчислете колко ще струва <br> &emsp;&emsp;спрямо различни договори!</h3>
    </div>


</body>
    <footer>
        <h5>
            <a href="/information">Информация за нас
                        <a href="/excel" style="float:right;"><img src="/excel.png" alt="excel" style="width:20px;"></a>
                        <a href="/pdf" style="float:right;"><img src="/pdf.png" alt="pdf" style="width:20px;"></a>
                        </a>
        </h5>
    </footer>
</html>