<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

    @media (max-width:980px){
        nav{
            position: relative;
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
        padding: 20px;
        font-weight: bold;
        padding-left: 300px;
    }

    h4 {
        font-family: Gabriola;
        padding: 50px 0 0 50px;
        font-weight: bold;
        color: black;
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

    p {
        color: black;
        padding-left: 100px;
        padding-right: 100px;
    }

    #example {
        color: #336600;
        padding: 20px;
        padding-left: 200px;
    }

    img {
        padding-left: 200px;
        float: right;
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

    <h1>HTML</h1>

        <p>
            &diams;&emsp;HTML (съкращение от термина на английски: HyperText Markup Language, произнасяно най-често като „ейч-ти-ем-ел“, в превод „език за маркиране на хипертекст“) е основният маркиращ език за описание и дизайн на уеб страници. HTML е стандарт в Интернет, а правилата се определят от международния консорциум W3C. Текущата версия на стандарта е HTML 5.0 (от 28 октомври 2014 г.)
        </p>

        <p>
            &diams;&emsp;Описанието на документа става чрез специални елементи, наречени HTML елементи или маркери, които се състоят от етикети или тагове (HTML tags) и ъглови скоби (като например елемента <html>). HTML елементите са основната градивна единица на уеб страниците. Чрез тях се оформят отделните части от текста на една уеб страница, като заглавия, цитати, раздели, хипертекстови препратки и т.н. Най-често HTML елементите са групирани по двойки &lt;h1&gt; и &lt;/h1&gt;.
        </p>

    <h3>&lt;html&gt; елемент</h3>
        <p>Указва на браузъра, че това е HTML документ. Отбелязва началото и края на документа и съдържа всички други негови елементи (с изключение на <!DOCTYPE> елемента).
    </p>

    <p>
        <img src="HTML5_logo.png" alt="This is an image" />
        <br>
    </p>


    <p id="example">
        <br>&lt;html&gt;<br>
        ...<br>
        &lt;/html&gt;
    </p>

    <h3>&lt;head&gt; елемент</h3>
        <p>Съдържа заглавието на документа, и може да съдържа стилове, скриптове, енкодинг и т.н.</p>
        <p id="example">
            <br>&lt;html&gt
            <br>&lt;head&gt
            <br>&lt;title>Заглавие на документа&lt;/title&gt
            <br>&lt;/head&gt
            <br>...
            <br>&lt;/html&gt
        </p>

    <h3>&lt;body&gt; елемент</h3>
        <p>Съдържа форматиране видимо за потребителя – текст, хиперлинк, картинки, таблици, бутони, параграфи и т.н.</p>
        <p id="example">
            <br>&lt;html&gt
            <br>&lt;head&gt
            <br>&lt;title>Заглавие на документа&lt;/title&gt
            <br>&lt;/head&gt
            <br>&lt;body&gt
            <br>Съдържание на документа...
            <br>&lt;/body&gt
            <br>&lt;/html&gt
        </p>

    <h3>&lt;!DOCTYPE&gt; елемент</h3>
        <p>Декларира се първи, още преди &lt;html&gt; тага. Валидира документа. &lt;!DOCTYPE&gt; не е HTML таг. Той е инструкция за уеб браузъра – указва HTML версията, на която е написана страницата</p>
        <p id="example">
            &lt;!DOCTYPE html&gt
            <br>&lt;html&gt;
            <br>...
            <br>&lt;/html&gt;
        </p>

    <h3>Основни HTML тагове</h3>
        <p>&lt;b&gt или &lt;strong&gt таг - Удебелява текста.</p>
        <p>&lt;i&gt или &lt;em&gt таг - Задава курсив/наклон на текста.</p>
        <p>&lt;u&gt таг - Подчертава текста.</p>
        <p id="example">
            <u>пример</u>
        </p>

        <p>&lt;strong&gt таг - Указва важен текст.</p>
        <p>&lt;sub&gt таг - Дефинира текст под черта.</p>
        <p>&lt;sup&gt таг - Дефинира текст над черта.</p>
        <p>&lt;del&gt таг - Указва изтрит текст.</p>
        <p id="example">
            <del>пример</del>
        </p>
        <p>&lt;br&gt таг - Указва нов ред. Няма таг за край.</p>
        <p>&lt;blockquote&gt таг - Указва част от текста, който е цитат.</p>

        <p>&lt;mark&gt таг - За отбелязване на текст, като му се променя фона.</p>
        <p id="example">
            <mark>пример</mark>
        </p>

        <p>&lt;a&gt таг - Указва линк към друга страница. Най-важният атрибут на този таг е href. Той посочва URL адреса, към който сочи линка</p>


    <p>
        <img src="basic_colors.jpg" alt="This is an image" />
        <br>
    </p>

        <h3>Атрибути</h3>
            <p>&diams;&emsp;text - задава цветa на текста в страницата</p>
            <p>&diams;&emsp;link - задава цветa на връзките, които още не са посетени</p>
            <p>&diams;&emsp;vlink - задава цветa на връзките, които са били посетени</p>
            <p>&diams;&emsp;alink - задава цветa на активираните връзки</p>
            <p>&diams;&emsp;align /center-left-right-justify(for &lt;p&gt;)/</p>
            <p>&diams;&emsp;clear /left-right-all/</p>
            <p>&diams;&emsp;face – задава вид на шрифта</p>
            <p>&diams;&emsp;size – задава размер на шрифта</p>
            <p>&diams;&emsp;color – задава цвят на шрифта</p>
            <p>&diams;&emsp;width – задава ширина на линията в % или пиксели</p>
            <p>&diams;&emsp;size – задава дебелина на линията</p>
            <p>&diams;&emsp;align – задава подравняване на линията</p>
            <p>&diams;&emsp;noshade – за изобразяване на линията плътно и без сянка</p>

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