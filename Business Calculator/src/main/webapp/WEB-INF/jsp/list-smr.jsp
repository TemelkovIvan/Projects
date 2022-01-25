<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Education</title>
 <link href="books.ico" rel="shortcut icon" type="ico">
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

        #page-container {
            position: relative;
            min-height: 100vh;
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
        margin-top: 25px;
        margin-bottom: 25px;
        font-weight: bold;
        font-size: 50px;
        padding: 30px;
        text-transform: uppercase;
    }

    table {
        font-size: 12px;
        border-spacing: 0;
        border: 2px solid black;
    }

    th {
        font-size: 15px;
        font-weight: bold;
        width: 1%;
        text-align: center;
    }

    tr:nth-child(even) td {
        background-color: whitesmoke;
        text-align: center;
    }

    tr:nth-child(odd) td {
        background-color: gray;
        text-align: center;
    }

    #add {
    color: gray;
    font-family: Gabriola;
    font-weight: bold;
    padding-left: 550px;
    padding-bottom: 50px;
    font-size: 30px;
    }

    #add:hover {
        color: orange;
        text-decoration: none;
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

<body id="page-container">

<nav role="navigation">
        <div class="container-fluid">
            <div class="row">
                    <div class="col-lg-2 col-xs-12" align="center" onclick="location.href='/';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                    <div class="col-lg-2 col-xs-12"></div>
                    <div class="col-lg-2 col-xs-12"></div>
                    <div class="col-lg-2 col-xs-12"></div>
                    <div class="col-lg-2 col-xs-12"></div>
                    <div class="col-lg-2 col-xs-12" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
            </div>
        </div>
    </nav>

     <h1>СМР</h1>
        <div class="container">

        <table class="table">

            <thead>
                <tr>
                    <th>Позиция</th>
                    <th>Дейност</th>
                    <th>Описание</th>
                    <th>Цена Договор A</th>
                    <th>Цена Договор B</th>
                    <th>Цена Договор C</th>
                    <th>Цена Договор D</th>
                    <th>Цена Договор E</th>
                    <th>Промяна</th>
                    <th>Изтриване</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach items="${smr}" var= "smr">
                            <tr>
                                <td>${smr.position}</td>
                                <td>${smr.action}</td>
                                <td>${smr.descr}</td>
                                <td>${smr.price_contract_1}</td>
                                <td>${smr.price_contract_2}</td>
                                <td>${smr.price_contract_3}</td>
                                <td>${smr.price_contract_4}</td>
                                <td>${smr.price_contract_5}</td>
                                <td><a type="button" class="btn btn-secondary" href="/update">Промени</a></td>
                                <td><a type="button" class="btn btn-dark" onclick="return confirm('Моля потвърдете');" href="/delete">Изтрий</a></td>
                            </tr>
                </c:forEach>
            </tbody>
        </table>

     <br/>

    </div>
    <a id="add" href="/add">Добавяне на СМР</a>
    <br><br><br><br><br><br><br>
        <footer>
            <h5>
                <a href="/information">Информация за нас</a>
            </h5>
        </footer>
    </body>

    </html>