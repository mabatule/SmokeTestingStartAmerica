Feature: Realizar operaciones sobre el login 
    Yo quiero 
    Como usuario voluntario
    Quiero probar las funcionalidades de iniciar sesion

    Background: Ingresar a la pagina de estart
        Given estoy en la pagina de inicio de Start
#        And Hago click en el boton "Iniciar Sesión"



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
