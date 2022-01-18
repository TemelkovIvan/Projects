<%@ page pageEncoding="UTF-8" %>

<html>
<head>
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

    ul {
        padding-top: 180px;
        color: burlywood;
        list-style: none;
    }

    h1 {
        font-size: 35px;
        margin: 50px;
        text-align: center;
        text-transform: uppercase;
    }

    h3 {
        font-size: 30px;
        text-align: center;
    }

    p {
        text-align: center;
    }

    #commentar {
        color:green;
        text-align: center;
    }
    div {

        padding:10px;
        padding-bottom: 50px;
        margin: 20px;
        margin-top: 50px;
    }

    p {
        font-size: 20px;
        padding:80px;
        margin: 20px;
        margin-top: 50px;
    }


    p>a {
        text-decoration: none;
        text-transform: uppercase;
        font-size: 40px;
    }


    p>a:hover {
        text-decoration: none;
        color:orange;
    }

    a {
        text-decoration: none;
        color: blue;
    }

/* ------------------- START FOOTER ------------------- */

    footer {
          position: absolute;
          bottom: 10px;
          margin 0;
          padding: 10px 0 10px 0;
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
</head>

<body>
    <div>
        <h1>Здравейте, <a href="/user">${name}</a>!!!</h1>

        <h3>Добре дошли!</h3>
    </div>
        <p>
            <a href="/list-educations">&#62;&#62; Обучения &#60;&#60;</a>
        </p>
        <p>
        "Най-доброто образование в света е да гледаш майстора по време на работа"
        </p>

</body>
    <footer>
        <h5>
            <a href="/information">Информация за нас</a>
        </h5>
    </footer>
</html>