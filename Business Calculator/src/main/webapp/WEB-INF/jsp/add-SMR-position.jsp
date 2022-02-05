<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

    .form-group{
        color: black;
        text-align: center;
    }

    input:invalid+span:after {
        color: red;
        content: '✖ грешно!';
        padding-left: 5px;
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
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/home';" style="cursor: pointer;"><i id="icons" class="fas fa-home"></i><br>Начало</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/calculator';" style="cursor: pointer;"><i id="icons" class="fas fa-calculator"></i><br>Нов Калкулатор</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/search';" style="cursor: pointer;"><i id="icons" class="fas fa-search"></i><br>Търсене</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/mail';" style="cursor: pointer"><i id="icons" class="fas fa-at"></i><br>Пишете ни</div>
                        <div class="col-lg-2 col-md-4" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
                </div>
            </div>
        </nav>

             <h1>Добавяне на СМР</h1>
    <div class="container">
        <form:form method="post" commandName="smr">
            <hidden path="id"/>
            <fieldset class="form-group">
                <label name="position">Позиция по договор</label>
                <input name="position" type="number" id="position" class="form-control" required="required" placeholder="Позиция по договор" minlength="10" maxlength="20" />

                <label path="action">Дейност</label>
                <input name="action" type="text" id="action" class="form-control" required="required" placeholder="Дейност" minlength="3" maxlength="30" />

                <label path="descr">Описание</label>
                <input name="descr" type="text" id="descr" class="form-control" required="required" placeholder="Описание" minlength="3" maxlength="30" />

                <label path="price_contract_1">Позиция по договор A</label>
                <input name="price_contract_1" type="number" id="price_contract_1" class="form-control" required="required" value="0" step="0.01" min="0" max="10000" /><span class="validity">

                <label path="price_contract_2">Позиция по договор B</label>
                <input name="price_contract_2" type="number" id="price_contract_2" class="form-control" required="required" value="0" step="0.01" min="0" max="10000" /><span class="validity">

                <label path="price_contract_3">Позиция по договор C</label>
                <input name="price_contract_3" type="number" id="price_contract_3" class="form-control" required="required" value="0" step="0.01" min="0" max="10000" /><span class="validity">

                <label path="price_contract_4">Позиция по договор D</label>
                <input name="price_contract_4" type="number" id="price_contract_4" class="form-control" required="required" value="0" step="0.01" min="0" max="10000" /><span class="validity">

                <label path="price_contract_5">Позиция по договор E</label>
                <input name="price_contract_5" type="number" id="price_contract_5" class="form-control" required="required" value="0" step="0.01" min="0" max="10000" /><span class="validity">

                <label path="type">Тип</label>
                <input name="type" type="text" id="type" class="form-control" required="required" placeholder="Тип" minlength="1" maxlength="5" />

            </fieldset>

            <button type="submit" class="btn btn-secondary">Готово</button>
            <a type="button" class="btn btn-dark" href="/list-smr">Отказ</a>

        </form:form>
    </div>

 <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
 <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>