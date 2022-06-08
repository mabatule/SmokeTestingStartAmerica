# Proyecto Final de Calidad de Sistemas SmokeTestingStartAmerica

![LOGO_2020_2 0_STARTER_Horizontal-01-01-1](https://user-images.githubusercontent.com/74753713/172521905-cdc4f37b-0534-4622-87bd-a29b0fdf254b.jpg)

# Herramientas

- Ruby
- Cucumber
- Capybara


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
