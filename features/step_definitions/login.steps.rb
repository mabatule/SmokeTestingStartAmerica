#************************************************************
# Quiero iniciar sesion como voluntario
#************************************************************
Given('Estoy en la pagina de inicio de Start') do
    page.driver.browser.manage.window.maximize
    visit('https://testing-start.web.app/')
end
Given('Hago click en el boton {string}') do |btn_iniciar_sesion|
    click_on (btn_iniciar_sesion)
    sleep 1
end
When('Ingresar mis credenciales {string} en usuario y {string} en password') do |email,password|
    fill_in "email", with:email
    fill_in "password", with:password
    sleep 1.5
end
When('Hago click en {string}') do |btn_iniciar_sesion|
    click_on (btn_iniciar_sesion)
    sleep 1
end 

Then('se muestra en la pantalla en la parte derecha {string} indicando mis iniciales voluntario') do |name_init|
    expect(page).to have_selector("h2",text:name_init)
end
#************************************************************
# Quiero iniciar sesion como voluntario con passaword incorrecto
#************************************************************
When('Ingresar mis credenciales {string} en usuario y {string} en password como incorrecto') do |email,password|
    fill_in "email", with:email
    fill_in "password", with:password
    sleep 1.5
end
When('Hago click en {string}') do |btn_iniciar_sesion|
    click_on (btn_iniciar_sesion)
    sleep 1
end 

Then('se muestra una alerta en la parte superior que dice {string}') do |errorMessage|
    page.has_content?(errorMessage)
end
#************************************************************
#Quiero iniciar sesion con usuario incorrecto
#************************************************************

When('Ingresar mis credenciales incorrectas {string} en usuario y {string} en password') do |email,password|
    fill_in "email", with:email
    fill_in "password", with:password
    sleep 1.5
end
When('Hago click en {string}') do |btn_iniciar_sesion|
    click_on (btn_iniciar_sesion)
    sleep 1
end 

#************************************************************
#Quiero iniciar sesion con usuario y password incorrecto
#************************************************************
When('Ingresar con usuario y passaword incorrectos {string} y {string}') do |email,password|
    fill_in "email", with:email
    fill_in "password", with:password
    sleep 1.5
end
When('Hago click en {string}') do |btn_iniciar_sesion|
    click_on (btn_iniciar_sesion)
    sleep 1
end 

#************************************************************
#Quiero iniciar sesion con el campo usuario vacio
#************************************************************
When('Ingresar las credenciales {string} en usuario y {string} en passaword') do |email,password|
    fill_in "email", with:email
    fill_in "password", with:password
    sleep 1.5
end
Then('se muestra un un mensaje debajo del campo correo {string}') do |errorMessage|
    page.has_content?(errorMessage)
end 

#************************************************************
#Quiero iniciar sesion con el campo password vacio
#************************************************************

#When('Ingresar las credenciales {string} en usuario y {string} en passaword') do |email,password|
#    fill_in "email", with:email
#    fill_in "password", with:password
#    sleep 1.5
#end
Then('se muestra un un mensaje debajo del campo passaword {string}') do |errorMessage|
    page.has_content?(errorMessage)
end 

#************************************************************
#Quiero iniciar sesion con el campo usuario y password vacios
#************************************************************

#When('Ingresar las credenciales {string} en usuario y {string} en passaword') do |email,password|
#    fill_in "email", with:email
#    fill_in "password", with:password
#    sleep 1.5
#end

#Then('se muestra un un mensaje debajo del campo passaword {string}') do |errorMessage|
#    page.has_content?(errorMessage)
#end 

#************************************************************
#Quiero iniciar sesion como Lider 
#************************************************************

#************************************************************
#Quiero iniciar sesion como CoreTeam 
#************************************************************
