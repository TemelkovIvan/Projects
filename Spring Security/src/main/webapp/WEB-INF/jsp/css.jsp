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

    @media (max-width:980px){
        nav{
            position: relative;
        }

        div:hover > ul {
            display: none;
        }
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

#first {
    text-align:center;
    background-color: black;
    width: 5%;
    color: white;
    text-transform: uppercase;
    padding: 5px;
}
#second {
    text-align:center;
    background-color: black;
    width: 300px;
    color: white;
    text-transform: uppercase;
}
#third {
    text-align:center;
    background-color: black;
    width: 950px;
    color: white;
    text-transform: uppercase;
    padding: 5px;
}

#third3 {
    text-align:center;
    background-color: black;
    width: 50%;
    color: white;
    text-transform: uppercase;
    padding: 5px;
}
#fourth {
    text-align:center;
    background-color: black;
    width: auto;
    color: white;
    text-transform: uppercase;
    padding: 5px;
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

h3 {
    font-size: 25px;
    font-family: Gabriola;
    padding: 30px 0 10px 0;
    font-weight: bold;
    padding-left: 300px;
}

h4 {
    font-family: Gabriola;
    padding: 10px;
    font-weight: bold;
    padding-left: 50px;
}

table {
    color: #333333;
    border-spacing: 0;
    margin: 30px;
}


    tr:nth-child(even) td {
        background-color: whitesmoke;
    }

    tr:nth-child(odd) td {
        background-color: gray;
    }

p {
    padding-left: 100px;
    padding-right: 100px;
}

/* ------------------- START FOOTER ------------------- */

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color: black;
    	font-size: 25px;
        margin-top: 60px;
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
                    <div class="col-lg-2 col-md-4" align="center"><i id="icons" class="fas fa-clock"></i><br>
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

    <h1>CSS</h1>

        <p>
            &diams;&emsp;CSS (Cascading Style Sheets) е език за описание на стилове (език за стилови листове, style sheet language) – използва се основно за описване на представянето на документ, написан на език за маркиране. Най-често се използва заедно с HTML, но може да се приложи върху произволен XML документ. Официално спецификацията на CSS се поддържа от W3C.
        </p>
        <p>
            &diams;&emsp;CSS е създаден с цел да бъдат разделени съдържанието и структурата на уеб страниците отделно от тяхното визуално представяне. Преди стандартите за CSS, установени от W3C през 1995 г., съдържанието на сайтовете и стила на техния дизайн са писани в една и съща HTML страницата. В резултат на това HTML кодът се превръща в сложен и нечетлив, а всяка промяна в проекта на даден сайт изисквала корекцията да бъде нанасяна в целия сайт страница по страница. Използвайки CSS, настройките за форматиране могат да бъдат поставени в един-единствен файл и тогава промяната ще бъде отразена едновременно на всички страници, които използват този CSS файл.
        </p>

        <h3>Списък на основните свойства, използвани при CSS</h3>
        <table id="table1">
            <tr id="first-row">
                <td id="first">Свойство</td>
                <td id="second">Значение</td>
                <td id="third">Възможна стойност</td>
                <td id="fourth">Пример</td>
            </tr>
            <tr>
                <td>color</td>
                <td>Цвят на текста</td>
                <td>Едно от 16-те имена на цветовете, дефинирани в HTML 4.0: aqua, black, blue, fuchsia, gray, green, lime, maroon, navy, olive, purple, red, silver, teal, white, yellow.
                Цвят в RGB формат: color:rgb (R,G,B)</td>
                <td>color:blue<br>
                    color:rgb(255,255,255)<br>
                    color:rgb(0,0,0)</td>
            </tr>

            <tr>
                <td>background-color</td>
                <td>Цвят на фона</td>
                <td>Същите стойности, както при color</td>
                <td>background-color:black</td>
            </tr>
            <tr>
                <td>text-align</td>
                <td>Подравняване на текста</td>
                <td>left, right, center, justify</td>
                <td>text-align:center</td>
            </tr>
            <tr>
                <td>font-style</td>
                <td>Стил на шрифт</td>
                <td>normal, italic, oblique</td>
                <td>font-style:italic</td>
            </tr>
            <tr>
                <td>font-weight</td>
                <td>Дебелина на текста</td>
                <td>normal, lighter, bold, bolder</td>
                <td>font-weight:bold</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>font-size</td>
                <td>Размер на текста</td>
                <td>Стойности в пиксели, ем, процент или име: large, small, x-small, x-large</td>
                <td>font-size:110 %<br>
                    font-size:0.8em<br>
                    font-size:20px<br>
                    font-size:x-large</td>
            </tr>
            <tr>
                <td>font-family</td>
                <td>Шрифт</td>
                <td>serif, sans-serif, cursive, fantasy, monospace, Arial, Courier, „Times New Roman“</td>
                <td>font-family:sans-serif<br>
                    font-family:"Times New Roman"</td>
            </tr>
            <tr>
                <td>list-style-type</td>
                <td>Водещ знак пред ред на списък</td>
                <td>decimal, upper-alpha, lower-alpha, upper-roman, lower-rman</td>
                <td>	list-style-type:square<br>
                    list-style-type:lower-roman</td>
            </tr>
            <tr>
                <td>width</td>
                <td>Ширина на елемент (напр.таблица)</td>
                <td>Процент от ширината на страницата</td>
                <td>width:50%</td>
            </tr>
            <tr>
                <td>border</td>
                <td>Рамка на таблица</td>
                <td>Дебелина в пиксели и тип на рамката: solid, dotted, dashed, double, groove</td>
                <td>border:3px solid</td>
            </tr>
            <tr>
                <td>margin</td>
                <td>Разстояние от всички страни на елемента</td>
                <td>auto</td>
                <td>margin:auto</td>
            </tr>
            <tr>
                <td>margin-left</td>
                <td>Разстояние от лявата страна на елемента</td>
                <td>Стойности в ем</td>
                <td>margin-left:1em</td>
            </tr>
            <tr>
                <td>margin-right</td>
                <td>Разстояние от дясната страна на елемента</td>
                <td>Стойности в ем</td>
                <td>margin-right:3em</td>
            </tr>
            <tr>
                <td>margin-top</td>
                <td>Разстояние от горната страна на елемента</td>
                <td>Стойности в ем</td>
                <td>margin-top:5em</td>
            </tr>
            <tr>
                <td>margin-bottom</td>
                <td>Разстояние от долната страна на елемента</td>
                <td>Стойности в ем</td>
                <td>margin-bottom:2em</td>
            </tr>
            <tr>
                <td>border-collapse</td>
                <td>Вид рамка на таблица</td>
                <td>collapse</td>
                <td>border-collapse:collapse</td>
            </tr>
            <tr>
                <td>link</td>
                <td>Псевдокласове на елементна котва</td>
                <td>a:link</td>
                <td>a:link{color:black}</td>
            </tr>
            <tr>
                <td>visited</td>
                <td></td>
                <td>a:visited</td>
                <td></td>
            </tr>
            <tr>
                <td>hover</td>
                <td></td>
                <td>a:hover</td>
                <td></td>
            </tr>
            <tr>
                <td>active</td>
                <td></td>
                <td>a:active</td>
                <td></td>
            </tr>
            <tr>
                <td>float</td>
                <td>Относително местоположение на страницата</td>
                <td>left, right</td>
                <td>float:left;</td>
            </tr>
            <tr>
                <td>clear</td>
                <td>Забрана за заобикаляне на елементи отляво или отдясно</td>
                <td>left, right, both</td>
                <td>clear:both</td>
            </tr>

        </table>

        <h3>Всички видове стойности в CSS</h3>
        <table id="table2">
            <tr id="first-row">
                <td id="first">Синтаксис</td>
                <td id="second">Пример</td>
                <td id="third3">Допълнителна информация</td>
            </tr>
            <tr>
                <td>px</td>
                <td>font-size:9px</td>
                <td>Точно определяне на размера. Не е препоръчително при използването му в border-radius или други свойства от този тип.</td>
            </tr>
            <tr>
                <td>em</td>
                <td>font-size:16px; line-height:1.5em /*24px/16*/</td>
                <td>Определяне на размера спрямо размера на шрифта на бащиния елемент. Когато шрифта има размер 16px и се приеме за 1em, тогава размера на всеки останал елемент който се определя чрез em се умножава по стойността си. Пример: при размер на шрифта 10px, 1em = 10px; 2em = 20px. Това е най – добрата модерна техника за определяне на размери, поради запазването на съотношението между елементите.Em стойността е и приета за W3C стандарт</td>
            </tr>
            <tr>
                <td>%</td>
                <td>font-size:100%</td>
                <td>Използва се при сайтовете с подвижен строеж Пример: при промяната на ширината на екрана, елемента се намира на х% от съседния елемент (margin-left:10%;)</td>
            </tr>
            <tr>
                <td>in</td>
                <td>font-size:0,09in</td>
                <td>Мерната единица инч</td>
            </tr>
            <tr>
                <td>cm</td>
                <td>font-size:0.3cm</td>
                <td>Мерната единица сантиметър</td>
            </tr>
            <tr>
                <td>mm</td>
                <td>font-size:8mm</td>
                <td>Мерната единица милиметър</td>
            </tr>
            <tr>
                <td>ex</td>
                <td>font-size:16px; line-height:3ex</td>
                <td>X-височината на шрифта. (Х-височината е приблизително половината от шрифта)</td>
            </tr>
            <tr>
                <td>pt</td>
                <td>font-size:16pt;</td>
                <td>1pt = 1/72in (1/72 инча) = 0,0138888889 инча</td>
            </tr>
            <tr>
                <td>pc</td>
                <td>font-size:16pc;</td>
                <td>Пика. 1pc = 12 points</td>
            </tr>


        </table>
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