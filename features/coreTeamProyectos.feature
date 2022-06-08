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
    Then se muestra en la pantalla en la parte derecha "CT" indicando mis iniciales




Scenario: Ver lista de participantes de un proyecto en especifico
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme la lista de participantes de un proyecto

Scenario: Ver eventos de un proyecto en especifico
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme los eventos relacionados a un proyecto


@maximize
@crearProyecto
Scenario: Dejar de participar en un proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono unirme en un proyecto de la categoria Medio Ambiente
    And Selecciono ver detalles de un proyecto de la categoria Medio Ambiente
    And Selecciono boton de dejar de participar en proyecto
    Then Deberia mostrarme un boton de Participar en proyecto


@maximize
@crearProyecto
Scenario: Participar solo en proyectos vigentes
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono unirme en un proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme en el card un mensaje de que estoy participando en el proyecto
    
@maximize
@crearProyecto
Scenario: Editar datos de un proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono el boton de editar el ultimo proyecto
    Then Deberia mostrarme un modal formulario 
    And Edito los datos existentes del proyecto que estan en los campos del modal
        |titulo         |Proyecto Editado |
        |objetivo       |Probar la funcionalidad de editar |
        |descripcion    |Proyecto prueba descriptivo |
        |fecha_inicio   |2022-05-31 |
        |fecha_fin      |2022-06-31 |
        |url_imagen     |https://adictec.com/media/2018/10/Mejores-herramientas-para-pruebas-testing-de-software.jpg |
    And presiono el boton de guardar cambios
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme los detalles relacionados a un proyecto
    Then Compruebo que minimamente la descripcion del proyecto "Descripción: Proyecto automatizado editado" este en el proyecto modificado

Scenario: Eliminar un proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme los detalles relacionados a un proyecto
    Then Deberia mostrarme los eventos relacionados a un proyecto
    And Hago click en el boton de eliminar 
    Then Deberia mostrar una ventana de confirmacion para eliminar proyecto
    And Hago click en eliminar
    Then Devuelve categorias de proyectos 

Scenario: Ver detalles de un proyecto en especifico
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
    And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
    Then Deberia mostrarme los detalles relacionados a un proyecto

Scenario: Ingresar a una categoria de proyecto
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes 
    When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'

@maximize
@crearProyecto
@eliminarProyecto
Scenario: Crear un nuevo proyecto
    Given Estoy en la seccion de proyectos de start
    And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
    Then Compruebo que minimamente el titulo "El agua es oro por siempre" este en el proyecto nuevo

Scenario: Ver lista de categoria de proyectos
    Given Estoy en la seccion de proyectos de start
    When Ingreso deberia ver una lista de las 8 categorias principales de proyectos



