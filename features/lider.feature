Feature:Realizar operaciones sobre eventos 
 Yo quiero 
 Como usuario lider registrado
 Quiero probar las funcionalidades de eventos

Scenario: Quiero iniciar sesion como lider      
  Given estoy en la pagina de inicio de Start
  When ingreso los campos necesarios para iniciar sesion 
	|Correo: 	    |lider@gmail.com         |
  |Contraseña: 	    |123456              |
  Then voy a presionar el boton "Iniciar sesion" 
  And se muestra en la pantalla en la parte derecha "LL" indicando mis iniciales

  Scenario: Quiero ver los eventos vigentes     
  Given que se inicio sesion como lider
  Then voy a presionar en la cabecera el boton "eventos" 
  And se muestra en la pantalla un titulo de "EVENTOS VIGENTES"

  Scenario: Como lider quiero ver los eventos pasados
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton "eventos" 
  When voy a presionar el boton de Eventos Pasados
  Then muestra un titulo de "EVENTOS PASADOS"
  
  Scenario: Como lider quiero participar en un evento
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton "eventos" 
  When presiono el boton de participar en el evento "Prueba"
  Then el boton de participar  en el evento "Prueba" cambia a dejar de participar

  Scenario: Como lider quiero dejar de participar en un evento
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton "eventos" 
  When presiono el boton de dejar de participar en el evento "Prueba"
  Then el boton de participar  en el evento "Prueba" cambia a participar

  Scenario: Como lider quiero ver los detalles en un evento
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton "eventos" 
  When presiono el boton de detalles en el evento "Prueba"
  Then deberia ver 
    |horaIn    |15:30 |
    |fecha   |2022-12-01 |	  
    |proyecto    |ninguno |
    |horaFin    |16:30 |
    |lugar   |CBBA |	  
    |categoria    |Medio ambiente |
    |descripcion    |descripcion prueba |
    
  Scenario: Como lider quiero crear un evento
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton "eventos" 
  When presiono el boton de crear evento
  And lleno los campos necesarios para crear un evento
    |nombre    |Test |
    |fecha   |10/10/2022 |
  And presiono el boton para guardar el evento 
  Then deberia poder ver la tarjeta "Prueba"

  Scenario: Como lider quiero validar que existen campos minimos para crear un evento
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton "eventos" 
  When presiono el boton de crear evento
  And presiono el boton para guardar el evento 
  Then deberia poder ver una alerta

  Scenario: Como lider quiero validar que existe la tarjeta Prueba al ingresar a los eventos
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton "eventos" 
  Then deberia poder ver la tarjeta "Prueba"
  
  Scenario: Como lider quiero eliminar un evento
  Given que se inicio sesion como lider
  And voy a presionar en la cabecera el boton eventos 
  And voy a presionar el boton eliminar de la tarjeta "Prueba2"
  And presiono el boton de confirmar para eliminar "Prueba2" 
  Then no deberia poder ver la tarjeta "Prueba2"