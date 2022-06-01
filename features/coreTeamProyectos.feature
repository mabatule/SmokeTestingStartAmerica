Feature: coreTeam Demo Start
    Como CoreTeam de Start
    Deseo poder administrar los proyectos de Start
    Para poder realizar tareas con estos


Background: Background name: Iniciar sesion en Start desde la cuenta de un CoreTeam
    Given Estoy en la pagina de iniciar sesion de Start
    When Ingreso "coreteam@gmail.com" en el campo de correo para iniciar sesion
    And Ingreso "123456" en el campo de contraseña para iniciar sesion
    And Presiono el boton de Iniciar sesión
    Then Deberia ver una barra de opciones y seccion de eventos proximos en la pagina principal

Scenario: Ver lista de categoria de proyectos
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos

Scenario: Ingresar a una categoria de proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes 
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'

Scenario: Ver lista de participantes de un proyecto en especifico
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme la lista de participantes de un proyecto

Scenario: Ver eventos de un proyecto en especifico
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme los eventos relacionados a un proyecto

Scenario: Dejar de participar en un proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    And Selecciono boton de dejar de participar en proyecto
    Then Deberia mostrarme un boton de Participar en proyecto


#Scenario: Ver detalles de un proyecto en especifico
#    Given Estoy en la seccion de proyectos de start
#    When Ingreso deberia ver una lista de la categoria de proyectos
#    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
#    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
#    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
#    Then Deberia mostrarme los detalles del proyecto
#        |objetivo:       |Probar|
#        |fecha_inicio:   |2022-12-05 |
#        |fecha_fin:      |En Progreso |
#        |descripcion:    |Prueba 1-6|
#        |lider:          |KEVIN DIEGO |
#        |categoria:      |Medio Ambiente|


Scenario: Participar solo en proyectos vigentes
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono unirme en el primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme en el card un mensaje de que estoy participando en el proyecto

Scenario: Eliminar un proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme los detalles relacionados a un proyecto
    Then Deberia mostrarme los eventos relacionados a un proyecto
    And Hago click en el boton de eliminar 
    Then Deberia mostrar una ventana de confirmacion para eliminar proyecto
    And Hago click en eliminar
    Then Devuelve categorias de proyectos 

Scenario: Editar datos de un proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono el boton de editar el primer proyecto
    Then Deberia mostrarme un modal formulario 
    And Edito los datos existentes del proyecto que estan en los campos del modal
        |titulo         |Proyecto Editado |
        |objetivo       |Probar la funcionalidad de editar |
        |descripcion    |Proyecto prueba descriptivo |
        |fecha_inicio   |2022-05-31 |
        |fecha_fin      |2022-06-31 |
        |url_imagen     |https://adictec.com/media/2018/10/Mejores-herramientas-para-pruebas-testing-de-software.jpg |
    And presiono el boton de guardar cambios
    #Then Compruebo que minimamente el titulo "Proyecto Editado" este en el proyecto modificado

Scenario: Crear un nuevo proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de la categoria de proyectos
    And Selecciono el boton de crear proyecto
    When Me muestra un formulario modal donde me pide ingresar datos
    And lleno los datos del nuevo proyecto
        |fecha_inicio   |02-04-2022 |
        |fecha_fin      |02-05-2022 |
        |titulo         |El agua es oro|
        |descripcion    |Proyecto que fortalece conocimientos para ahorrar agua |
        |objetivo       |Crear conciencia del uso del agua |
        |image_url      |https://adictec.com/media/2018/10/Mejores-herramientas-para-pruebas-testing-de-software.jpg |
    And presiono el boton de guardar cambios crear proyecto
    #Then Compruebo que minimamente el titulo "Proyecto Editado" este en el proyecto modificado

