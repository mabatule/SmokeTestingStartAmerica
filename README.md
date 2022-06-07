# Proyecto Final de Calidad de Sistemas SmokeTestingStartAmerica
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


### Page Object Model:
Generate result in HTML format 
Comando:
para utilizar el informe generado en html puede ingresar la siguiente manera
| <insert module> | <name module> |
| ------------- | ------------- |
| Contenido de la celda  | Contenido de la celda  |
| Contenido de la celda  | Contenido de la celda  |
    rspec <insert module>.rb --format html --out <name module>.html
    Ejemplo:
    rspec login.rb --format html --out login.html
