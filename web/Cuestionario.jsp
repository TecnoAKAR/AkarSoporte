<%-- 
    Document   : Cuestionario
    Created on : 24/02/2023, 04:50:49 AM
    Author     : Axel Zarate Lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        
        <title>Cuestionario</title>
        <style>
                table, th, td {
                  border: 1px solid black;
                  border-collapse: collapse;
                }
                th, td {
                  padding: 5px;
                }
        </style>
        
        <!-- Bootstrap core CSS -->
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>
        

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- Pre-header Starts --><!-- Esto no me convence
        <div class="pre-header">
          <div class="container">
            <div class="row">
              <div class="col-lg-8 col-sm-8 col-7">
                <ul class="info">
                  <li><a href="#"><i class="fa fa-envelope"></i>akar@gmail.com</a></li>
                  <li><a href="#"><i class="fa fa-phone"></i>55 4514 9922</a></li>
                </ul>
              </div>
              <div class="col-lg-4 col-sm-4 col-5">
                <ul class="social-media">
                  <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                  <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>-->
        <!-- Pre-header End -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="index.jsp" class="logo">
                                <img src="sources/assets/images/loguitoakar.png" alt="">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="index.jsp#top" class="active">Inicio</a></li>
                                <li class="scroll-to-section"><a href="index.jsp#sobrenosotros">Sobre nosotros</a></li>
                                <li class="scroll-to-section"><a href="index.jsp#proyecto">Proyecto</a></li>
                                <li class="scroll-to-section"><a href="index.jsp#galeria">Galería</a></li>
                                <li class="scroll-to-section"><a href="index.jsp#contact">Contáctanos</a></li> 
                                <li class="scroll-to-section"><a href="signup.jsp">Registrarse</a></li>
                                <li class="scroll-to-section"><div class="border-first-button"><a href="login.jsp">Iniciar sesión</a></div></li> 
                            </ul>        
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->
        
        </br>
        </br>
        </br>
        </br>
        </br>
        <div align="center"> <h1>Cuestionario de cociente de Espectro Autista (AQ)</h1> </div>
        </br>
        
        <p align="center"> El cuestionario de cociente de espectro autista AQ es una herramienta diseñada para ayudar a los profesionales a evaluar si una persona tiene características relacionadas con el autismo. Es un cuestionario que se responde en forma de preguntas, y se basa en el comportamiento y la forma en que una persona interactúa con su entorno y con otras personas.
            El cuestionario AQ es una herramienta útil para aquellos que quieren entender mejor a sus hijos o para aquellos que están preocupados por el desarrollo de una persona. Los resultados del cuestionario pueden ayudar a los profesionales a identificar si una persona puede necesitar una evaluación más completa para el autismo. </p>
        
        <br/>
        
        <div align="center">
            
            <p> Responda a todas las preguntas con total sinceridad. </p>
            <br/>
            
            <form method="post">
                <table width="70%">
                    <tr>
                        <th>Pregunta</th>
                        <th>Muy en desacuerdo</th>
                        <th>Medianamente en desacuerdo</th>
                        <th>Medianamente correcto</th>
                        <th>Muy de acuerdo</th>
                    </tr>
                    <tr>
                        <td>1 Prefiere hacer cosas con otros a hacerlas solo/a.</td>
                        <td><input type="radio" name="p1" value="3" required></td>
                        <td><input type="radio" name="p1" value="2" required></td>
                        <td><input type="radio" name="p1" value="1" required></td>
                        <td><input type="radio" name="p1" value="0" required></td>
                    </tr>
                    <tr>
                        <td>2 Prefiere hacer las cosas de una misma manera una y otra vez.</td>
                        <td><input type="radio" name="p2" value="3" required></td>
                        <td><input type="radio" name="p2" value="2" required></td>
                        <td><input type="radio" name="p2" value="1" required></td>
                        <td><input type="radio" name="p2" value="0" required></td>
                    </tr>
                    <tr>
                        <td>3 Cuando trata de imaginarse algo, le parece muy fácil crear la imagen en su cabeza.</td>
                        <td><input type="radio" name="p3" value="3" required></td>
                        <td><input type="radio" name="p3" value="2" required></td>
                        <td><input type="radio" name="p3" value="1" required></td>
                        <td><input type="radio" name="p3" value="0" required></td>
                    </tr>
                    <tr>
                        <td>4 Con frecuencia queda tan absorto/a en una actividad que parece no darse cuenta de las cosas que suceden a su alrededor.
</td>
                        <td><input type="radio" name="p4" value="3" required></td>
                        <td><input type="radio" name="p4" value="2" required></td>
                        <td><input type="radio" name="p4" value="1" required></td>
                        <td><input type="radio" name="p4" value="0" required></td>
                    </tr>
                    <tr>
                        <td>5 Usualmente puede oír débiles sonidos que otros no.</td>
                        <td><input type="radio" name="p5" value="3" required></td>
                        <td><input type="radio" name="p5" value="2" required></td>
                        <td><input type="radio" name="p5" value="1" required></td>
                        <td><input type="radio" name="p5" value="0" required></td>
                    </tr>
                    <tr>
                        <td>6 A menudo le llaman la atención los números de las casas, matrículas de coches, números impresos en carteles o información similar.</td>
                        <td><input type="radio" name="p6" value="3" required></td>
                        <td><input type="radio" name="p6" value="2" required></td>
                        <td><input type="radio" name="p6" value="1" required></td>
                        <td><input type="radio" name="p6" value="0" required></td>
                    </tr>   
                    <tr>      
                        <td>7 Tiene dificultad en comprender las reglas de la conducta cortés.</td>
                        <td><input type="radio" name="p7" value="3" required></td>
                        <td><input type="radio" name="p7" value="2" required></td>
                        <td><input type="radio" name="p7" value="1" required></td>
                        <td><input type="radio" name="p7" value="0" required></td>
                    </tr>
                    <tr>
                        <td>8 Cuando lee un cuento, le resulta fácil imaginarse cómo son los personajes.</td>
                        <td><input type="radio" name="p8" value="3" required></td>
                        <td><input type="radio" name="p8" value="2" required></td>
                        <td><input type="radio" name="p8" value="1" required></td>
                        <td><input type="radio" name="p8" value="0" required></td>
                    </tr>
                    <tr>
                        <td>9 Le fascinan las fechas.</td>
                        <td><input type="radio" name="p9" value="3" required></td>
                        <td><input type="radio" name="p9" value="2" required></td>
                        <td><input type="radio" name="p9" value="1" required></td>
                        <td><input type="radio" name="p9" value="0" required></td>
                    </tr>
                    <tr>
                        <td>10 Cuando está con otras personas, puede seguir varias conversaciones de distintas personas.</td>
                        <td><input type="radio" name="p10" value="3" required></td>
                        <td><input type="radio" name="p10" value="2" required></td>
                        <td><input type="radio" name="p10" value="1" required></td>
                        <td><input type="radio" name="p10" value="0" required></td>
                    </tr>
                    <tr>
                        <td>11 Se desenvuelve con facilidad en distintas situaciones sociales.</td>
                        <td><input type="radio" name="p11" value="3" required></td>
                        <td><input type="radio" name="p11" value="2" required></td>
                        <td><input type="radio" name="p11" value="1" required></td>
                        <td><input type="radio" name="p11" value="0" required></td>
                    </tr>
                    <tr>
                        <td>12 Suele fijarse en detalles que a otros no les llaman la atención.</td>
                        <td><input type="radio" name="p12" value="3" required></td>
                        <td><input type="radio" name="p12" value="2" required></td>
                        <td><input type="radio" name="p12" value="1" required></td>
                        <td><input type="radio" name="p12" value="0" required></td>
                    </tr>
                    <tr>
                        <td>13 Se sentiría más a gusto en una biblioteca que en una fiesta de cumpleaños.</td>
                        <td><input type="radio" name="p13" value="3" required></td>
                        <td><input type="radio" name="p13" value="2" required></td>
                        <td><input type="radio" name="p13" value="1" required></td>
                        <td><input type="radio" name="p13" value="0" required></td>
                    </tr>
                    <tr>
                        <td>14 Inventa historias con facilidad.</td>
                        <td><input type="radio" name="p14" value="3" required></td>
                        <td><input type="radio" name="p14" value="2" required></td>
                        <td><input type="radio" name="p14" value="1" required></td>
                        <td><input type="radio" name="p14" value="0" required></td>
                    </tr>
                    <tr>
                        <td>15 Le interesan más las personas que las cosas.</td>
                        <td><input type="radio" name="p15" value="3" required></td>
                        <td><input type="radio" name="p15" value="2" required></td>
                        <td><input type="radio" name="p15" value="1" required></td>
                        <td><input type="radio" name="p15" value="0" required></td>
                    </tr>
                    <tr>
                        <td>16 Algunas cosas le interesan mucho y se molesta si no puede dedicarles tiempo.</td>
                        <td><input type="radio" name="p16" value="3" required></td>
                        <td><input type="radio" name="p16" value="2" required></td>
                        <td><input type="radio" name="p16" value="1" required></td>
                        <td><input type="radio" name="p16" value="0" required></td>
                    </tr>
                    <tr>
                        <td>17 Le gusta conversar sobre temas interesantes sin importancia.</td>
                        <td><input type="radio" name="p17" value="3" required></td>
                        <td><input type="radio" name="p17" value="2" required></td>
                        <td><input type="radio" name="p17" value="1" required></td>
                        <td><input type="radio" name="p17" value="0" required></td>
                    </tr>
                    <tr>
                        <td>18 Cuando habla no siempre es fácil para los demás intervenir en la conversación.</td>
                        <td><input type="radio" name="p18" value="3" required></td>
                        <td><input type="radio" name="p18" value="2" required></td>
                        <td><input type="radio" name="p18" value="1" required></td>
                        <td><input type="radio" name="p18" value="0" required></td>
                    </tr>
                    <tr>
                        <td>19 Le fascinan los números.</td>
                        <td><input type="radio" name="p19" value="3" required></td>
                        <td><input type="radio" name="p19" value="2" required></td>
                        <td><input type="radio" name="p19" value="1" required></td>
                        <td><input type="radio" name="p19" value="0" required></td>
                    </tr>
                    <tr>
                        <td>20 Cuando lee un cuento le cuesta identificar las intenciones o sentimientos de los personajes.</td>
                        <td><input type="radio" name="p20" value="3" required></td>
                        <td><input type="radio" name="p20" value="2" required></td>
                        <td><input type="radio" name="p20" value="1" required></td>
                        <td><input type="radio" name="p20" value="0" required></td>
                    </tr>
                    <tr>
                        <td>21 No le gustan los cuentos de historias de ficción.</td>
                        <td><input type="radio" name="p21" value="3" required></td>
                        <td><input type="radio" name="p21" value="2" required></td>
                        <td><input type="radio" name="p21" value="1" required></td>
                        <td><input type="radio" name="p21" value="0" required></td>
                    </tr>
                    <tr>
                        <td>22 No le cuesta hacer nuevos amigos.</td>
                        <td><input type="radio" name="p22" value="3" required></td>
                        <td><input type="radio" name="p22" value="2" required></td>
                        <td><input type="radio" name="p22" value="1" required></td>
                        <td><input type="radio" name="p22" value="0" required></td>
                    </tr>
                    <tr>
                        <td>23 Siempre está encontrando patrones o regularidades en las cosas.</td>
                        <td><input type="radio" name="p23" value="3" required></td>
                        <td><input type="radio" name="p23" value="2" required></td>
                        <td><input type="radio" name="p23" value="1" required></td>
                        <td><input type="radio" name="p23" value="0" required></td>
                    </tr>
                    <tr>
                        <td>24 Le gusta más ir al cine que a un museo.</td>
                        <td><input type="radio" name="p24" value="3" required></td>
                        <td><input type="radio" name="p24" value="2" required></td>
                        <td><input type="radio" name="p24" value="1" required></td>
                        <td><input type="radio" name="p24" value="0" required></td>
                    </tr>
                    <tr>
                        <td>25 No se altera cuando se le cambia su rutina diaria.</td>
                        <td><input type="radio" name="p25" value="3" required></td>
                        <td><input type="radio" name="p25" value="2" required></td>
                        <td><input type="radio" name="p25" value="1" required></td>
                        <td><input type="radio" name="p25" value="0" required></td>
                    </tr>
                    <tr>
                        <td>26 No sabe como hacer para conversar con niños de su edad.</td>
                        <td><input type="radio" name="p26" value="3" required></td>
                        <td><input type="radio" name="p26" value="2" required></td>
                        <td><input type="radio" name="p26" value="1" required></td>
                        <td><input type="radio" name="p26" value="0" required></td>
                    </tr>
                    <tr>
                        <td>27 No le cuesta “leer entre líneas” cuando otras personas le dicen algo.</td>
                        <td><input type="radio" name="p27" value="3" required></td>
                        <td><input type="radio" name="p27" value="2" required></td>
                        <td><input type="radio" name="p27" value="1" required></td>
                        <td><input type="radio" name="p27" value="0" required></td>
                    </tr>
                    <tr>
                        <td>28 Cuando mira un dibujo, un cuadro, o una fotografía, presta más atención a la imagen completa que a los detalles.</td>
                        <td><input type="radio" name="p28" value="3" required></td>
                        <td><input type="radio" name="p28" value="2" required></td>
                        <td><input type="radio" name="p28" value="1" required></td>
                        <td><input type="radio" name="p28" value="0" required></td>
                    </tr>
                    <tr>
                        <td>29 No se le da bien memorizar números de teléfono.</td>
                        <td><input type="radio" name="p29" value="3" required></td>
                        <td><input type="radio" name="p29" value="2" required></td>
                        <td><input type="radio" name="p29" value="1" required></td>
                        <td><input type="radio" name="p29" value="0" required></td>
                    </tr>
                    <tr>
                        <td>30 No suele darse cuenta de pequeños cambios en la situación de objetos o en la apariencia de las personas.</td>
                        <td><input type="radio" name="p30" value="3" required></td>
                        <td><input type="radio" name="p30" value="2" required></td>
                        <td><input type="radio" name="p30" value="1" required></td>
                        <td><input type="radio" name="p30" value="0" required></td>
                    </tr>
                    <tr>
                        <td>31 Cuando habla, se da cuenta cuando la gente se aburre con lo que dice.</td>
                        <td><input type="radio" name="p31" value="3" required></td>
                        <td><input type="radio" name="p31" value="2" required></td>
                        <td><input type="radio" name="p31" value="1" required></td>
                        <td><input type="radio" name="p31" value="0" required></td>
                    </tr>
                    <tr>
                        <td>32 Le es fácil hacer más de una cosa a la vez.</td>
                        <td><input type="radio" name="p32" value="3" required></td>
                        <td><input type="radio" name="p32" value="2" required></td>
                        <td><input type="radio" name="p32" value="1" required></td>
                        <td><input type="radio" name="p32" value="0" required></td>
                    </tr>
                    <tr>
                        <td>33 Cuando habla por teléfono no sabe cuando es su turno para hablar.</td>
                        <td><input type="radio" name="p33" value="3" required></td>
                        <td><input type="radio" name="p33" value="2" required></td>
                        <td><input type="radio" name="p33" value="1" required></td>
                        <td><input type="radio" name="p33" value="0" required></td>
                    </tr>
                    <tr>
                        <td>34 Le gusta hacer cosas de manera espontánea.</td>
                        <td><input type="radio" name="p34" value="3" required></td>
                        <td><input type="radio" name="p34" value="2" required></td>
                        <td><input type="radio" name="p34" value="1" required></td>
                        <td><input type="radio" name="p34" value="0" required></td>
                    </tr>
                    <tr>
                        <td>35 Es el/la último/a en entender un chiste o una broma.</td>
                        <td><input type="radio" name="p35" value="3" required></td>
                        <td><input type="radio" name="p35" value="2" required></td>
                        <td><input type="radio" name="p35" value="1" required></td>
                        <td><input type="radio" name="p35" value="0" required></td>
                    </tr>
                    <tr>
                        <td>36 Se da cuenta fácilmente de lo que piensa o siente una persona sólo con mirarla a la cara.</td>
                        <td><input type="radio" name="p36" value="3" required></td>
                        <td><input type="radio" name="p36" value="2" required></td>
                        <td><input type="radio" name="p36" value="1" required></td>
                        <td><input type="radio" name="p36" value="0" required></td>
                    </tr>
                    <tr>
                        <td>37 Cuando hay alguna interrupción, puede volver con facilidad a lo que estaba haciendo.</td>
                        <td><input type="radio" name="p37" value="3" required></td>
                        <td><input type="radio" name="p37" value="2" required></td>
                        <td><input type="radio" name="p37" value="1" required></td>
                        <td><input type="radio" name="p37" value="0" required></td>
                    </tr>
                    <tr>
                        <td>38 Es bueno para las conversaciones sociales.</td>
                        <td><input type="radio" name="p38" value="3" required></td>
                        <td><input type="radio" name="p38" value="2" required></td>
                        <td><input type="radio" name="p38" value="1" required></td>
                        <td><input type="radio" name="p38" value="0" required></td>
                    </tr>
                    <tr>
                        <td>39 La gente dice que él/ella siempre habla del mismo tema.</td>
                        <td><input type="radio" name="p39" value="3" required></td>
                        <td><input type="radio" name="p39" value="2" required></td>
                        <td><input type="radio" name="p39" value="1" required></td>
                        <td><input type="radio" name="p39" value="0" required></td>
                    </tr>
                    <tr>
                        <td>40 Cuando estaba en preescolar le gustaba jugar a juegos de simulación con otros niños ( por ejemplo: vaqueros, mamá y papá,...).</td>
                        <td><input type="radio" name="p40" value="3" required></td>
                        <td><input type="radio" name="p40" value="2" required></td>
                        <td><input type="radio" name="p40" value="1" required></td>
                        <td><input type="radio" name="p40" value="0" required></td>
                    </tr>
                    <tr>
                        <td>41 Le gusta juntar información sobre categorías de cosas (autos, trenes, aviones, plantas, animales, etc.).</td>
                        <td><input type="radio" name="p41" value="3" required></td>
                        <td><input type="radio" name="p41" value="2" required></td>
                        <td><input type="radio" name="p41" value="1" required></td>
                        <td><input type="radio" name="p41" value="0" required></td>
                    </tr>
                    <tr>
                        <td>42 Le cuesta imaginarse como sería ser otra persona.</td>
                        <td><input type="radio" name="p42" value="3" required></td>
                        <td><input type="radio" name="p42" value="2" required></td>
                        <td><input type="radio" name="p42" value="1" required></td>
                        <td><input type="radio" name="p42" value="0" required></td>
                    </tr>
                    <tr>
                        <td>43 Le gusta planificar cuidadosamente cualquier actividad en la que vaya a participar.</td>
                        <td><input type="radio" name="p43" value="3" required></td>
                        <td><input type="radio" name="p43" value="2" required></td>
                        <td><input type="radio" name="p43" value="1" required></td>
                        <td><input type="radio" name="p43" value="0" required></td>
                    </tr>
                    <tr>
                        <td>44 Disfruta de situaciones o eventos sociales.</td>
                        <td><input type="radio" name="p44" value="3" required></td>
                        <td><input type="radio" name="p44" value="2" required></td>
                        <td><input type="radio" name="p44" value="1" required></td>
                        <td><input type="radio" name="p44" value="0" required></td>
                    </tr>
                    <tr>
                        <td>45 Le es difícil darse cuenta de las intenciones de las otras personas.</td>
                        <td><input type="radio" name="p45" value="3" required></td>
                        <td><input type="radio" name="p45" value="2" required></td>
                        <td><input type="radio" name="p45" value="1" required></td>
                        <td><input type="radio" name="p45" value="0" required></td>
                    </tr>
                    <tr>
                        <td>46 Las situaciones nuevas le generan ansiedad.</td>
                        <td><input type="radio" name="p46" value="3" required></td>
                        <td><input type="radio" name="p46" value="2" required></td>
                        <td><input type="radio" name="p46" value="1" required></td>
                        <td><input type="radio" name="p46" value="0" required></td>
                    </tr>
                    <tr>
                        <td>47 Disfruta conociendo gente nueva.</td>
                        <td><input type="radio" name="p47" value="3" required></td>
                        <td><input type="radio" name="p47" value="2" required></td>
                        <td><input type="radio" name="p47" value="1" required></td>
                        <td><input type="radio" name="p47" value="0" required></td>
                    </tr>
                    <tr>
                        <td>48 Va con cuidado para no herir los sentimientos de la gente.</td>
                        <td><input type="radio" name="p48" value="3" required></td>
                        <td><input type="radio" name="p48" value="2" required></td>
                        <td><input type="radio" name="p48" value="1" required></td>
                        <td><input type="radio" name="p48" value="0" required></td>
                    </tr>
                    <tr>
                        <td>49 No se le da bien recordar las fechas de cumpleaños.</td>
                        <td><input type="radio" name="p49" value="3" required></td>
                        <td><input type="radio" name="p49" value="2" required></td>
                        <td><input type="radio" name="p49" value="1" required></td>
                        <td><input type="radio" name="p49" value="0" required></td>
                    </tr>
                    <tr>
                        <td>50 Le resulta fácil jugar con otros niños interpretando diversos personajes.</td>
                        <td><input type="radio" name="p50" value="3" required></td>
                        <td><input type="radio" name="p50" value="2" required></td>
                        <td><input type="radio" name="p50" value="1" required></td>
                        <td><input type="radio" name="p50" value="0" required></td>
                    </tr>
                </table>
                </br>
                <button type="submit" id="action" name="action" value="ana" class="btn btn-dark">Analizar</button>
            </form>
        </div>
        <hr>
        <figure class="text-center">                
            <figcaption class="blockquote-footer">
                Rescatado de <cite title="Source Title"> The autism spectrum quotient: Children’s version (AQ-Child). Auyeung, B.; Baron-Cohen, S.; Wheelwright, S.; Allison, C.: Journal of autism and developmental disorders 2008; 38(7):1230–1240 </cite>
            </figcaption>
        </figure>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright © 2022 Tecnologías AKAR, S. de R.L. de C.V. All Rights Reserved. </p>
                    </div>
                </div>
            </div>
        </footer>
        <%
            if( request == null )
            {
                return;
            }
            String action = request.getParameter( "action" );
            if( action == null )
            {
                action = "";
            }
            switch(action){
                case "ana":
                    int sum = 0;
                    for (int i = 1; i <= 50; i++) {
                        sum = sum + Integer.parseInt(request.getParameter("p"+String.valueOf(i)));
                        System.out.println(i);
                        System.out.println(sum);
                    }
                    if(sum >= 0 && sum <= 30){
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'success',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: baja.',
                                text: 'En caso de tener alguna duda consulte a un especialista.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    } else if (sum >= 31 && sum <= 62) {
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'success',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: media.',
                                text: 'En caso de tener alguna duda consulte a un especialista.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    } else if (sum >= 63 && sum <= 87) {
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'warning',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: alta.',
                                text: 'Le recomendamos visitar a un profesional.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    } else if (sum >= 88 && sum <= 150) {
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'warning',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: muy alta.',
                                text: 'Le recomendamos visitar a un profesional.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    }
                    break;
            }
        %>
        
        
        <!-- Scripts -->
        <script src="sources/vendor/jquery/jquery.min.js"></script>
        <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="sources/assets/js/owl-carousel.js"></script>
        <script src="sources/assets/js/animation.js"></script>
        <script src="sources/assets/js/imagesloaded.js"></script>
        <script src="sources/assets/js/custom.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
    </body>
</html>
