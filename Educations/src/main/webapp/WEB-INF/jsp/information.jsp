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

    nav{
    	position: sticky;
        top: 0;
    }

 	div .row{
 	    text-transform: uppercase;
 	    color: white;
 	    font-size: 22px;
 	    padding: 2px;
 	}

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

    div a {
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

    ol {
        padding-left: 33%;
    }

/* ------------------- START FOOTER ------------------- */

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color: black;
    	font-size: 25px;
        margin-top: 70px;
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
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/learn';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/list-educations';" style="cursor: pointer;"><i id="icons" class="fas fa-book"></i><br>Обучения на ${name}
                           <ul>
                            <c:forEach items="${todos}" var= "todo">
                               <li><a href="${todo.linkEducation}">${todo.desc}</a></li>
                            </c:forEach>
                           </ul>
                    </div>
                    <div class="col-lg-2 col-md-4"></div>
                    <div class="col-lg-2 col-md-4"></div>
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/mail';" style="cursor: pointer"><i id="icons" class="fas fa-at"></i><br>Пишете ни</div>
                    <div class="col-lg-2 col-md-4" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
            </div>
        </div>
    </nav>

    <h1>"${name}"</h1>

        <div>

            <h3>Прoектът е изработен от Иван Георгиев Темелков</h3>

            <p>телефон: 0877766276</p>
            <p>e-mail: ivan_temelkow@abv.bg</p>
            <p><a href="https://github.com/TemelkovIvan">GitHub</a></p>
            <p><a href="http://linkedin.com/in/ivan-temelkov-101988110">Linkedin</a></p>
            <br>
            <br>
            <br>
            <p>Иван изучава светът на JAVA</p>
            <p>Това е първият му проект със Spring Boot</p>
            <p>Има огромно желание да работи като Разработчик</p>
            <br>
            <p>Проектът има следните функционалности:
                <ol>
                    <li>&diams;&emsp;Регистрация на нов потребител, като се изпраща на посочен e-mail поздрав с успешна регистрация</li>
                    <li>&diams;&emsp;Не е възможно да се направи регистрация без да бъдат въведени потребител, парола, потвърждение на парола, e-mail, години</li>
                    <li>&diams;&emsp;Не е възможно да се направи регистрация при въведени потребител и парола с празен символ</li>
                    <li>&diams;&emsp;Паролите са кодирани чрез sha256Hex</li>
                    <li>&diams;&emsp;За вход се изисква оторизация с Потребителско име и парола, които се проверяват в база данни</li>
                    <li>&diams;&emsp;Менюто се променя според разделителната способност на екрана на потребителят</li>
                    <li>&diams;&emsp;Възможност за изпращане на e-mail от регистриран потребител към <a href="/mail">noreply.sprboot@gmail.com</a></li>
                    <li>&diams;&emsp;Всеки потребител има възможност да промени паролата си, годините си и e-mail</li>
                    <li>&diams;&emsp;Всеки потребител има уникален списък с обучения</li>
                    <li>&diams;&emsp;Всеки потребител има възможност да управлява списъкът си с обучения - да добавя, променя или изтрива</li>
                    <li>&diams;&emsp;За добавяне или промяна на обучение има календар за улеснение избора на дата</li>
                    <li>&diams;&emsp;Потребител с администраторски права има възможност да вижда списък с всички регистрирани потребители</li>
                    <li>&diams;&emsp;Потребител с администраторски права има възможност да вижда списък с вписвания на конкретен потребител или всички потребители</li>
                    <li>&diams;&emsp;За проектите, които има създадени страници - в менюто се визуализира краен срок и оставащо време до този срок</li>
                    <li>&diams;&emsp;В проект JQuery визията е различна за да се покажат възможности на JQuery</li>
                </ol>
            </p>
        </div>
     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
        <footer>
            <h5>
                <a href="/information">Информация за нас</a>
            </h5>
        </footer>
    </html>