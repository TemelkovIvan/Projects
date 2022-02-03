<%@ page pageEncoding="UTF-8" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Education</title>
        <link href="books.ico" rel="shortcut icon" type="ico">
        <link rel="stylesheet" href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
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

    h2 {
        font-family: Gabriola;
        color: black;
        text-align: center;
        margin-top: 5px;
        margin-bottom: 5px;
        font-weight: bold;
        font-size: 35px;
        padding: 30px;
        text-transform: uppercase;
    }

    p {
        padding-left: 30%;
        padding-top: 10px;
        padding-bottom: 20px;
        text-align: center;
        width: 70%;
    }

    #add {
        color: gray;
        font-family: Gabriola;
        font-weight: bold;
        font-size: 30px;
        padding-left: 45%;
    }

    #add:hover {
        color: orange;
        text-decoration: none;
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
        <div>
            <form method="post">

                    <h1>Проект</h1>

                    <h2>
                        Влезте с Вашият акаунт
                    </h2>
                <p>
                    <label>Потребителско име</label>
                    <input type="text" name="name" class="form-control" id="exampleFormControlInput1">
                </p>
                <p>
                    <label>Парола</label>
                    <input type="password" name="password" class="form-control" id="exampleFormControlInput1">
                    <br>
                    <font color="red">${errorMessage}</font>
                </p>
                <p>
                <p>
                    <input type="submit" class="btn btn-secondary" value="Вход"/>
                </p>

                </p>

                <a id="add" href="/new-user">Добавяне на нов Акаунт</a>
            </form>

        </div>

    </body>
    <footer>
        <h5>
            <a href="/info">Информация за нас</a>
        </h5>
    </footer>
    </html>