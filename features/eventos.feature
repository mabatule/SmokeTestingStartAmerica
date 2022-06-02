Feature:Realizar operaciones sobre eventos
    Yo quiero
    Como usuario de start registrado
    Quiero probar las funcionalidades de eventos
    Background: Ingresar a la pagina de estart
        Given estoy en la pagina de inicio de Start

    @maximize
    Scenario: Quiero iniciar sesion
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        And se muestra en la pantalla en la parte derecha <iniciales> indicando mis iniciales
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'coreteam@gmail.com'   | 123456     | 'CT'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |
    @maximize
    @crearEventoFuturo
    @eliminarEvento
    Scenario: Quiero ver los eventos vigentes
        Given estoy en la pagina de inicio de Start
        And ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        When voy a presionar en la cabecera el boton eventos
        Then se muestra en la pantalla un titulo de "EVENTOS VIGENTES"
        And deberia poder ver la tarjeta "EventoPrueba"
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | 123456     |
            | 'coreteam@gmail.com'   | 123456     |
            | 'voluntario@gmail.com' | 123456     |

    @maximize
    @crearEventoPasado
    @eliminarEventoPasado
    Scenario: Como usuario quiero ver los eventos pasados
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When voy a presionar el boton de Eventos Pasados
        Then muestra un titulo de "EVENTOS PASADOS"
        And deberia poder ver la tarjeta "EventoPasadoHook"
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | 123456     |
            | 'coreteam@gmail.com'   | 123456     |
            | 'voluntario@gmail.com' | 123456     |
    @maximize
    @crearEventoConCategoria
    @eliminarEvento
    Scenario: Como usuario quiero filtrar los eventos por categoria
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When elijo la categoria "Empoderamiento" en el dropdown
        Then deberia poder ver la tarjeta "EventoPrueba"
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | 123456     |
            | 'coreteam@gmail.com'   | 123456     |
            | 'voluntario@gmail.com' | 123456     |
    @maximize
    @crearEventoFuturo
    @eliminarEvento
    Scenario: Como coreteam quiero participar en un evento
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When presiono el boton de participar en el evento "EventoPrueba"
        Then el boton de participar  en el evento "EventoPrueba" cambia a dejar de participar
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | 123456     |
            | 'coreteam@gmail.com'   | 123456     |
            | 'voluntario@gmail.com' | 123456     |
    @maximize
    @crearEventoFuturo
    @eliminarEvento
    Scenario: Como usuario quiero dejar de participar en un evento
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        And presiono el boton de participar en el evento "EventoPrueba"
        When presiono el boton de dejar de participar en el evento "EventoPrueba"
        Then el boton de dejar de participar en el evento "EventoPrueba" cambia a participar
        Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | 123456     |
            | 'coreteam@gmail.com'   | 123456     |
            | 'voluntario@gmail.com' | 123456     |

    @maximize
    @eliminarEvento
    Scenario: Como usuario lider y coreteam quiero crear un evento
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When presiono el boton de crear evento
        And lleno los campos necesarios para crear un evento
            | nombre      | EventoPrueba   |
            | fecha       | 12/12/2022     |
            | horaIn      | 03:30          |
            | horaFin     | 16:30          |
            | lugar       | CBBA           |
            | descripcion | Ayuda a perros |
        And presiono el boton para guardar el evento
        Then deberia poder ver la tarjeta "EventoPrueba"
        Examples:
            | correo               | contrasena |
            | 'lider@gmail.com'    | 123456     |
            | 'coreteam@gmail.com' | 123456     |
    @maximize
    @crearEventoFuturo
    Scenario: Como usuario lider y coreteam quiero eliminar un evento
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When voy a presionar el boton eliminar de la tarjeta "EventoPrueba"
        And presiono el boton de confirmar para eliminar "EventoPrueba"
        Then no deberia poder ver la tarjeta "EventoPrueba"
        Examples:
            | correo               | contrasena |
            | 'lider@gmail.com'    | 123456     |
            | 'coreteam@gmail.com' | 123456     |
    @maximize
    @crearEventoFuturo
    @eliminarEvento
    Scenario: Como coreteam quiero ver los detalles en un evento
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When presiono el boton de detalles en el evento "EventoPrueba"
        Then deberia ver
            | horaIn      | Hora Inicio: 13:30             |
            | fecha       | Fecha: 2023-12-12              |
            | proyecto    | Proyecto: Ninguno              |
            | horaFin     | Hora Fin: 16:30                |
            | lugar       | Lugar: CBBA                    |
            | categoria   | Categoría: Todas               |
            | descripcion | Descripción:descripcion prueba |
        Examples:
            | correo               | contrasena |
            | 'lider@gmail.com'    | 123456     |
            | 'coreteam@gmail.com' | 123456     |