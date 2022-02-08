<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<meta charset="UTF-8">
<title>Education</title>
<link href="books.ico" rel="shortcut icon" type="ico">
 <link rel="stylesheet" href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
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

/* ------------------- NAVBAR ------------------- */

    h1 {
        font-family: Gabriola;
        color: black;
        text-align: center;
        margin-top: 25px 0 25px 0;
        font-weight: bold;
        font-size: 50px;
        padding: 60px;
        text-transform: uppercase;
    }

    table {
        border-spacing: 0;
        margin-left: auto;
        border: 2px solid black;
    }

    tr:nth-child(even) td {
        background-color: whitesmoke;
    }

    tr:nth-child(odd) td {
        background-color: gray;
    }

</style>
<body>
<nav role="navigation">
        <div class="container-fluid">
            <div class="row">
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/login';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/list-educations';" style="cursor: pointer;"><i id="icons" class="fas fa-book"></i><br>Обучения на ${name}
                    </div>
                    <div class="col-lg-2 col-md-4"></div>
                    <div class="col-lg-2 col-md-4"></div>
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/mail';" style="cursor: pointer"><i id="icons" class="fas fa-at"></i><br>Пишете ни</div>
                    <div class="col-lg-2 col-md-4" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
            </div>
        </div>
    </nav>
             <h1>Добавяне на обучение</h1>
    <div class="container">
        <form:form method="post" commandName="todo">
            <hidden path="id"/>
            <fieldset class="form-group">
                <label path="desc">Обучение</label>
                <input name="desc" type="text" class="form-control" required="required" placeholder="Ново обучение" minlength="10" maxlength="20" />

                <form:errors name="desc" cssClass="text-warning"/>

                <label path="targetDate">Краен срок</label>
                <input name="targetDate" type="text" id="targetDate" class="form-control" required="required" placeholder="дата"/>
                <form:errors path="targetDate" cssClass="text-warning"/>

            </fieldset>

            <button type="submit" class="btn btn-secondary">Готово</button>
            <a type="button" class="btn btn-dark" href="/list-educations">Отказ</a>

        </form:form>
    </div>

 <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
 <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="webjars/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>

 <script>
 $('#targetDate').datepicker({
  format : 'dd/mm/yyyy'
 });
 </script>


</body>
</html>