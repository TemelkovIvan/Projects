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
        background-color: gray;
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
        color: white;
    text-transform: uppercase;
    }

    h3 {
        font-size: 30px;
        text-align: center;
        color:orange;
    }

    p {
        color: white;
        text-align: center;
    }

    #commentar {
        color:green;
        text-align: center;
    }
    div {

        padding:10px;
        padding-bottom: 50px;
        background-color:rgb(93, 75, 99);
        border-radius: 52%;
        box-shadow: 10px 11px 35px -14px rgba(0,0,0,0.76);
        margin: 20px;
        margin-top: 50px;
    }

    p {
        font-size: 20px;
        padding:80px;
        background-color:rgb(93, 75, 99);
        border-radius: 52%;
        box-shadow: 10px 11px 35px -14px rgba(0,0,0,0.76);
        margin: 20px;
        margin-top: 50px;
    }

    p:hover {
        background-color:rgb(99, 89, 75);
    }

    p>a {
        text-decoration: none;
        color: white;
        text-transform: uppercase;
        font-size: 40px;
    }


    p>a:hover {
        text-decoration: none;
        color:greenyellow;
    }

</style>
</head>

<body>
    <div>
    <h1>Здравейте, ${name}!!!</h1>

    <h3>Добре дошли!</h3>
</div>
        <p>
            <a href="/list-todos">&#62;&#62; Обучения &#60;&#60;</a>
        </p>
        <p>
        "Най-доброто образование в света е да гледаш майстора по време на работа"
        </p>

</body>
</html>