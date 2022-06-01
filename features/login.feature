Feature: Realizar operaciones sobre el login 
    Yo quiero 
    Como usuario voluntario
    Quiero probar las funcionalidades de iniciar sesion


Scenario: Quiero iniciar sesion como voluntario      
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar mis credenciales "voluntario@gmail.com" en usuario y "123456" en password
Then voy a presionar el boton "Iniciar sesion" 
And se muestra en la pantalla en la parte derecha "VV" indicando mis iniciales 

Scenario: Quiero iniciar sesion como voluntario con passaword incorrecto
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar mis credenciales "voluntario@gmail.com" en usuario y "123456" en password como incorrecto
Then voy a presionar el boton "Iniciar sesion" 
And se muestra una alerta en la parte superior que dice "Correo o contraseña inválidos."

Scenario: Quiero iniciar sesion con usuario incorrecto
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar mis credenciales incorrectas "testAcme@gmail.com" en usuario y "123456" en password
Then voy a presionar el boton "Iniciar sesion" 
And se muestra una alerta en la parte superior que dice "Correo o contraseña inválidos."

Scenario: Quiero iniciar sesion con usuario y password incorrecto
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar con usuario y passaword incorrectos "testAcme@gmail.com" y "1234567"
Then voy a presionar el boton "Iniciar sesion" 
And se muestra una alerta en la parte superior que dice "Correo o contraseña inválidos."

Scenario: Quiero iniciar sesion con el campo usuario vacio
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar las credenciales "" en usuario y "1234567" en passaword
Then se muestra un un mensaje debajo del campo correo "Campo requerido"

Scenario: Quiero iniciar sesion con el campo password vacio
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar las credenciales "voluntario@gmail.com" en usuario y "" en passaword
Then se muestra un un mensaje debajo del campo passaword "Campo requerido"


Scenario: Quiero iniciar sesion con el campo usuario y password vacios
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar las credenciales "" en usuario y "" en passaword
Then se muestra un un mensaje debajo del campo correo "Campo requerido"
And se muestra un un mensaje debajo del campo passaword "Campo requerido"

Scenario: Quiero iniciar sesion como Lider      
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar mis credenciales "lider@gmail.com" en usuario y "123456" en password
Then voy a presionar el boton "Iniciar sesion" 
And se muestra en la pantalla en la parte derecha "LL" indicando mis iniciales 

Scenario: Quiero iniciar sesion como CoreTeam      
Given Estoy en la pagina de inicio de Start
And Hago click en el boton "Iniciar Sesión"
When Ingresar mis credenciales "coreteam@gmail.com" en usuario y "123456" en password
Then voy a presionar el boton "Iniciar sesion" 
And se muestra en la pantalla en la parte derecha "CT" indicando mis iniciales 

