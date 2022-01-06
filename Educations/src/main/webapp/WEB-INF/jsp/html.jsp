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
    	background-color: black;
    	position: sticky;
        top: 0;
    }

 	div{
 	    text-transform: uppercase;
 	    font-size: 25px;
 	    padding: 2px;
 	}

     ul {
         top:100%;
         position: absolute;
         font-size: 20px;
         display: none;
     }

     div:hover > ul {
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

    h1 {
        font-family: Gabriola;
        text-align: center;
        margin-top: 50px;
        margin-bottom: 50px;
        font-weight: bold;
        font-size: 50px;
        padding: 20px;
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

    p {
        color: white;
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
    }

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color:rgb(93, 75, 99);
        border-radius: 52%;
        box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
    	font-size: 25px;
        margin-top: 50px;
        margin-bottom: 30px;
        text-align: center;
        text-decoration: none;
        color: yellow;
    }

    h5>a {
        text-decoration: none;
        color: gray;
    }

    h5>a:hover {
        text-decoration: none;
        color: white;
    }

    #date {
        color: white;
    }

    #user a {
        float: right;
    }

</style>
<body>
   <nav role="navigation">
           <div class="container-fluid">
               <div class="row">
                       <div class="col-lg-2 col-md-4"><a href="/learn">Друг потребител</a></div>
                       <div class="col-lg-2 col-md-4"><a href="/list-educations">Обучения на ${name}
                              <ul>
                               <c:forEach items="${todos}" var= "todo">
                                  <li><a href="${todo.linkEducation}">${todo.desc}</a></li>
                               </c:forEach>
                              </ul>
                       </div>
                       <div class="col-lg-2 col-md-4"></div>
                       <div class="col-lg-2 col-md-4" id="date">
                                <div class="container-day">
                                        <b class="day">Time</b>д :
                                        <b class="hour">Time</b>ч :
                                        <b class="minute">Time</b>м :
                                        <b class="second">Time</b>с
                                </div></div>
                       <div class="col-lg-2 col-md-4" id="date">
                                <c:forEach items="${todos}" var= "todo">
                                    <c:if test = "${todo.desc == 'LEARN HTML'}">
                                        <fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy"/>
                                    </c:if>
                                </c:forEach></div>
                       <div class="col-lg-2 col-md-4" id="user"><a href="/user">${name}</a></div>
               </ul>
           </div>
       </nav>

    <h1>HTML</h1>

        <script>
            const countdown = () => {
                // Specify the date and time we are counting down to.

                const countDate = new Date("Feb 28, 2022 00:00:00").getTime();
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

        <p>
            &diams;&emsp;HTML (съкращение от термина на английски: HyperText Markup Language, произнасяно най-често като „ейч-ти-ем-ел“, в превод „език за маркиране на хипертекст“) е основният маркиращ език за описание и дизайн на уеб страници. HTML е стандарт в Интернет, а правилата се определят от международния консорциум W3C. Текущата версия на стандарта е HTML 5.0 (от 28 октомври 2014 г.)
        </p>

        <p>
            &diams;&emsp;Описанието на документа става чрез специални елементи, наречени HTML елементи или маркери, които се състоят от етикети или тагове (HTML tags) и ъглови скоби (като например елемента <html>). HTML елементите са основната градивна единица на уеб страниците. Чрез тях се оформят отделните части от текста на една уеб страница, като заглавия, цитати, раздели, хипертекстови препратки и т.н. Най-често HTML елементите са групирани по двойки &lt;h1&gt; и &lt;/h1&gt;.
        </p>

<h3>&lt;html&gt; елемент</h3>
<p>Указва на браузъра, че това е HTML документ. Отбелязва началото и края на документа и съдържа всички други негови елементи (с изключение на <!DOCTYPE> елемента).
</p>


<p id="example">
<br>&lt;html&gt;<br>
...<br>
&lt;/html&gt;

</p>
<h3>&lt;head&gt; елемент</h3>
<p>Съдържа заглавието на документа, и може да съдържа стилове, скриптове, енкодинг и т.н.
</p>
<p id="example">
<br>&lt;html&gt
<br>&lt;head&gt
<br>&lt;title>Заглавие на документа&lt;/title&gt
<br>&lt;/head&gt
<br>...
<br>&lt;/html&gt
</p>

<h3>&lt;body&gt; елемент</h3>
<p>Съдържа форматиране видимо за потребителя – текст, хиперлинк, картинки, таблици, бутони, параграфи и т.н.
</p>
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
<p>Декларира се първи, още преди &lt;html&gt; тага. Валидира документа. &lt;!DOCTYPE&gt; не е HTML таг. Той е инструкция за уеб браузъра – указва HTML версията, на която е написана страницата
</p>
<p id="example">
&lt;!DOCTYPE html&gt
<br>&lt;html&gt;
<br>...
<br>&lt;/html&gt;
</p>

<h3>Основни HTML тагове</h3>
<p>&lt;b&gt или &lt;strong&gt таг - Удебелява текста.
</p>

<p>&lt;i&gt или &lt;em&gt таг - Задава курсив/наклон на текста.
</p>

<p>&lt;u&gt таг - Подчертава текста.
</p>
<p id="example">
<u>пример</u>
</p>

<p>&lt;strong&gt таг - Указва важен текст.
</p>

<p>&lt;sub&gt таг - Дефинира текст под черта.
</p>

<p>&lt;sup&gt таг - Дефинира текст над черта.
</p>

<p>&lt;del&gt таг - Указва изтрит текст.
</p>
<p id="example">
<del>пример</del>
</p>

<p>&lt;br&gt таг - Указва нов ред. Няма таг за край.
</p>

<p>&lt;blockquote&gt таг - Указва част от текста, който е цитат.
</p>

<p>&lt;mark&gt таг - За отбелязване на текст, като му се променя фона.
</p>
<p id="example">
<mark>пример</mark>
</p>

<p>&lt;a&gt таг - Указва линк към друга страница. Най-важният атрибут на този таг е href. Той посочва URL адреса, към който сочи линка
</p>


    <div>
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
    </div>

<h3>Цветове</h3>
<p>
<img src="basic_colors.jpg" alt="This is an image" />
<br>
<br>
<img src="colors.jpg" alt="This is an image" />
</p>

    <h4>Източници</h4>
    <p>https://bg.wikipedia.org<br>
       </p>

     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>



</body>
    <footer>
        <h5>
            <a href="/information">Информация за нас</a>
        </h5>
    </footer>
</html>