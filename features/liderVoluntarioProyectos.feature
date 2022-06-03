Feature:Realizar operaciones que involucren los roles de lideres y voluntarios sobre proyectos
    Como Lider/Voluntario de Start
    Deseo realizar operaciones con los proyectos de Start para
    Poder satisfacer mis necesidades

    
    Background: Ingresar a la pagina de estart
        Given estoy en la pagina de inicio de Start


    @maximize
    Scenario: Ver lista de participantes de un proyecto en especifico
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        And se muestra en la pantalla en la parte derecha <iniciales> indicando mis iniciales
        Given Estoy en la seccion de proyectos de start
        When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
        And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
        When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
        And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
        Then Deberia mostrarme la lista de participantes de un proyecto
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |

    
    Scenario: Ver eventos de un proyecto en especifico
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        And se muestra en la pantalla en la parte derecha <iniciales> indicando mis iniciales
        Given Estoy en la seccion de proyectos de start
        When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
        And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
        When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
        And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
        Then Deberia mostrarme los eventos relacionados a un proyecto
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |

    

    @crearProyecto
    @eliminarProyecto
    Scenario: Dejar de participar en un proyecto
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        And se muestra en la pantalla en la parte derecha <iniciales> indicando mis iniciales
        Given Estoy en la seccion de proyectos de start
        When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
        And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
        When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
        And Selecciono unirme en el ultimo proyecto de la categoria Medio Ambiente
        And Selecciono ver detalles del ultimo proyecto de la categoria Medio Ambiente
        And Selecciono boton de dejar de participar en proyecto
        Then Deberia mostrarme un boton de Participar en proyecto
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |



    @crearProyecto
    @eliminarProyecto
    Scenario: Participar solo en proyectos vigentes
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        Given Estoy en la seccion de proyectos de start
        When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
        And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
        When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
        And Selecciono unirme en el ultimo proyecto de la categoria Medio Ambiente
        Then Deberia mostrarme en el card un mensaje de que estoy participando en el proyecto
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |


    @crearProyecto
    @eliminarProyecto
    Scenario: Ver detalles de un proyecto en especifico
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        Given Estoy en la seccion de proyectos de start
        When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
        And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes
        When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
        And Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
        Then Deberia mostrarme los detalles relacionados a un proyecto
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |

    @crearProyecto
    @eliminarProyecto
    Scenario: Ingresar a una categoria de proyecto
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        Given Estoy en la seccion de proyectos de start
        When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
        And Selecciono la categoria de "Medio Ambiente" de los proyectos existentes 
        When Me muestra los proyectos pertenencientes a la categoria de 'Medio ambiente'
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |


    Scenario: Ver lista de categoria de proyectos
        Given ingreso el correo <correo>
        And ingreso la contraseña <contrasena>
        Then voy a presionar el boton "Iniciar sesion"
        Given Estoy en la seccion de proyectos de start
        When Ingreso deberia ver una lista de las 8 categorias principales de proyectos
        Examples:
            | correo                 | contrasena | iniciales |
            | 'lider@gmail.com'      | 123456     | 'LL'      |
            | 'voluntario@gmail.com' | 123456     | 'VV'      |
