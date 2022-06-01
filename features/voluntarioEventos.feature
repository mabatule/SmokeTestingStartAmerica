Feature:Realizar operaciones sobre eventos
    Yo quiero
    Como voluntario registrado
    Quiero probar las funcionalidades de eventos

    Scenario: Quiero iniciar sesion como voluntario
        Given estoy en la pagina de inicio de Start
        When ingreso los campos necesarios para iniciar sesion
            | Correo:     | voluntario@gmail.com |
            | Contraseña: | 123456               |
        Then voy a presionar el boton "Iniciar sesion"
        And se muestra en la pantalla en la parte derecha "VV" indicando mis iniciales

    Scenario: Quiero ver los eventos vigentes
        Given estoy en la pagina de inicio de Start
        And ingreso los campos necesarios para iniciar sesion
            | Correo:     | voluntario@gmail.com |
            | Contraseña: | 123456               |
        And voy a presionar el boton "Iniciar sesion"
        When voy a presionar en la cabecera el boton eventos
        Then se muestra en la pantalla un titulo de "EVENTOS VIGENTES"
        And deberia poder ver la tarjeta "Prueba"

    Scenario: Como voluntario quiero ver los eventos pasados
        Given estoy en la pagina de inicio de Start
        And ingreso los campos necesarios para iniciar sesion
            | Correo:     | voluntario@gmail.com |
            | Contraseña: | 123456               |
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When voy a presionar el boton de Eventos Pasados
        Then muestra un titulo de "EVENTOS PASADOS"
        And deberia poder ver la tarjeta "EventoPasado"

    Scenario: Como voluntario quiero filtrar los eventos por categoria
        Given estoy en la pagina de inicio de Start
        And ingreso los campos necesarios para iniciar sesion
            | Correo:     | voluntario@gmail.com |
            | Contraseña: | 123456               |
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When elijo la categoria "Educacion" en el dropdown
        Then deberia poder ver la tarjeta "PruebaEducacion"

    Scenario: Como voluntario quiero participar en un evento
        Given estoy en la pagina de inicio de Start
        And ingreso los campos necesarios para iniciar sesion
            | Correo:     | voluntario@gmail.com |
            | Contraseña: | 123456               |
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When presiono el boton de participar en el evento "Prueba"
        Then el boton de participar  en el evento "Prueba" cambia a dejar de participar

    Scenario: Como voluntario quiero dejar de participar en un evento
        Given estoy en la pagina de inicio de Start
        And ingreso los campos necesarios para iniciar sesion
            | Correo:     | voluntario@gmail.com |
            | Contraseña: | 123456               |
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When presiono el boton de dejar de participar en el evento "Prueba"
        Then el boton de dejar de participar en el evento "Prueba" cambia a participar

    Scenario: Como voluntario quiero ver los detalles en un evento
        Given estoy en la pagina de inicio de Start
        And ingreso los campos necesarios para iniciar sesion
            | Correo:     | voluntario@gmail.com |
            | Contraseña: | 123456               |
        And voy a presionar el boton "Iniciar sesion"
        And voy a presionar en la cabecera el boton eventos
        When presiono el boton de detalles en el evento Prueba
        Then deberia ver
            | horaIn      | Hora Inicio: 03:30         |
            | fecha       | Fecha: 2022-12-12          |
            | proyecto    | Proyecto: Ninguno          |
            | horaFin     | Hora Fin: 16:30            |
            | lugar       | Lugar: CBBA                |
            | categoria   | Categoría: Medio ambiente  |
            | descripcion | Descripción:ayuda a perros |