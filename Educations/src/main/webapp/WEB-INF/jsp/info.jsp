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
    body {
        background-color: gray;
    }

    h3 {
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
        color: white;
        font-size: 25px;
        padding-left: 600px;
    }

    div {
        padding:50px;
        background-color:rgb(93, 75, 99);
        border-radius: 52%;
        box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
        margin-top: 30px;
    }

    #add {
        text-align: center;
        text-decoration: none;
        color: white;
        text-transform: uppercase;
        margin-left:44%;
    }

    #add:hover {
        color: orange;
    }

    </style>
    <body>
        <div>
            <a id="add" href="/learn">Начало</a>

            <h3>Прoектът е изработен от <br> Иван Георгиев Темелков</h3>

            <p>гр. София, ж.к. Дружба</p>
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
        </div>

    </body>

    </html>