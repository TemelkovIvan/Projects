<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <meta charset="UTF-8">
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
    }

    nav{
    	background-color: black;
    	position: sticky;
        top: 0;
    }

 	div{
 	    text-transform: uppercase;
 	    color: white;
 	    font-size: 22px;
 	    padding: 2px;
 	}

    div a {
        text-decoration: none;
 	    color: white;
    }

 	div a:hover {
         text-decoration: none;
 	     color: orange;
 	}

    @media (max-width:980px){
        nav{
            position: relative;
        }


        div{
            font-size: 30px;
        }
        ul {
            font-size: 30px;
            display: block;
        }
    }

    @media (max-width:800px){
        #icons {
            display: none;
        }
    }

    @media (min-width:980px){

     ul {
         top:100%;
         position: absolute;
         font-size: 20px;
         display: none;
     }

     div:hover > ul {
        text-align:left;
        line-height: 15px;
        display: block;
        background-color: black;
     }

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

    h1 {
        font-family: Gabriola;
        color: black;
        text-align: center;
        margin-top: 15px;
        margin-bottom: 15px;
        font-weight: bold;
        font-size: 50px;
        padding: 20px;
        text-transform: uppercase;
    }

    #add {
        color: blue;
        text-align: center;
        text-decoration: none;
        text-transform: uppercase;
        margin-left:44%;
    }

    #add:hover {
        color: orange;
    }

    h3 {
        font-size: 45px;
        font-family: Gabriola;
        font-weight: bold;
        text-align: center;
        padding-bottom: 50px;
    }

   p>a {
        font-size: 25px;
        text-decoration: none;
        color: blue;
    }

    p>a:hover {
        text-decoration: none;
	    color: orange;
	}

    p {
        font-size: 25px;
        padding-left: 30%;
    }

    #link {
        color: blue;
    }

    ol {
        padding-left: 33%;
    }

/* ------------------- START FOOTER ------------------- */

    footer {
          position: absolute;
          bottom: 10px;
          margin 0;
          padding: 10px;
          background-color: #000;
          width: 100%;
    }

    h5 {
        text-transform: uppercase;
        background-color: black;
    	font-size: 25px;
        text-align: center;
        text-decoration: none;
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

    <h1>Търсене на случай</h1>
        <form method="post">
            <div>
                <p>
                    <input type="text" name="number" placeholder="Отваряне на случай">
                </p>
                 <p>
                    <input type="text" name="byName" placeholder="Търсене по Потребител">
                    <br>
                    <font color="red">${errorMessage}</font>
                </p>
                <p>
                    <input type="submit" class="btn btn-secondary" value="OK"/>
                </p>
            </div>
        </form>

                <p>
                    <input id="myInput" type="text" placeholder="Търсене в резултати..">
                </p>

                <table class="table">

                    <thead>
                        <tr>
                            <th>Потребител</th>
                            <th>Случаи</th>
                            <th>Клиент</th>
                            <th>Адрес</th>
                            <th>Дата на създаване</th>
                            </tr>
                        </thead>
                    <tbody id="myTable">
                        <c:forEach items="${cases}" var="cases">
                        <tr>
                            <td>${cases.userName}</td>
                            <td>${cases.numberOfCase}</td>
                            <td>${cases.client}</td>
                            <td>${cases.address}</td>
                            <td><fmt:formatDate value="${cases.date}" pattern="dd/MM/yyyy - HH:mm"/></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>



     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
    $(document).ready(function(){
      $("#myInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });
    });
    </script>


</body>
    <footer>
        <h5>
            <a href="/information">Информация за нас</a>
        </h5>
    </footer>
    </html>