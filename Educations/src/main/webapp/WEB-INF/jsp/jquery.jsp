<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<meta charset="UTF-8">
<title>Education</title>
    <link href="books.ico" rel="shortcut icon" type="ico">
    <link rel="stylesheet" href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
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
	text-align:justify;
	border-collapse: collapse;
	border-spacing: 0;
}

/* ------------------- RESET FOR CSS ------------------- */

    body {
        background-color: grey;
    }

    nav{
    	position: sticky;
        top: 0;
    }

 	div{
 	    color: white;
 	    text-transform: uppercase;
 	    font-size: 25px;
 	}

    @media (max-width:800px){
        .col-lg-2 {
            font-size: 15px;
            height: 20px;
            line-height: 8px;
        }
        #icons {
            display: none;
        }

    }

    @media (min-width:1200px){
        .col-lg-2 {
            height: 120px;
            text-align:center;
            line-height: 60px;
        }

        #icons {
            padding: 12px;
            height: 55px;
            width: 55px;
            border-radius: 50%;
            display: inline-block;
            color: blue;
        }
    }

    .col-lg-2:hover {
        color: black;
        font-size: 30px;
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
        background-color: DC3545;
     }

    div a {
        text-decoration: none;
 	    color: white;
    }

 	div a:hover {
         text-decoration: none;
 	     color: black;
 	}

h1 {
    font-family: Gabriola;
    text-align: center;
    margin-top: 30px;
    margin-bottom: 30px;
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
    margin-left: 200px;
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
        margin-top: 10px;
        margin-bottom: 30px;
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

        #user a {
            float: right;
        }

        #accordion {
            border: solid 1px black;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .buttons {
           margin-left: 30%;
        }

        .draggable {
            margin-left: 200px;
            color: yellow;
        }

        span {
            text-transform: uppercase;
            font-size: 15px;
        }

</style>
<body>
    <nav role="navigation">
               <div class="container-fluid">
                   <div class="row">
                           <div class="col-lg-2 col-md-4 bg-success" align="center" onclick="location.href='/learn';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                           <div class="col-lg-2 col-md-4 bg-danger" align="center" onclick="location.href='/list-educations';" style="cursor: pointer;"><i id="icons" class="fas fa-book"></i><br>Обучения на ${name}
                                  <ul>
                                   <c:forEach items="${todos}" var= "todo">
                                      <li><a href="${todo.linkEducation}">${todo.desc}</a></li>
                                   </c:forEach>
                                  </ul>
                           </div>
                           <div class="col-lg-2 col-md-4 bg-light"><i id="icons" class="fas fa-frown"></i></div>
                           <div class="col-lg-2 col-md-4 bg-primary" id="date"><i id="icons" class="fas fa-clock"></i><br>
                                                           <div class="container-day">
                                                                   <b class="day">Т</b> дни
                                                                   <b class="hour">Т</b>ч :
                                                                   <b class="minute">Т</b>м :
                                                                   <b class="second">Т</b>с
                                                           </div></div>
                           <div class="col-lg-2 col-md-4 bg-warning" id="date"><i id="icons" class="fas fa-calendar"></i><br>
                                                           <c:forEach items="${todos}" var= "todo">
                                                               <c:if test = "${todo.desc == 'Learn JQuery'}">
                                                                   <fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy"/>
                                                               </c:if>
                                                           </c:forEach></div>
                           <div class="col-lg-2 col-md-4 bg-info" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
                   </ul>
               </div>
           </nav>
    <h1 class="hide">JQuery </h1>

            <div id="accordion">
              <h3>Section 1</h3>
              <div>
                <p>TEXT</p>
              </div>
              <h3>Section 2</h3>
              <div>
                <p>TEXT</p>
              </div>
              <h3>Section 3</h3>
              <div>
                <p>TEXT</p>
                <ol>
                  <li>List item one</li>
                  <li>List item two</li>
                  <li>List item three</li>
                </ol>
              </div>
              <h3>Section 4</h3>
              <div>
                <p>TEXT</p>
              </div>
            </div>

            <div class="buttons">
              <button class="btn btn-success">Test1</button>
              <button class="btn btn-warning">Test2</button>
              <button class="btn btn-danger">Test3 - Always Visible</button>
            </div>

            <p class="hide">Ако ме натиснеш ще изчезна!</p>
            <p class="hide">Натискай далече от мен!</p>
            <p class="hide">Натисни ме за да изчезна и аз ...</p>

            <div id="draggable" class="ui-widget-content" >
              <div class="draggable">Премести ме!</div>
            </div>


        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
        <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>


             <script>

                const countdown = () => {
                // Specify the date and time we are counting down to.

                const countDate = new Date("Mar 31, 2022 00:00:00").getTime();
                const now = new Date().getTime();
                const remainingTime = countDate - now;

                const second = 1000;
                const minute = second * 60;
                const hour = minute * 60;
                const day = hour * 24;

                const textDay = Math.floor(remainingTime / day);
                const textHour = Math.floor((remainingTime % day) / hour);
                const textMinute = Math.floor((remainingTime % hour) / minute);
                const textSecond = Math.floor((remainingTime % minute) / second);

                document.querySelector(".day").innerText = textDay > 0 ? textDay : 0;
                document.querySelector(".hour").innerText = textHour > 0 ? textHour : 0;
                document.querySelector(".minute").innerText = textMinute > 0 ? textMinute : 0;
                document.querySelector(".second").innerText = textSecond > 0 ? textSecond : 0;
                };

                // should use 500 as setInterval won't always run on time.
                setInterval(countdown, 500);
             </script>


             <script>
              $( function() {
                $( "#accordion" ).accordion({
                  collapsible: true
                });
              } );
              </script>

            <script>
                $(document).ready(function(){
                  $(".hide").click(function(){
                    $(this).css('color', 'red');
                    $(this).hide(800);
                  });
                });

                $( function() {
                    $( "#draggable" ).draggable();
                } );
            </script>

        <script>
        $( ".btn-success" ).on( "click", function() {
          flash( 'test 1' ,{
          'autohide' : true,
          'bgColor' : '#5cb85c',
          'ftColor' : 'white'
          } ) ;
        });
        $( ".btn-warning" ).on( "click", function() {
          flash( 'test 2',{
            'autohide' : true,
            'bgColor' : 'FFC107',
            'ftColor' : 'black'
          } ) ;
        });
        $( ".btn-danger" ).on( "click", function() {
          flash( 'test 3',{
            'autohide' : false,
            'bgColor' : '#C0392B',
            'ftColor' : 'white'
          } ) ;
        });

        function flash(message, options = null){
          let type = typeof options;
          if (options !== null && type === 'object') {
            $.extend($options, options)
          }


        //Check if message is clickable to enable message click hide action
          if ($options.clickable) {
            $message.on('click', function(){
              $(this).fadeOut($options.fadeOut);
            });
          }

        //Check if message is enabled to autohide
          if ($options.autohide) {
            setTimeout(function(){
              $message.fadeOut($options.fadeOut);
            },$options.duration);
          }


        }

        let $message_container=$("<span></span>");$('body').append($message_container);
        let $options={
        'duration':4000,
        'vPosition':'bottom',
        'hPosition':'right',
        'fadeIn':200,
        'fadeOut':2500,
        'clickable':!0,};

        function flash(message,options=null){
            let type=typeof options;
            if(options!==null&&type==='object'){
            $.extend($options,options)}

        msg_container_css={"position":"fixed","margin-left":'7px',"z-index":'50',};
        msg_container_css[$options.vPosition]="3px";
        msg_container_css[$options.hPosition]="5px";
        $message_container.css(msg_container_css);
        let $message=$("<span></span>");
        msg_css={
        'text-align':'right',
        'margin-bottom':'20px',
        'margin-right':'20px',
        'padding':'15px',
        'border':'1px solid #dcdcdc',
        'border-radius':'20px',
        'float':'right',
        'clear':'right',
        'background-color':$options.bgColor,
        'color':$options.ftColor,
        'font-family':"Arial, Helvetica, sans-serif"};
        $message.css(msg_css);$message.text(message);
        $message_container
            .append($message)
            .children(':last')
            .hide().fadeIn($options.fadeIn);

            if($options.clickable){$message.on('click',function(){$(this).fadeOut($options.fadeOut)})}
            if($options.autohide){setTimeout(function(){$message.fadeOut($options.fadeOut)},$options.duration)}}
        </script>

            <style>
                #draggable { width: 150px; height: 100px; padding: 0.5em; }
            </style>

            <script>
              $( function() {
                $( "#draggable" ).draggable();
              } );
            </script>
</body>
    <footer>
        <h5>
            <a href="/information">Информация за нас</a>
        </h5>
    </footer>
</html>