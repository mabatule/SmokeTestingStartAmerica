Feature: Realizar operaciones sobre el login 
    Yo quiero 
    Como usuario voluntario
    Quiero probar las funcionalidades de iniciar sesion

    Background: Ingresar a la pagina de estart
        Given estoy en la pagina de inicio de Start
#        And Hago click en el boton "Iniciar Sesión"

Scenario: Quiero explorar proyectos
Given Estoy en la pagina de inicio de Start
And Hago click en "Explora nuestros proyectos"
Then muestra para iniciar sesion con el mensaje de Star "Incubadora de proyectos sociales y ambientales"

Scenario: Quiero iniciar sesion      
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena> 
When Hago click "Iniciar Sesión" 
Then se muestra en la pantalla en la parte superior derecha <iniciales> indicando mis iniciales
Examples:
            | correo                 | contrasena   | iniciales |
            | 'lider@gmail.com'      | '123456'     | 'LL'      |
            | 'coreteam@gmail.com'   | '123456'     | 'CT'      |
            | 'voluntario@gmail.com' | '123456'     | 'VV'      |


Scenario: Quiero iniciar sesion con passaword incorrecto
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena> 
When Hago click "Iniciar Sesión" 
Then se muestra una alerta en la parte superior que dice "Correo o contraseña inválidos."
Examples:
            | correo                 | contrasena   |
            | 'lider@gmail.com'      | '1234567'    |
            | 'coreteam@gmail.com'   | '123456'     |
            | 'voluntario@gmail.com' | '123456'     |
Scenario: Quiero iniciar sesion con usuario incorrecto
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena> 
When Hago click "Iniciar Sesión" 
Then se muestra una alerta en la parte superior que dice "Correo o contraseña inválidos."
Examples:
            | correo                 | contrasena   |
            | 'testAcme@gmail.com'   | '123456'     |
            | 'test2Ac@gmail.com'    | '123456'     |


Scenario: Quiero iniciar sesion con usuario y password incorrecto
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena> 
When Hago click "Iniciar Sesión" 
Then se muestra una alerta en la parte superior que dice "Correo o contraseña inválidos."
Examples:
            | correo                 | contrasena   |
            | 'testAcme@gmail.com'   | '000000'     |
            | 'test2Acme@gmail.com'  | '999999'     |

Scenario: Quiero iniciar sesion con el campo usuario vacio
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena> 
Then se muestra un un mensaje debajo del campo correo "Campo requerido"
Examples:
            | correo                 | contrasena   |
            | ''                     | '000000'     |
            | '        '             | '999999'     |#podria ser bug 

Scenario: Quiero iniciar sesion con el campo password vacio
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena> 
Then se muestra un un mensaje debajo del campo correo "Campo requerido"
Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | ''         |
            | 'coreteam@gmail.com'   | ''         |
            | 'voluntario@gmail.com' | ''         |

Scenario: Quiero iniciar sesion con el campo usuario y password vacios
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena> 
Then se muestra un un mensaje debajo del campo correo "Campo requerido"
Examples:
            | correo                 | contrasena |
            | ''                     | ''         |


Scenario: Quiero cerrar sesion
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena>
When Hago click "Iniciar Sesión"
And Hago click en mi perfil
And Cerrar sesion con el boton "Logout"
Then se muestra un un mensaje de la pagina principal "Una experiencia personalizada de volutariado para impulsar líderes de impacto positivo. Explora causas y descubre la tuya, obtén un récord de tu participación activa, y acumula horas y experiencias de voluntariado."
Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | '123456'   |
            | 'coreteam@gmail.com'   | '123456'   |
            | 'voluntario@gmail.com' | '123456'   |

Scenario: Quiero ver los detalles de un evento y cerrar sesion 
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
And Ingreso el campo correo <correo>
And Ingreso la campo contraseña <contrasena>
When Hago click "Iniciar Sesión"
And Hago click en proyectos
And Entro a la categoria "Medio Ambiente"
And Entro al primer proyecto
And Hago click en mi perfil
And Cerrar sesion con el boton "Logout"
Then se muestra un un mensaje de la pagina principal "Una experiencia personalizada de volutariado para impulsar líderes de impacto positivo. Explora causas y descubre la tuya, obtén un récord de tu participación activa, y acumula horas y experiencias de voluntariado."
Examples:
            | correo                 | contrasena |
            | 'lider@gmail.com'      | '123456'   |
            | 'coreteam@gmail.com'   | '123456'   |
            | 'voluntario@gmail.com' | '123456'   |

