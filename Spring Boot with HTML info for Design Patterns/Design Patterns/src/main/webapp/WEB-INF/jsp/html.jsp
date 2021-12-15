<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<meta charset="UTF-8">
<title>Education</title>
<link href="books.ico" rel="shortcut icon" type="ico">
 <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
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
    margin-top: -70px;
	background-color: black;
  width:1905px;


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
        position: relative;
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

    li ul {
        top:100%;
        position: absolute;
        margin: 0;
        padding: 0;
        display: none;
    }

    li:hover > ul {
        display: block;
        background-color: rgb(46, 46, 46);
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
    margin-right: 50px;
    margin-left: 50px;
    margin-top: 70px;
    margin-bottom: 10px;
    font-weight: bold;
    font-size: 50px;
    padding-top: 20px;
    padding-bottom: 20px;
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
</style>
<body>
    <nav role="navigation">
            <ul>
                <li><a href="/learn">Друг потребител</a></li>
                 <li><a href="/list-todos">Обучения на ${name}</a>
                     <ul>
                         <c:forEach items="${todos}" var= "todo">
                            <li><a href="${todo.linkEducation}">${todo.desc}</a></li>
                         </c:forEach>
                     </ul>
                 </li>
                <li id="user">${name}</li>
            </ul>
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
<br>&lt;html&gt;<br>
...<br>
&lt;/html&gt;

</p>
<h3>&lt;head&gt; елемент</h3>
<p>Съдържа заглавието на документа, и може да съдържа стилове, скриптове, енкодинг и т.н.
<br>&lt;html&gt
<br>&lt;head&gt
<br>&lt;title>Заглавие на документа&lt;/title&gt
<br>&lt;/head&gt
<br>...
<br>&lt;/html&gt
</p>

<h3>&lt;body&gt; елемент</h3>
<p>Съдържа форматиране видимо за потребителя – текст, хиперлинк, картинки, таблици, бутони, параграфи и т.н.
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
<br>&lt;!DOCTYPE html&gt
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

<p>&lt;strong&gt таг - Указва важен текст.
</p>

<p>&lt;sub&gt таг - Дефинира текст под черта.
</p>

<p>&lt;sup&gt таг - Дефинира текст над черта.
</p>

<p>&lt;del&gt таг - Указва изтрит текст.
</p>

<p>&lt;br&gt таг - Указва нов ред. Няма таг за край.
</p>

<p>&lt;blockquote&gt таг - Указва част от текста, който е цитат.
</p>

<p>&lt;mark&gt таг - За отбелязване на текст, като му се променя фона.
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


    </dl>

    </div>









    <h4>Източници</h4>
    <p>https://bg.wikipedia.org<br>
       </p>

     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>