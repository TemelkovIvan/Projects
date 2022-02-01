<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
    <title>Business Calculator</title>
    <link href="calc.png" rel="shortcut icon" type="ico">
    <link rel="stylesheet" href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>
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
    }

    nav{
    	background-color: black;
    	position: sticky;
        top: 0;
    }

 	div{
 	    text-transform: uppercase;
 	    color: white;
 	    font-size: 22px;
 	    padding: 2px;
 	}

     ul {
         top:100%;
         position: absolute;
         font-size: 20px;
         display: none;
     }

     div:hover > ul {
        text-align:left;
        line-height: 15px;
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

    @media (max-width:800px){
        #icons {
            display: none;
        }
    }

    @media (min-width:1200px){
        .col-lg-2 {
            height: 85px;
            text-align:center;
            line-height: 20px;
        }

        #icons {
            padding: 10px;
            height: 45px;
            width: 35px;
            border-radius: 50%;
            display: inline-block;
            color: orange;
        }
    }

    .col-lg-2:hover {
        color: orange;
    }

    /* ------------------- END NAVBAR ------------------- */

    h1 {
        font-family: Gabriola;
        color: black;
        text-align: center;
        margin-top: 25px;
        font-weight: bold;
        font-size: 50px;
        padding: 30px;
        text-transform: uppercase;
    }

    #div {
        padding: 2% 5% 0 5%;
    }

    .buttons {
      position: absolute;
      right: 150px;
    }

    #myInput {
        margin: 20px;
    }

    table {
        font-size: 12px;
        border-spacing: 0;
        border: 2px solid black;
    }

    th {
        font-size: 15px;
        font-weight: bold;
        width: 1%;
        text-align: center;
    }

    tr:nth-child(even) td {
        background-color: whitesmoke;
        text-align: center;
    }

    tr:nth-child(odd) td {
        background-color: gray;
        text-align: center;
    }

    input {
        text-align: center;
    }

    #total {
        text-align: center;
        width: 110px;
        height: 50px;
    }

    input:invalid+span:after {
        color: red;
        content: '✖ грешно!';
        padding-left: 5px;
    }


/* ------------------- START FOOTER ------------------- */

    footer {
          position: absolute;
          bottom: 10px;
          margin 0;
          padding: 10px;
          background-color: #000;
          width: 100%;
    }

    h5 {
        text-transform: uppercase;
        background-color: black;
    	font-size: 25px;
        text-align: center;
        text-decoration: none;
    }

    h5>a {
        text-decoration: none;
        color: gray;
    }

    h5>a:hover {
        text-decoration: none;
        color: orange;
    }

/* ------------------- END FOOTER ------------------- */

</style>

<body>

    <nav role="navigation">
            <div class="container-fluid">
                <div class="row">
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/home';" style="cursor: pointer;"><i id="icons" class="fas fa-home"></i><br>Начало</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/calculator';" style="cursor: pointer;"><i id="icons" class="fas fa-calculator"></i><br>Нов Калкулатор</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/search';" style="cursor: pointer;"><i id="icons" class="fas fa-search"></i><br>Търсене</div>
                        <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/mail';" style="cursor: pointer"><i id="icons" class="fas fa-at"></i><br>Пишете ни</div>
                        <div class="col-lg-2 col-md-4" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
                </div>
            </div>
        </nav>

     <h1>Бизнес Калкулатор</h1>
        <div id="div">
<p class="buttons">
<button class="btn btn-secondary" type="button" onclick="myFunction(1)">Договор A</button>
<button class="btn btn-dark" type="button" onclick="myFunction(2)">Договор B</button>
<button class="btn btn-secondary" type="button" onclick="myFunction(3)">Договор C</button>
<button class="btn btn-dark" type="button" onclick="myFunction(4)">Договор D</button>
<button class="btn btn-secondary" type="button" onclick="myFunction(5)">Договор E</button>
</p>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<form method="post">
<p>

<input name="client" type="text" placeholder="Клиент">
<input name="address" type="text" placeholder="Адрес">
<input name="numberOfCase" type="text" placeholder="№ Случай">
<input name="contract" id="contract" type="text" placeholder="Договор" readonly>
</p>
<p>
<input id="myInput" type="text" placeholder="Търсене..">
</p>
        <table class="table">

            <thead>
                <tr>
                    <th>Позиция</th>
                    <th>Дейност</th>
                    <th>Описание</th>
                    <th>Цена Договор A</th>
                    <th>Цена Договор B</th>
                    <th>Цена Договор C</th>
                    <th>Цена Договор D</th>
                    <th>Цена Договор E</th>
                    <th>Тип</th>
                    <th>Количество</th>
                    <th>Общо</th>
                </tr>
            </thead>
            <tbody id="myTable">

                <c:forEach items="${smr}" var= "smr">
                            <tr>
                                <td>${smr.position}</td>
                                <td>${smr.action}</td>
                                <td>${smr.descr}</td>
                                <td>${smr.price_contract_1}</td>
                                <td>${smr.price_contract_2}</td>
                                <td>${smr.price_contract_3}</td>
                                <td>${smr.price_contract_4}</td>
                                <td>${smr.price_contract_5}</td>
                                <td>${smr.type}</td>

                                <td><input type="number" name="qty_${smr.position}" class="form-control" onchange="compute(${smr.position},${smr.price_contract_1},${smr.price_contract_2},${smr.price_contract_3},${smr.price_contract_4},${smr.price_contract_5})" id="qty_${smr.position}" value="0" step="1" min="0" max="100000"><span class="validity"></td>
                                <td><input type="text" name="row_${smr.position}" class="form-control test" id="result_${smr.position}" value="0" readonly></td>

                            </tr>
                </c:forEach>
            </tbody>
        </table>

            <h1>
            Обща сума : <input type="number" name="total" id="total" readonly/>лв.
            </h1>

     <br/>
     <p>
                         <input type="submit" class="btn btn-secondary" onclick="return confirm('Моля потвърдете');" value="Създай"/>
                     </p>
</form>
    </div>

    </body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">

            var price1;
            var price = price1;

              function myFunction(id_contract) {
                price = "price"+id_contract;
                document.getElementById('contract').value = id_contract;
                return this.price;
              }

        function compute(id,price1,price2,price3,price4,price5) {
              var txtFirstNumberValue = document.getElementById('qty_'+id).value;

              if (txtFirstNumberValue >= 0 ) {

              var result = parseFloat(txtFirstNumberValue) * price1;

                if(price == "price1") {
                    var result = parseFloat(txtFirstNumberValue) * price1;
                }
                if (price == "price2") {
                    var result = parseFloat(txtFirstNumberValue) * price2;
                }
                if(price == "price3") {
                    var result = parseFloat(txtFirstNumberValue) * price3;
                }
                if(price == "price4") {
                    var result = parseFloat(txtFirstNumberValue) * price4;
                }
                if(price == "price5") {
                    var result = parseFloat(txtFirstNumberValue) * price5;
                }


                document.getElementById('result_'+id).value = result.toFixed(2);
              } else {
              document.getElementById('result_'+id).value = 0;
              }


            var inputs = document.getElementsByClassName('form-control test'),
            result = document.getElementById('total'),
            sum = 0;

            for(var i=0; i<inputs.length; i++) {
                var ip = inputs[i];

            if (ip.name && ip.name.indexOf("total") < 0) {
                sum += parseFloat(ip.value) || 0;
            }
        }

        result.value = sum.toFixed(2);
        }

        </script>

    </html>