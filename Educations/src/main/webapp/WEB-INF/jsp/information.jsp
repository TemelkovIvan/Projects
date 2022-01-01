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
  width:1920px;


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

h1 {

    text-align: center;
    font-family:sans-serif
    margin-right: 50px;
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
    font-size: 45px;
    font-family: Gabriola;
    padding: 50px;
    text-align: center;
    font-weight: bold;
}

a {
        text-decoration: none;
    }

p>a:hover {
        text-decoration: none;
	    color: orange;
	}

p {
    color: white;
    font-size: 25px;
    padding-left: 600px;
}


</style>
<body>
    <nav role="navigation">
            <ul>
                 <li><a href="/learn">Друг потребител</a></li>
                 <li><a href="/list-educations">Обучения на ${name}</a>
                     <ul>
                         <c:forEach items="${todos}" var= "todo">
                            <li><a href="${todo.linkEducation}">${todo.desc}</a></li>
                         </c:forEach>
                     </ul>
                 </li>
                 <li id="user"><a href="/user">${name}</a></li>
            </ul>
        </div>
    </nav>
    <h1>"${name}"</h1>

    <h3>Прoектът е изработен от <br> Иван Георгиев Темелков</h3>



        <p>гр. София, ж.к. Дружба</p>
        <p>телефон: 0877766276</p>
        <p>e-mail: ivan_temelkow@abv.bg</p>
        <p><a href="https://github.com/TemelkovIvan">GitHub</a></p>
        <p><a href="http://linkedin.com/in/ivan-temelkov-101988110">Linkedin</a></p>
        <br>
        <br>
        <br>
        <p>Иван изучава светът на JAVA</p>
        <p>Това е първият му проект със Spring Boot</p>
        <p>Има огромно желание да работи като Разработчик</p>

     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>