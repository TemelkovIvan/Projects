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
        margin-top: 25px;
        margin-bottom: 25px;
        font-weight: bold;
        font-size: 50px;
        padding: 30px;
        text-transform: uppercase;
    }

p {
    padding-left: 30%;
    padding-top: 20px;
    text-align: center;
    width: 70%;
}

    .form-control {
        max-height: 200px;
    }

/* ------------------- START FOOTER ------------------- */

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color: black;
    	font-size: 25px;
        margin-top: 290px;
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

           <div>
                <h1>Пишете ни</h1>

                <form:form method="post">
                    <p>
                      <label>Вашият email адрес</label>
                      <input type="email" name="email" class="form-control" id="exampleFormControlInput1" value=${email} readonly>
                    </p>
                    <p>
                      <label>Съобщение</label>
                      <textarea class="form-control" name="textarea" id="exampleFormControlTextarea1" rows="4" minlength="10" maxlength="500"></textarea>
                      <font color="red">${errorMessage}</font>
                    </p>

                    <p>
                        <input type="submit" class="btn btn-secondary" value="Изпрати"/>
                    </p>

                    <p>
                        <a type="button" class="btn btn-dark" href="/list-educations" >Отказ</a>
                    </p>

                </form:form>
            </div>

    </body>
    <footer>
        <h5>
            <a href="/info">Информация за нас</a>
        </h5>
    </footer>
    </html>