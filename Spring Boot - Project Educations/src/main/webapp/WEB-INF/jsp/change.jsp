<%@ page pageEncoding="UTF-8" %>

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

    label {
        color: black;
    }

    .form-control {
        max-height: 200px;
    }

    #back {
        text-align: center;
        text-decoration: none;
        color: #A3A3A3;
        text-transform: uppercase;
    }

    #back:hover {
        color: orange;
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
                <form method="post">

                    <h1>Промяна на данни за съществуващ акаунт</h1>


                <p>
                    <label>Име</label>
                    <input type="text" name="name" class="form-control" id="exampleFormControlInput1" value=${name} readonly>
                </p>

                <p>
                    <label>Нова Парола</label>
                    <input type="password" name="password" class="form-control" id="exampleFormControlInput1"/>
                </p>
                <p>
                    <label>Повторете Новата Парола</label>
                    <input type="password" name="confirmPassword" class="form-control" id="exampleFormControlInput1"/>
                    <br>
                    <font color="red">${errorMessage}</font>
                </p>
                <p>
                    <label>E-mail</label>
                    <input type="email" name="email" class="form-control" id="exampleFormControlInput1" value=${email}>
                </p>
                <p>
                    <label>Години</label>
                    <input type="number" name="age" class="form-control" id="exampleFormControlInput1" value=${age}>
                </p>
                <p>
                    <input type="submit" class="btn btn-secondary" value="Промени"/>
                </p>

                <p>
                    <input type="reset" class="btn btn-dark" value="Изчисти">
                </p>

                <p>
                <a id="back" href="/user">Отказ</a>
                </p>

                </form>
            </div>
    </body>
        <footer>
            <h5>
                <a href="/information">Информация за нас</a>
            </h5>
        </footer>
    </html>