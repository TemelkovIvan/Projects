<%@ page pageEncoding="UTF-8" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Education</title>
        <link href="books.ico" rel="shortcut icon" type="ico">
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

    div {
        padding: 50px;
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
        padding-top: 50px;
        font-size: 45px;
        font-family: Gabriola;
        font-weight: bold;
        text-align: center;
        padding-bottom: 50px;
    }

    a {
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

    ul {
        padding-left: 33%;
    }

    </style>
    <body>
        <div>
            <a id="add" href="/learn">Начало</a>

            <h3>Прoектът е изработен от <br> Иван Георгиев Темелков</h3>

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
                <ul>
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
                </ul>
            </p>
        </div>

    </body>

    </html>