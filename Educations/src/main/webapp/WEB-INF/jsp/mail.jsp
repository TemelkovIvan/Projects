<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Education</title>
        <link href="books.ico" rel="shortcut icon" type="ico">
        <link rel="stylesheet" href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <style type="text/css">
body {
    background-color: gray;
}

h1 {
    margin: 40px;
    text-align: center;
    color: white;
    text-transform: uppercase;
}

p {
    padding-left: 30%;
    color: white;
    text-align: center;
    width: 70%;
}

div {

    padding:50px;
    padding-bottom: 150px;
    background-color:rgb(93, 75, 99);
    border-radius: 52%;
    box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
    margin-top: 30px;
}


h5 {
    text-transform: uppercase;
    padding:10px;
    background-color:rgb(93, 75, 99);
    border-radius: 52%;
    box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
	font-size: 25px;
    margin-top: 170px;
    text-align: center;
    text-decoration: none;
    color: yellow;
}

    a {
        text-decoration: none;
        color: gray;
    }

    h5>a:hover {
        text-decoration: none;
        color: white;
    }

    .form-control {
        max-height: 200px;
    }


    </style>
    <body>
            <div>
                <h1>Пишете ни</h1>

                <form:form method="post">
                <form method="post">
                    <p>
                      <label>Вашият email адрес</label>
                      <input type="email" name="email" class="form-control" id="exampleFormControlInput1" value=${email} readonly>
                    </p>
                    <p>
                      <label>Съобщение</label>
                      <textarea class="form-control" name="textarea" id="exampleFormControlTextarea1" rows="4" minlength="10" maxlength="500"></textarea>
                      <font color="red">${errorMessage}</font>
                    </p>
                    <p>
                        <input type="submit" class="btn btn-success" value="Изпрати"/>
                    </p>
                    <p>
                        <a type="button" class="btn btn-danger" href="/list-educations" >Отказ</a>
                    </p>
                </form:form>
            </div>

    </body>
    <footer>
        <h5>
            <a href="/info">Информация за нас</a>
        </h5>
    </footer>
    </html>