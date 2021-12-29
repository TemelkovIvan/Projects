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

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color:rgb(93, 75, 99);
        border-radius: 52%;
        box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
    	font-size: 25px;
        margin-top: 300px;
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
                <li id="user">${name}</li>
            </ul>
        </div>
    </nav>
    <h1>"${name}"</h1>

    <h1>"${email}"</h1>

    <h1>"${age}" <sub>години</sub></h1>

     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
        <footer>
            <h5>
                <a href="/information">Информация за нас</a>
            </h5>
        </footer>
</html>