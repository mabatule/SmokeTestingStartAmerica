# Proyecto Final de Calidad de Sistemas SmokeTestingStartAmerica
![LOGO_2020_2 0_STARTER_Horizontal-01-01-1](https://user-images.githubusercontent.com/74753713/172522628-2a26dfa7-dcc2-4916-a100-13e4861650c0.jpg)


# Herramientas
- Ruby
- Cucumber
- Capybara

## NOMBRES 📋
* Juan Luis Canedo Villarroel
* Bernardo Claure Acevey
* Mauricio Balderrama Ali

### IMPORTANTE!🔨

* Clonar desde el repositorio principal usando: 

	- git clone https://github.com/mabatule1999/SmokeTestingStartAmerica.git
	
* Reporte de ejecución de las pruebas en Html se encuentran en este repositorio en la carpeta de ResultHtml

### Introducción
Tras la realización de las pruebas de caja negra en la aplicación web de Start vimos que la ejecución de los casos de prueba de manera manual era una tarea exhaustiva y que en un futuro esta tarea no sería sostenible debido al incremento de funcionalidades en la aplicación y las limitaciones de tiempo por lo cual vimos que debe existir una automatización de estas que ayuden a garantizar la exactitud y la estabilidad del software

### Start WebApp
Start WebApp es la página web sobre la cual se realizaron las pruebas de exploratory testing y  caja negra, esta página web tiene la finalidad de brindar ayuda en la gestión de los recursos que se manejan dentro de la institución de Start como sus eventos, proyectos y voluntarios de manera que el impacto social pueda ser más difundido y mejor manejado desde la aplicación
Esta página web está en constante producción en la asignatura de “Taller de desarrollo de software” por lo cual es necesario realizar las pruebas con la misma constancia en la que se desarrolla brindando así un producto de beneficio y calidad.

### Objetivos
Priorizar las funcionalidades principales para garantizar el funcionamiento básico de la aplicación
Realizar la automatización de las pruebas utilizando las herramientas Cucumber y Capybara
Simplificar el trabajo innecesario, repetitivo o complejo haciéndolo efectivo y más productivo


## Enlaces

#### Enlace del repositorio
#### https://github.com/mabatule1999/SmokeTestingStartAmerica.git
#### Enlace de trello
#### https://trello.com/invite/b/8EljAcxV/592ce8023ba1fa054a0ed2556a87c01f/starttestautomatitation
#### Enlace de la presentacion
#### https://docs.google.com/presentation/d/1uXSzMU_SYSx14zmdkEUo0pYsuPSx8MaHSbMO-elghkw/edit?usp=sharing
#### Enlace informe tecnico
#### https://docs.google.com/document/d/1qw08evzl4Xv_4EBppWlwlq0P18V-IVV8SjuQqJZqETE/edit?usp=sharing


## Enlaces Externos
#### Ruby (version ruby 3.0.2p107)
#### https://www.ruby-lang.org/es/downloads/

#### Instalacion de gemas

gem install cucumber
gem install capybara
gem install page-object

### Instalacion de los drivers para navegar.
#### Chrome Selenium (revisar la version de chrome que se tenga Options -> Settings -> About Chrome)
#### https://chromedriver.chromium.org/downloads

### Run Tests:
    cucumber features


### Resultados en HTML:
Para general el los resultados siga las instrucciones
Comando:
para utilizar el informe generado en html puede ingresar la siguiente manera como esta descrito en la tabla
| insert module            | name module html             |
| -------------            | -------------                |
| coreTeamProyectosSteps   | coreTeamProyectosSteps_html  |
| cuenta                   | cuenta_html                  |
| eventos                  | eventos_html                 |
| liderVoluntarioProyectos | liderVoluntarioProyectos_html|
| login                    | login_html                   |
        
  cucumber features\***(insert module)***.feature -f html -o ***(name module html)***.html
    Ejemplo:
    cucumber features\eventos.feature -f html -o eventosTests.html
