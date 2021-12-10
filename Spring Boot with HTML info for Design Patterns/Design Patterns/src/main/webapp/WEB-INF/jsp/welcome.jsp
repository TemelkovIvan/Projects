<%@ page pageEncoding="UTF-8" %>

<html>
<head>
<title>Design Patterns</title>
<link href="books.ico" rel="shortcut icon" type="ico">
</head>
<style type="text/css">
    body {
    background-color: gray;
    }
	h1,h3{
        text-align: center;
	    background-color: #BBB;

	}
    p {
        text-align: center;
        background-color: rgb(116, 252, 234);
        font-size: 25;
        padding: 40px;
    }
    p:hover {
        background-color: #135E3E;
        font-size: 30;
    }
</style>
<body>
    <h1>Здравейте, ${name}!!!</h1>
    <h3>Добре дошли!!!</h3>
        <p>
            <a href="/list-todos">Кликнете тук за информация относно Design Patterns.</a>
        </p>
</body>
</html>