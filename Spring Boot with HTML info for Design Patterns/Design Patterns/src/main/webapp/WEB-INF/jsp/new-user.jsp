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
    </style>
    <body>
            <div>
                <form method="post">

                    <h1>Проект с набор от необходими знания</h1>

                    <h2>
                        Създаване на нов акаунт
                    </h2>
                <p>
                    Име <input type="text" name="userId"/>
                </p>
                <p>
                    Парола <input type="password" name="password"/>
                </p>
                <p>
                    Повторете Парола <input type="password" name="password2"/>
                    <br>
                    <font color="red">${errorMessage}</font>
                </p>
                <p>
                    E-mail <input type="text" name="email"/>
                </p>
                <p>
                    Age <input type="text" name="age"/>
                </p>
                <p>
                    <input type="submit" value="Създай"/>
                </p>
                <p id = "commentar">
                    При проблем се свържете с Иван Темелков
                </p>


                </form>
            </div>
    </body>
    <footer>
        <ul>
            <li>Enter User and Password -------> "IvanT" and "123"</li>
            <li>Enter User and Password -------> "Georgi" and "1234"</li>
            <li>Enter User and Password -------> "test3" and "12345"</li>
        </ul>
    </footer>
    </html>