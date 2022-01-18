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

#first {
    background-color: black;
    width: 400px;
    color: white;
    text-transform: uppercase;
    padding: 5px;
}
#second {
    background-color: black;
    width: 1200px;
    color: white;
    text-transform: uppercase;
    padding-left: 300px;
}

    h1 {
        font-family: Gabriola;
        color: black;
        text-align: center;
        margin-top: 25px;
        margin-bottom: 25px;
        font-weight: bold;
        font-size: 50px;
        padding: 30px;
        text-transform: uppercase;
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
    padding-left: 50px;
}

table {
    color: #333333;
    border-spacing: 0;
    margin-left: 150px;
}

    tr:nth-child(even) td {
        background-color: whitesmoke;
    }

    tr:nth-child(odd) td {
        background-color: gray;
    }

p {
    padding-left: 150px;
    padding-right: 150px;
}


/* ------------------- START FOOTER ------------------- */

    h5 {
        text-transform: uppercase;
        padding:10px;
        background-color: black;
    	font-size: 25px;
        margin-top: 50px;
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
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/learn';" style="cursor: pointer;"><i id="icons" class="fas fa-users"></i><br>Друг потребител</div>
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/list-educations';" style="cursor: pointer;"><i id="icons" class="fas fa-book"></i><br>Обучения на ${name}
                           <ul>
                            <c:forEach items="${todos}" var= "todo">
                               <li><a href="${todo.linkEducation}">${todo.desc}</a></li>
                            </c:forEach>
                           </ul>
                    </div>
                    <div class="col-lg-2 col-md-4" align="center"><i id="icons" class="fas fa-clock"></i><br>
                        <div class="container-day">
                            <b class="day">Т</b> дни
                            <b class="hour">Т</b>ч :
                            <b class="minute">Т</b>м :
                            <b class="second">Т</b>с
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4" align="center"><i id="icons" class="fas fa-calendar"></i><br><fmt:formatDate value="${targetDate}" pattern="dd/MM/yyyy"/></div>
                    <div class="col-lg-2 col-md-4" align="center" onclick="location.href='/mail';" style="cursor: pointer"><i id="icons" class="fas fa-at"></i><br>Пишете ни</div>
                    <div class="col-lg-2 col-md-4" id="user" align="center" onclick="location.href='/user';" style="cursor: pointer;"><i id="icons" class="fas fa-user"></i><br>${name}</div>
            </div>
        </div>
    </nav>

    <h1>Шаблони за дизайн</h1>

    <p>
        &diams;&emsp;Шаблоните за дизайн (англ: Software Design Pattern) представляват концепция предназначена за разрешаване на често срещани проблеми в обектно-ориентираното програмиране. Тази концепция предлага стандартни решения за архитектурни и концептуални проблеми в компютърното програмиране.
    </p>

    <p>
        &diams;&emsp;Тук не става въпрос за конкренти алгоритми или част от програмен код. Шаблоните за дизайн са независими от програмния език. Те представляват архитектурни решения на вече познати и много често срещани проблеми в програмирането. Може да се каже, че шаблоните за дизайн представляват средство за прилагане на световния опит на програмисти и аналитици.
    </p>


    <table>
        <h3>Създаващи шаблони</h3>
        <tr id="first-row">
            <th id="first">Наименование</th>
            <td id="second">Описание</td>
        </tr>
        <tr class="green-background">
            <td>Абстрактна Фабрика (Abstract Factory)</td>
            <td>Предоставя интерфейс за създаване на семейства от обекти без да са посочени техните конкретни класове.</td>
        </tr>
        <tr class="blue-background">
            <td>Метод Фабрика (Factory method)</td>
            <td>Дефинира интерфейс за създаване на обекти, но оставя на подкласовете да решат от кои класове да направят инстанции.</td>
        </tr>
        <tr class="green-background">
            <td>Строител (Builder)</td>
            <td>Разделя създаването на сложен обект от неговото представяне, така че един и същи процес да може да създава обекти с различно представяне.</td>
        </tr>
        <tr class="blue-background">
            <td>Късна инициализация (Lazy initialization)</td>
            <td>Отлагане във времето на създаването на обект, изчисляването на стойност или на някакъв друг отнемащ ресурси процес, до момента в който не е нужен.</td>
        </tr>
        <tr class="green-background">
            <td>Object pool</td>
            <td>Предотвратява скъпо заделяне или освобождаване на ресурс чрез рециклиране на обекти с кратък живот.</td>
        </tr>
        <tr class="blue-background">
            <td>Прототип (Prototype)</td>
            <td>Определя прототипна инстанция на някакъв вид обект и създава нови обекти чрез копиране на прототипа.</td>
        </tr>
        <tr class="green-background">
            <td>Сек (Singleton)</td>
            <td>Осигурява клас, който може да има само една-единствена инстанция и предоставя глобален достъп до нея.</td>
        </tr>
    </table>
    <table>
        <h3>Структурни шаблони</h3>
        <tr id="first-row">
            <th id="first">Наименование</th>
            <td id="second">Описание</td>
        </tr>
        <tr class="green-background">
            <td>Адаптер (Adapter)</td>
            <td>Конвертира интерфейса на даден клас към друг интерфейс, който е очакван от клиента. Адаптерът оставя класовете да работят заедно. Това е необходимо заради несъвместимостта им.</td>

        </tr>
        <tr class="blue-background">
            <td>Мост (Bridge)</td>
            <td>Отделя абстракцията от нейната имплементация, така че двете могат да бъдат променяни независимо.</td>

        </tr>
        <tr class="green-background">
            <td>Композиция (Composite)</td>
            <td>Композиране на обекти в дървовидни структури за представяне на йерархии от елементи.</td>
        </tr>
        <tr class="blue-background">
            <td>Декоратор (Decorator)</td>
            <td>	Динамично добавя допълнителни отговорности на обект, като запазва интерфейса му. Декораторите предоставят гъвкава алтернатива на наследяването за разширяване на функционалността.</td>
        </tr>
        <tr class="green-background">
            <td>Фасада (Facade)</td>
            <td>Предоставя уеднаквен интерфейс за редица интерфейси. Фасадата дефинира интерфейс от по-високо ниво, което прави по-лесна употребата на подсистемата.</td>
        </tr>
        <tr class="green-background">
            <td>Миниобект (Flyweight)</td>
            <td>Използва поделяне за ефективна поддръжка на голям брой малки обекти.</td>
        </tr>
        <tr class="green-background">
            <td>Пълномощно (Proxy)</td>
            <td>Предоставя заместник на друг обект, за да се контролира достъпа до него.</td>
        </tr>
    </table>
    <table>
        <h3>Поведенчески шаблони</h3>
        <tr id="first-row">
            <th id="first">Наименование</th>
            <td id="second">Описание</td>
        </tr>
        <tr class="green-background">
            <td>Верига отговорности (Chain of Responsibility)</td>
            <td>Избягва обвързването на изпращача на дадена заявка с получателя ѝ, като дава възможност на няколко oбекта да обработят заявката. Свързва заедно приемащите обекти и предава заявката по веригата, докато някой от тях я обработи.</td>
        </tr>
        <tr class="blue-background">
            <td>Команда (Command)</td>
            <td>Капсулира дадена заявка във вид на обект. Това позволява свързването на клиента с различни заявки или опашки, както и поддръжка на функция за връщане на промените (undo).</td>
        </tr>
        <tr class="green-background">
            <td>Интерпретатор (Interpreter)</td>
            <td>Даден език дефинира своята граматика, също така и интерпретатор, който използва граматиката, за да интерпретира изречения написани на този език.</td>
        </tr>
        <tr class="blue-background">
            <td>Итератор (Iterator)</td>
            <td>Предоставя начин за последователен достъп до елементите на обект, без да е нужна вътрешна информация за обекта.</td>
        </tr>
        <tr class="green-background">
            <td>Посредник (Mediator)</td>
            <td>Дефинира обект който капсулира връзките между списък от обекти. Медиаторът поддържа шаблона Разхлабени връзки (loose coupling) като предпазва директно обвързване между обектите, давайки възможност това да се случва на по-високо ниво.</td>
        </tr>
        <tr class="blue-background">
            <td>Спомен (Memento)</td>
            <td>Без да нарушава капсулацията на даден обект, прихваща и изважда вътрешното му състояние с цел да бъде възвърнато това състояние в по-късен етап.</td>
        </tr>
        <tr class="green-background">
            <td>Празен обект (Null Object)</td>
            <td>Проектиран е да действа като стойност по подразбиране на даден обект.</td>
        </tr>
        <tr class="blue-background">
            <td>Наблюдател (Observer)</td>
            <td>Дефинира зависимост „един към много“ между обектите, така че ако един обект промени състоянието си, всички зависими от него обекти да бъдат известени и обновени автоматично.</td>
        </tr>
        <tr class="green-background">
            <td>Състояние (State)</td>
            <td>Позволява на даден обект да променя поведението си при промяна на вътрешното му състояние. Изглежда все едно обектът е променил класа си.</td>
        </tr>
        <tr class="blue-background">
            <td>Стратегия (Strategy)</td>
            <td>Дефинира семейство от капсулирани алгоритми и ги прави взаемозаменими. Стратегията позволява промяна на алгоритмите, независимо от клиента, който ги използва.</td>
        </tr>
        <tr class="green-background">
            <td>Спецификация (Specification)</td>
            <td></td>
        </tr>
        <tr class="blue-background">
            <td>Шаблонен метод (Template method)</td>
            <td>Дефинира скелет на алгоритъм в дадена операция, като оставя някои стъпки за подкласовете. Шаблонният метод позволява на подкласовете да предефинират някои стъпки на даден алгоритъм, без да променят структурата му.</td>
        </tr>
        <tr class="green-background">
            <td>Посетител (Visitor)</td>
            <td>Посетителят предоставя възможност за дефиниране на нова операция, без да се променя класа на елемента върху който се извършва операцията.</td>
        </tr>

    </table>

    <h4>Източници</h4>
    <p>https://bg.wikipedia.org<br>
        Шаблони за дизайн, Design Patterns – Ерик Гама, Ричард Хелм, Ралф Джонсън, 2005, издателство СофтПрес. ISBN 954-685-352-6</p>


     <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
     <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>


        <script>
            const countdown = () => {
                // Specify the date and time we are counting down to.

                const countDate = new Date("${targetDate}").getTime();
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

</body>
<footer>
        <h5>
            <a href="/information">Информация за нас</a>
        </h5>
    </footer>
</html>