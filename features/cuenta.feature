Feature:Realizar operaciones sobre Cuenta
    Yo quiero
    Como usuario de start registrado
    Quiero probar las funcionalidades de Cuenta

    Background: Ingresar a la pagina de estart
            Given estoy en la pagina de inicio de Start

    @crearEventoFuturo
    @participarEnEventoRoles
    @eliminarEvento
    @maximize
    Scenario: Ver mis eventos en mi cuenta
        Given estoy en la pagina de inicio de sesion de Start
        And Ingresar el campo del correo <correo>
        And Ingresar en el campo de contraseña <contrasena>
        And Hare click en el boton "Iniciar Sesión"
        And Se muestra una cabecera con Inicio, Proyectos, Eventos y Cuenta
        When voy a hacer click en el boton Cuenta de la cabecera
        Then Ver la tarjeta en mis Eventos de "EventoPrueba"
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | '123456'     |
            | 'coreteam@gmail.com'   | '123456'     |
            | 'voluntario@gmail.com' | '123456'     |

    @SinParticiparEventosLider
    @SinParticiparEventosCoreTeam
    @SinParticiparEventosVoluntario
    Scenario:Ver en la cuenta que no hay eventos
        Given estoy en la pagina de inicio de sesion de Start
        And Ingresar el campo del correo <correo>
        And Ingresar en el campo de contraseña <contrasena>
        And Hare click en el boton "Iniciar Sesión"
        And Se muestra una cabecera con Inicio, Proyectos, Eventos y Cuenta
        When voy a hacer click en el boton Cuenta de la cabecera
        Then Ver en la parte de mis cuentas que muestra un mensaje "Aún no te has registrado a ningún evento. Una vez te hayas registrado a alguno de nuestros eventos, aparecerán en tu página de inicio."
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | '123456'     |
            | 'coreteam@gmail.com'   | '123456'     |
            | 'voluntario@gmail.com' | '123456'     |
    @crearEventoFuturo
    @participarEnEventoRoles
    @eliminarEvento
    @maximize
    Scenario: Ver los detalles en mi cuenta del evento que participo
        Given estoy en la pagina de inicio de sesion de Start
        And Ingresar el campo del correo <correo>
        And Ingresar en el campo de contraseña <contrasena>
        And Hare click en el boton "Iniciar Sesión"
        And Se muestra una cabecera con Inicio, Proyectos, Eventos y Cuenta
        When voy a hacer click en el boton Cuenta de la cabecera
        And Ver en mis Eventos que exista el evento que participo
#        And Hare click en el evento para ver los detalles
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | '123456'     |
            | 'coreteam@gmail.com'   | '123456'     |
            | 'voluntario@gmail.com' | '123456'     |

    @maximize
    @crearProyecto
    @ParticiparProyecto
    @eliminarProyecto
    Scenario: Ver mis proyectos en mi cuenta
        Given estoy en la pagina de inicio de sesion de Start
        And Ingresar el campo del correo <correo>
        And Ingresar en el campo de contraseña <contrasena>
        And Hare click en el boton "Iniciar Sesión"
        And Se muestra una cabecera con Inicio, Proyectos, Eventos y Cuenta
        When voy a hacer click en el boton Cuenta de la cabecera
        And hare click en mis proyectos
        Then vere mi proyecto en el que participe "El agua es oro por siempre"
        Examples:
            | correo                 | contrasena |
            | 'coreteam@gmail.com'   | '123456'     |
    
    @maximize
    Scenario: Ver mis Logros en mi cuenta
        Given estoy en la pagina de inicio de sesion de Start
        And Ingresar el campo del correo <correo>
        And Ingresar en el campo de contraseña <contrasena>
        And Hare click en el boton "Iniciar Sesión"
        And Se muestra una cabecera con Inicio, Proyectos, Eventos y Cuenta
        When voy a hacer click en el boton Cuenta de la cabecera
        And hare click en mis Logros
        Then vere mis logros
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'   | '123456'   |
            | 'coreteam@gmail.com'   | '123456'     |
            | 'voluntario@gmail.com' | '123456'     |


