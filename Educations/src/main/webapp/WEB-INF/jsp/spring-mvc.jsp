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
	text-align:justify;
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

h3 {
    font-size: 25px;
    font-family: Gabriola;
    padding: 10px;
    font-weight: bold;
    text-align: center;
}

h4 {
    font-family: Gabriola;
    padding: 30px;
    font-weight: bold;
    padding-left: 50px;
}

p {
    text-align: justify;
    padding-left: 150px;
    padding-right: 150px;
}

/* ------------------- START FOOTER ------------------- */

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color: black;
    	font-size: 25px;
        margin-top: 250px;
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
                    <div class="col-lg-2 col-md-4"><i id="icons" class="fas fa-clock"></i><br>
                        <div class="container-day">
                            <b class="day">Т</b> дни
                            <b class="hour">Т</b>ч :
                            <b class="minute">Т</b>м :
                            <b class="second">Т</b>с
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4" align="center"><i id="icons" class="fas fa-calendar"></i><br><fmt:formatDate value="${targetDate}" pattern="dd/MM/yyyy"/></div>
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/mail';" style="cursor: pointer"><i id="icons" class="fas fa-at"></i><br>Пишете ни</div>
                    <div class="col-lg-2 col-md-4" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
            </div>
        </div>
    </nav>

    <h1>Spring MVC</h1>

        <p>
            &diams;&emsp;Model-View-Controller (MVC) е архитектурен модел за изграждане на потребителски интерфейси. Той разделя дадено софтуерно приложение на три взаимносвързани части, така че да се отделят вътрешни представяния на информация от начините, по които информацията се представя на потребителя/или от страна на потребителя: контролери, изгледи, модели. Както и при други софтуерни модели, MVC изразява „core of the solution“ на проблем, докато позволява да бъде адаптиран за всяка система. Специфични MVC архитектури могат да се различават значително.
        </p>
        <p>
            &diams;&emsp;Елементи: Централният елемент на MVC – The model моделът, улавя поведението на приложението по отношение на своя домейн, независимо от потребителския интерфейс. Моделът директно управлява данните, логиката и правилата на приложението. The view изгледът може да бъде всеки изход за представяне на информация, например чрез графика или диаграма; множество изгледи към една и съща информация са възможни, като стълбчета за управление и табличен изглед за счетоводители.
        </p>
        <p>
            &diams;&emsp;Третата част Controller контролера, приема входа от потребителя и го конвертира в команди за модела или изгледа.
        </p>
        <p>
            &diams;&emsp;Взаимодействия: В допълнение за разделяне на приложението на трите вида елементи, дизайн на model–view–controller определя взаимодействието между тях. The Controller – Контролерът може да изпраща команди към модела за актуализиране състоянието на модела (например, редактирането на документ). Той също може да изпраща команди към свързаната с изгледа част, за да се промени представянето на модела (например, чрез скролиране на документа).
        </p>
        <p>
            &diams;&emsp;The model – Моделът уведомява свързаните части с изгледа и контролера, когато е налице промяна в състоянието му. Това уведомяване позволява на изгледа да изведе на изхода актуалната информация и контролера да променя разположението на наборите от команди.
        </p>
        <p>
            &diams;&emsp;The view – Изгледа изисква информация от модела, който използва, за да се генерира изходната информация за представяне на потребителя.
        </p>
        <p>
            &diams;&emsp;Използване в уеб приложения: Въпреки че първоначално е разработен за настолните компютри Model-View-Controller е широко приет като архитектура за World Wide Web приложения в голяма част от езици за програмиране. Няколко търговски и нетърговски уеб приложения са създадени, които прилагат тази схемата. Тези приложения се различават по своите интерпретации, основно в начина, по който отговорностите им Model-View-Controller са разделени между клиента и сървъра.
        </p>
        <p>
            &diams;&emsp;По рано уеб MVC рамките поведоха с подход, който оставя почти цялата логика модел, изглед и контролер на сървъра. При този подход, клиентът изпраща или хипервръзки искания или форма вход към контролера и след това получава пълна и актуализирана уеб страница (или друг документ) от гледката; The model – модела съществува изцяло на сървъра.
        </p>
        <p>
            &diams;&emsp;Като клиентски технологии са създадени, рамки като AngularJS and Ember.js, JavaScriptMVC and Backbone са създадени за да позволят на елементите на MVC да изпълняват частично на машината на клиента.
        </p>

    <h4>Източници</h4>
    <p>https://bg.wikipedia.org<br>
       </p>


     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>


        <script>
            const countdown = () => {
                // Specify the date and time we are counting down to.

                const countDate = new Date("${targetDate}").getTime();
                const now = new Date().getTime();
                const remainingTime = countDate - now;

                const second = 1000;
                const minute = second * 60;
                const hour = minute * 60;
                const day = hour * 24;

                const textDay = Math.floor(remainingTime / day);
                const textHour = Math.floor((remainingTime % day) / hour);
                const textMinute = Math.floor((remainingTime % hour) / minute);
                const textSecond = Math.floor((remainingTime % minute) / second);

                document.querySelector(".day").innerText = textDay > 0 ? textDay : 0;
                document.querySelector(".hour").innerText = textHour > 0 ? textHour : 0;
                document.querySelector(".minute").innerText = textMinute > 0 ? textMinute : 0;
                document.querySelector(".second").innerText = textSecond > 0 ? textSecond : 0;
              };

              // should use 500 as setInterval won't always run on time.
              setInterval(countdown, 500);
        </script>

</body>
    <footer>
        <h5>
            <a href="/information">Информация за нас</a>
        </h5>
    </footer>
</html>