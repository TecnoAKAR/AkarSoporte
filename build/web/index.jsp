<%@page import="org.akar.extConnections.Correo"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="es">

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="sources\assets\images\logoAKAR100.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Tecnologías AKAR</title>

    <!-- Bootstrap core CSS -->
    <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="sources/assets/css/akar.css">
    <link rel="stylesheet" href="sources/assets/css/animated.css">
    <link rel="stylesheet" href="sources/assets/css/owl.css">
    
    
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
              <li class="scroll-to-section"><a href="#top" class="active">Inicio</a></li>
              <li class="scroll-to-section"><a href="#sobrenosotros">Sobre nosotros</a></li>
              <li class="scroll-to-section"><a href="#proyecto">Proyecto</a></li>
              <li class="scroll-to-section"><a href="#galeria">Galería</a></li>
              <li class="scroll-to-section"><a href="#contact">Contáctanos</a></li> 
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

  <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                <div class="row">
                  <div class="col-lg-12">
                    <h6>Tecnologías AKAR</h6>
                    <h2>Progresando hacia el futuro</h2>
                    <p> Por un mundo mejor.
                    </div>
                  <div class="col-lg-12">
                    <div class="border-first-button scroll-to-section">
                      <a href="#contact">Conócenos</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                <img src="sources/assets/images/undraw_voice_control_ofo1.svg" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="sobrenosotros" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading  wow fadeInDown" data-wow-duration="0.6s" data-wow-delay="0.4s">
            <h6>Nuestra empresa</h6>
            <h4>¿Quienes somos en <em>Tecnologías AKAR?</em></h4>
            <div class="line-dec"></div>
            <br>
            <p> Somos una empresa 100% mexicana desarrolladora de software que busca no solo innovar, sino 
                también revolucionar el mundo
            del software desarrollando productos de calidad que superen tanto los estándares del mercado
            como las expectativas de nuestros clientes.</p>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="naccs">
            <div class="grid">
              <div class="row">
                <div class="col-lg-12">
                  <div class="menu">
                    <div class="first-thumb active">
                      <div class="thumb">
                        <span class="icon"><img src="sources/assets/images/mision.svg" alt=""></span>
                        Misión
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="sources/assets/images/vision.svg" alt=""></span>
                        Visión
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="sources/assets/images/objetivos.svg" alt=""></span>
                        Objetivos
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="sources/assets/images/filosofia.svg" alt=""></span>
                        Filosofía
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="sources/assets/images/valores.svg" alt=""></span>
                        Valores
                      </div>
                    </div>
                    <div class="last-thumb">
                      <div class="thumb">                 
                        <span class="icon"><img src="sources/assets/images/foda.svg" alt=""></span>
                        FODA
                      </div>
                    </div>
                  </div>
                </div> 
                <div class="col-lg-12">
                  <ul class="nacc">
                    <li class="active">
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Misión</h4>
                                <p>Nuestra misión es revolucionar el mundo del software desarrollando productos y servicios de calidad que superen las expectativas de los clientes y los estándares del mercado nacional.
                                </p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="sources/assets/images/mision.svg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Visión</h4>
                                <p>En un mundo interrelacionado por la tecnología ser los líderes en la producción a nivel nacional e internacional de software, beneficiando al desarrollo social.
                                </p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="sources/assets/images/vision.svg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Objetivos</h4>
                                <div class="ticks-list"><span><i class="fa fa-check"></i> General</span></span></div>
                                <p>Crear aplicaciones revolucionarias aplicando todo el conocimiento disponible, esto lográndolo con una excelente administración.
                                </p>
                                <div class="ticks-list"><span><i class="fa fa-check"></i> Específicos</span></span></div>
                                <p>Hacer que nuestros productos sean accesibles para todo el público en general.</p>
                                <p>Entregar productos de calidad que superen los estándares.</p>  
                                <p>Crear softwares que sean revolucionarios y trascendentales en la industria.</p>  
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="sources/assets/images/objetivos.svg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Filosofía</h4>
                                <p>¡Aplicaciones, conocimiento, administración y revolución!
                                </p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="sources/assets/images/filosofia.svg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Valores</h4>
                                <div class="ticks-list">
                                  <span><i class="fa fa-check"></i>Compromiso</span>
                                  <span><i class="fa fa-check"></i>Empatía</span> 
                                  <span><i class="fa fa-check"></i>Compañerismo</span>
                                  <span><i class="fa fa-check"></i>Respeto</span> 
                                  <span><i class="fa fa-check"></i>Tolerancia</span> 
                                  <span><i class="fa fa-check"></i>Inclusión</span>
                                  <span><i class="fa fa-check"></i>Honestidad</span>
                                  <span><i class="fa fa-check"></i>Competitividad</span>
                                  <span><i class="fa fa-check"></i>Responsabilidad</span>
                                </div> 
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="sources/assets/images/valores.svg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>FODA</h4>
                                <div class="ticks-list"><span><i class="fa fa-check"></i>Fortalezas</span></span></div>
                                  <p>-Equipo comprometido a nuestros proyectos</p>
                                  <p>-Buena capacitación y organización para la elaboración del producto/servicios</p>  
                               
                                <div class="ticks-list"><span><i class="fa fa-check"></i>Oportunidades</span></span></div>
                                  <p>-El área a la que nos dirigimos es bastante amplia</p>
                                  <p>-Posible inversión del sector privado</p>  
                                
                                <div class="ticks-list"><span><i class="fa fa-check"></i>Debilidades</span></span></div>
                                  <p>-Ser un equipo reducido</p>
                                  <p>-Elevado tiempo de preparación de nuestros productos/servicios</p> 
                                
                                <div class="ticks-list"><span><i class="fa fa-check"></i>Amenazas</span></span></div>
                                  <p>-No tener las suficientes recursos para poder realizar todos los proyectos</p>
                                  <p>-La gran competencia dentro de nuestro país</p>                                 
                             </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="sources/assets/images/foda.svg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>          
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  
  <div id="proyecto" class="free-quote">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading  wow fadeIn" data-wow-duration="0.5s" data-wow-delay="0.3s">
            <h6>Nuestro proyecto</h6>
            <h4>APPerger</h4>
            <div class="line-dec"></div>
          </div>
        </div>
        <h7>Se estima que aproximadamente el 1% de la población mexicana es afectada por el síndrome de asperger, 
                síndrome que es difícil de detectar y afecta las relaciones sociales. Se ha detectado que los tratamientos que tiene el este síndrome 
                se puede implementar con el uso de las TIC’s, además de que traería diversas ventajas, solo que 
                existen dos inconvenientes principales; el primero es que el mercado de aplicaciones que ayudan 
                a niños con alguna TEA no es muy amplio, pues comparado con otros, existen muy pocas aplicaciones 
                que ayudan al tratamiento del espectro autista, aunque afortunadamente las que hay son muy buenas 
                y cumplen con el cometido de ayudar. El segundo inconveniente es que las niños con TEA no tienen 
                suficientemente desarrollada sus habilidades con las TIC’s, “las niños con TEA son inexpertas 
                en la utilización y uso de herramientas digitales e Internet encontrándose con problemas para 
                entender y utilizar las convenciones en interfaces o aplicaciones de usuario como el 
                desplazamiento, el doble click del ratón, etc. ”(Renilla Villalta et al., 2010).
                </br>
                La solución que hemos planteado en <i>Tecnologías AKAR</i> es crear una aplicación que cumpla con
                las necesidades básicas que los niños con síndrome de Asperger 
                necesitan para familiarizarse con las TIC’s, además de que permitan su desarrollo intelectual y 
                sirvan como una implementación de su tratamiento, esto haciendo uso de minijuegos y actividades. 
                Además, la aplicación tendrá opciones para que los padres puedan acompañar a sus hijos durante el 
                tratamiento, implementando foros para que puedan comunicarse con otros padres que pasen por la misma 
                situación y chats directos con el psicólogo a cargo del tratamiento.
            <h7>
            <br>
            <br>
            <div class="section-heading  wow fadeIn" data-wow-duration="0.5s" data-wow-delay="0.3s">
                <div class="line-dec"></div>
                <br>
                <h6>
                    ¿Quiere saber si su hijo, usted o algún conocido son potenciales a tener algún síndrome del espectro autista?
                </h6>
                <h7>
                    <a href="Cuestionario.jsp">Realice nuestro cuestionario</a> para saber más.
                </h7>
            </div>       
        <div class="col-lg-8 offset-lg-2  wow fadeIn" data-wow-duration="1s" data-wow-delay="0.4s">
        </div>
      </div>
    </div>
  </div>


  <div id="galeria" class="our-portfolio section">
    <div class="container">
      <div class="row">
        <div class="col-lg-5">
          <div class="section-heading wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.3s">
            <h6>Galería</h6>
            <h4>Look &amp; Feel</em></h4>
            <div class="line-dec"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid wow fadeIn" data-wow-duration="1s" data-wow-delay="0.7s">
      <div class="row">
        <div class="col-lg-12">
          <div class="loop owl-carousel">
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="sources/assets/images/portfolio-01.jpg" alt="">
                </div>
                <div class="down-content">
                  <h4>Inicio</h4>
                  <span>Android</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="sources/assets/images/portfolio-01.jpg" alt="">
                </div>
                <div class="down-content">
                  <h4>Login</h4>
                  <span>Android</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="sources/assets/images/portfolio-02.jpg" alt="">
                </div>
                <div class="down-content">
                  <h4>Pinturillo</h4>
                  <span>Android</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="sources/assets/images/portfolio-03.jpg" alt="">
                </div>
                <div class="down-content">
                  <h4>Ajedrez</h4>
                  <span>Android</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="sources/assets/images/portfolio-04.jpg" alt="">
                </div>
                <div class="down-content">
                  <h4>Simón dice</h4>
                  <span>Android</span>
                </div>
              </div>
              </a>  
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="contact" class="contact-us section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 offset-lg-3">
          <div class="section-heading wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s">
            <h6>Contáctanos</h6>
            <h4>Ponte en contacto con nosotros <em>Ahora</em></h4>
            <div class="line-dec"></div>
          </div>
        </div>
        <div class="col-lg-12 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.25s">
          <form id="contact" action="" method="post">
            <div class="row">
              <div class="col-lg-12">
                <div class="contact-dec">
                  <img src="sources/assets/images/contact-dec-v3.png" alt="">
                </div>
              </div>
              <div class="col-lg-5">
                <div id="map">
                  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3762.0360518071298!2d-99.17725698551574!3d19.454012386872197!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d1f93ac6b75195%3A0x56b3abe4e2aab98!2sMar%20Mediterr%C3%A1neo%20227%2C%20Popotla%2C%20Miguel%20Hidalgo%2C%2011320%20Ciudad%20de%20M%C3%A9xico%2C%20CDMX!5e0!3m2!1ses-419!2smx!4v1664512255958!5m2!1ses-419!2smx" width="100%" height="636px" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
              </div>
              <div class="col-lg-7">
                <div class="fill-form">
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="info-post">
                        <div class="icon">
                          <img src="sources/assets/images/phone-icon.png" alt="">
                          <a href="#">55 4514 9922</a>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="info-post">
                        <div class="icon">
                          <img src="sources/assets/images/email-icon.png" alt="">
                          <a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;to=akartecnologias@gmail.com&amp;authuser=0">akartecnologias</br>@gmail.com</a>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="info-post">
                        <div class="icon">
                          <img src="sources/assets/images/location-icon.png" alt="">
                          <a href="#">Mar Mediterráneo #227</a>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <fieldset>
                        <input type="name" name="name" id="name" placeholder="Nombre" autocomplete="on" required>
                      </fieldset>
                      <fieldset>
                        <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Correo electrónico" required="">
                      </fieldset>
                      <fieldset>
                        <input type="subject" name="subject" id="subject" placeholder="Asunto" autocomplete="on">
                      </fieldset>
                    </div>
                    <div class="col-lg-6">
                      <fieldset>
                        <textarea name="message" type="text" class="form-control" id="message" placeholder="Mensaje" required=""></textarea>  
                      </fieldset>
                    </div>
                    <div class="col-lg-12">
                      <fieldset>
                        <button type="submit" id="action" name="action" value="send" class="main-button ">Enviar mensaje</button>
                      </fieldset>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2022 Tecnologías AKAR, S. de R.L. de C.V. All Rights Reserved. </p>
        </div>
      </div>
    </div>
  </footer>


  <!-- Scripts -->
  <script src="sources/vendor/jquery/jquery.min.js"></script>
  <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="sources/assets/js/owl-carousel.js"></script>
  <script src="sources/assets/js/animation.js"></script>
  <script src="sources/assets/js/imagesloaded.js"></script>
  <script src="sources/assets/js/custom.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
            case "send":
                Correo correo = new Correo();
                boolean enviado = correo.contactoAKAR(request.getParameter("name"), request.getParameter("email"), request.getParameter("subject"), request.getParameter("message"));
                if (enviado == false) {
  %>
                    <script>alert("Ha ocurrido un error al enviar los mensajes.");</script>
  <%
                }
                break;
        }
  %>
  
</body>
</html>
