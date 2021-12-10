<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Design Patterns</title>
<link href="books.ico" rel="shortcut icon" type="ico">
 <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
    rel="stylesheet">
</head>

<style type="text/css">
	nav{
	text-align: center;
	background-color: #ccc;
	}
	li{
	text-transform: uppercase;
	font-size: 25px;
	display: inline-block;
	padding: 10px;
	}
	li:hover {
	background-color: #999999;
	}
</style>

<body>

<nav role="navigation">
    <div>
        <ul>
            <li class="active"><a href="/learn">Change User</a></li>
            <li><a href="/design-patterns">Design Patterns</a></li>
            <li><a href="/list-todos">Todos</a></li>
        </ul>
    </div>
</nav>

    <H1>Your Todos</H1>
    <div class="container">
            <caption>Your todos are</caption>
    <table class="table">

        <thead>
            <tr>
                <th>Description</th>
                <th>Target Date</th>
                <th>It is Done?</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${todos}" var= "todo">
                        <tr>
                            <td>${todo.desc}</td>
                            <td><fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy"/></td>
                            <td>${todo.done}</td>
                            <td><a type="button" class="btn btn-success" href="/update-todo?id=${todo.id}">Update</a></td>
                            <td><a type="button" class="btn btn-warning" href="/delete-todo?id=${todo.id}">Delete</a></td>
                        </tr>
            </c:forEach>
        </tbody>
    </table>

 <br/> <a class="button"href="/add-todo">Add a Todo</a>

 <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
 <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</div>

</body>
</html>