<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Education</title>
<link href="books.ico" rel="shortcut icon" type="ico">
 <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
     rel="stylesheet">
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
        background-color: gray;
    }

    nav{
    	background-color: black;
    }

 	div{
 	    text-transform: uppercase;
 	    font-size: 25px;
 	    padding: 2px;
 	}

     ul {
         top:100%;
         position: absolute;
         font-size: 20px;
         display: none;
     }

     div:hover > ul {
         display: block;
         background-color: black;
     }

    div a {
        text-decoration: none;
 	    color: white;
    }

 	div a:hover {
         text-decoration: none;
 	     color: orange;
 	}

    h1 {
        font-family: Gabriola;
        text-align: center;
        margin-top: 50px;
        margin-bottom: 50px;
        font-weight: bold;
        font-size: 50px;
        padding: 30px;
        text-transform: uppercase;
        background-color:rgb(93, 75, 99);
        border-radius: 52%;
        box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
    }

    h3 {
        font-size: 25px;
        font-family: Gabriola;
        padding: 10px;
        font-weight: bold;
        padding-left: 300px;
    }

    h4 {
        font-family: Gabriola;
        padding: 10px;
        font-weight: bold;
        color: white;
    padding-left: 50px;
    }

    table {
        color: #333333;
        border-spacing: 0;
        margin-left: 50px;
    }

    tr:nth-child(even) td {
        background-color: #baca9a;
    }

    tr:nth-child(odd) td {
        background-color: #a19f86;
    }

    p {
        color: white;
        padding-left: 100px;
        padding-right: 100px;
    }

    #add {
    color: orange;
    font-family: Gabriola;
    font-weight: bold;
    padding-left: 550px;
    font-size: 30px;
    }

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color:rgb(93, 75, 99);
        border-radius: 52%;
        box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
    	font-size: 25px;
        margin-top: 130px;
        text-align: center;
        text-decoration: none;
        color: yellow;
    }

    h5>a {
        text-decoration: none;
        color: gray;
    }

    h5>a:hover {
        text-decoration: none;
        color: white;
    }

    #user a {
        float: right;
    }

</style>

<body>


<nav role="navigation">
        <div class="container-fluid">
            <div class="row">
                    <div class="col-lg-2 col-md-4"><a href="/learn">Друг потребител</a></div>
                    <div class="col-lg-2 col-md-4"><a href="/list-educations">Обучения на ${name}
                           <ul>
                            <c:forEach items="${todos}" var= "todo">
                               <li><a href="${todo.linkEducation}">${todo.desc}</a></li>
                            </c:forEach>
                           </ul>
                    </div>
                    <div class="col-lg-2 col-md-4"></div>
                    <div class="col-lg-2 col-md-4"></div>
                    <div class="col-lg-2 col-md-4"></div>
                    <div class="col-lg-2 col-md-4" id="user"><a href="/user">${name}</a></div>
            </ul>
        </div>
    </nav>

     <h1>Вашите обучения</h1>
        <div class="container">

        <table class="table">

            <thead>
                <tr>
                    <th>Обучение</th>
                    <th>Краен срок</th>
                    <th>Промяна</th>
                    <th>Изтриване</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${todos}" var= "todo">
                            <tr>
                                <td>${todo.desc}</td>
                                <td><fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy"/></td>
                                <td><a type="button" class="btn btn-warning" href="/update-education?id=${todo.id}">Update</a></td>
                                <td><a type="button" class="btn btn-danger" href="/delete-education?id=${todo.id}">Delete</a></td>
                            </tr>
                </c:forEach>
            </tbody>
        </table>

     <br/>


     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </div>
    <a id="add" href="/add-education">Добавяне на курс</a>

    </body>
        <footer>
            <h5>
                <a href="/information">Информация за нас</a>
            </h5>
        </footer>
    </html>