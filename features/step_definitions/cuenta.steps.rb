Given('estoy en la pagina de inicio de sesion de Start') do
    page.driver.browser.manage.window.maximize
    visit('https://testing-start.web.app/login')
end
Given('Ingresar el campo del correo {string}') do |correo|
    fill_in 'email', :with => correo
end
Given('Ingresar en el campo de contraseña {string}') do |password|
    fill_in 'password', :with => password
end
Given('Hare click en el boton {string}') do |button|
    click_button(button)
    sleep(2)
end
Given('Se muestra una cabecera con Inicio, Proyectos, Eventos y Cuenta') do
    find(:css,'#root > div:nth-child(2) > header > div.header-menu > div')
end
When('voy a hacer click en el boton Cuenta de la cabecera') do 
    find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(4)').click
    
end
Then('Ver la tarjeta en mis Eventos de {string}') do |tittle|
    page.has_content?(tittle)
end

Then('Ver en la parte de mis cuentas que muestra un mensaje {string}') do |message|
    find(:css,'#scrollable-auto-tab-0').click
end
When('Ver en mis Eventos que exista el evento que participo') do
    page.has_content?('EventoPrueba')
end
When('hare click en mis proyectos') do
    find(:css,'#scrollable-auto-tab-1').click
end
Then('vere mi proyecto en el que participe {string}') do |tittle|
    page.has_content?(tittle)
end

When('hare click en mis Logros') do
    find(:css,'#scrollable-auto-tab-2').click
end
Then('vere mis logros') do
    page.has_content?('Trabajo en Equipo')
    page.has_content?('Compromiso')
    page.has_content?('Creatividad')
    page.has_content?('Proactividad')

end
When('hare click en mi estado') do
    find(:css, "input[class$='jss126 MuiSwitch-input']")
end

When('hare click en un proyecto') do
    find(:css, "#scrollable-auto-tabpane-1 > div > span > div > div.jss54 > div:nth-child(1)").click
end
#When('Hare click en el evento para  ver los detalles') do
#    page.has_content?(message)
#    sleep(10)
#end