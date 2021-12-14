<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
        position: fixed;
        margin-top: -80px;
    	background-color: black;
      width:1920px;


    	}



    #user {
        color: white;
        float: right;
    }

        li>a {
            text-decoration: none;
    	    color: white;
        }
    	li{

    	    text-transform: uppercase;
    	    font-size: 25px;
    	    display: inline-block;
    	    padding: 10px;
    	}

        li:hover {
            background-color: rgb(46, 46, 46);
            color: orange;
        }

    	li>a:hover {

            text-decoration: none;

    	    color: orange;
    	}

    #first {
        background-color: darkgreen;
        width: 400px;
        color: white;
        text-transform: uppercase;
        padding: 5px;
    }
    #second {
        background-color: darkgreen;
        width: 1050px;
        color: white;
        text-transform: uppercase;
        padding-left: 300px;
    }

    h1 {
        font-family: Gabriola;
        text-align: center;
        margin-top: 80px;
        margin-bottom: 50px;
        font-weight: bold;
        font-size: 50px;
        padding: 30px;;
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
</style>
<body>
    <nav role="navigation">
                <ul>
                    <li><a href="/learn">Друг потребител</a></li>
                    <li><a href="/list-todos">Обучения на ${name}</a></li>
                    <li><a href="/design-patterns">Design Patterns</a></li>

                    <li><a href="http://abv.bg">HTML</a></li>
                    <li><a href="http://abv.bg">CSS</a></li>
                    <li><a href="http://abv.bg">Excel</a></li>
                    <li><a href="http://abv.bg">Друго</a></li>
                    <li><a href="http://abv.bg">Друго</a></li>
                    <li id="user">${name}</li>
                </ul>
        </nav>
             <h1>Добавяне на обучение</h1>
    <div class="container">
        <form:form method="post" commandName="todo">
            <hidden path="id"/>
            <fieldset class="form-group">
                <label path="desc">Description</label>
                <input name="desc" type="text" class="form-control" required="required" minlength="8" maxlength="15"/>

                <form:errors name="desc" cssClass="text-warning"/>

                <label path="targetDate">Target Date</label>
                <input name="targetDate" type="text" class="form-control" required="required"/>
                <form:errors path="targetDate" cssClass="text-warning"/>

            </fieldset>
            <button type="submit" class="btn btn-success">Add</button>
        </form:form>
    </div>

 <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
 <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
 <script>
 $('#targetDate').datepicker({
 format : "dd/mm/yyyy"
 });
 </script>


</body>
</html>