<%@ page pageEncoding="UTF-8" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Education</title>
        <link href="books.ico" rel="shortcut icon" type="ico">
    </head>
    <style type="text/css">
body {
    background-color: gray;
}

ul {
    padding-top: 180px;
    color: burlywood;
    list-style: none;
}

h1 {
    margin: 80px;
    text-align: center;
    color: white;
text-transform: uppercase;
}

h2 {
    text-align: center;
    color:orange;
}

p {
    color: white;
    text-align: center;
}

#commentar {
    color:green;
    text-align: center;
}
div {

    padding:50px;
    padding-bottom: 200px;
    background-color:rgb(93, 75, 99);
    border-radius: 52%;
    box-shadow: 0px 0px 50px -1px rgba(0,0,0,0.76);
    margin-top: 30px;
}

#add {
text-align: center;
text-decoration: none;
color: #A3A3A3;
text-transform: uppercase;
}

#add:hover {
color: orange;

}

    </style>
    <body>
            <div>
                <form method="post">

                    <h1>Проект с набор от необходими знания</h1>

                    <h2>
                        Промяна на данни за съществуващ акаунт
                    </h2>
                <p>
                    Име <input type="text" name="name" value=${name} readonly>
                </p>
                <p>
                    Нова Парола <input type="password" name="password"/>
                </p>
                <p>
                    Повторете Новата Парола <input type="password" name="confirmPassword"/>
                    <br>
                    <font color="red">${errorMessage}</font>
                </p>
                <p>
                    E-mail <input type="email" name="email" value=${email}>
                </p>
                <p>
                    Age <input type="number" name="age" value=${age}>
                </p>
                <p>
                    <input type="submit" value="Промени"/>
                </p>
                <p id = "commentar">
                    При проблем се свържете с Иван Темелков
                </p>

                <p>
                    <input type="reset" value="Изчисти">
                </p>


                <p>
                <a id="add" href="/user">Отказ</a>
                </p>

                </form>
            </div>
    </body>

    </html>