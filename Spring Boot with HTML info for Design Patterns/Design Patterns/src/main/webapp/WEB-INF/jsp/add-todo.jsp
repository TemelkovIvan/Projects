<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<meta charset="UTF-8">
<title>Design Patterns</title>
<link href="books.ico" rel="shortcut icon" type="ico">
 <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
    rel="stylesheet">
</head>
<body>
    <div class="container">
        <form:form method="post" commandName="todo">
            <hidden path="id"/>
            <fieldset class="form-group">
                <label path="desc">Description</label>
                <input name="desc" type="text"  class="form-control" required="required" minlength="5" maxlength="10"/>

                <form:errors name="desc" cssClass="text-warning"/>

                <label path="targetDate">Target Date</label>
                <input name="targetDate" type="text" class="form-control" required="required"/>
                <form:errors path="targetDate" cssClass="text-warning"/>

            </fieldset>
            <button type="submit" class="btn btn-success">Add</button>
        </form:form>
    </div>

 <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
 <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
 <script>
 $('#targetDate').datepicker({
 format : "dd/mm/yyyy"
 });
 </script>


</body>
</html>