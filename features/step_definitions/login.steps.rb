require './features/page_object_model/HomePage.rb'
require './features/page_object_model/Login.rb'

$homepage=-1
$login=-1

Given('Estoy en la pagina de inicio de Start') do
    page.driver.browser.manage.window.maximize
    visit('https://testing-start.web.app/')
    $home = HomePage.new(page)
    expect($home.exist_the_tittle('Inicio')).to be true
end

Given('Hago click en el boton {string}') do |btn_iniciar_sesion|
    click_on (btn_iniciar_sesion)
    #$login=Login.new(page)
    sleep 1
end

When('Ingreso el campo correo {string}') do |correo|
    fill_in 'email', :with => correo
end

When('Ingreso la campo contraseña {string}') do |password|
    fill_in 'password', :with => password
end

When('Hago click {string}') do |btn_iniciar_sesion|
    click_on (btn_iniciar_sesion)
    sleep 1
end 

Then('se muestra en la pantalla en la parte superior derecha {string} indicando mis iniciales') do |name_init|
    expect(page).to have_selector("span",text:name_init)
end

Then('se muestra una alerta en la parte superior que dice {string}') do |errorMessage|
    page.has_content?(errorMessage)
end

Then('se muestra un un mensaje debajo del campo correo {string}') do |errorMessage|
    page.has_content?(errorMessage)
end 



#************************************************************
#************************************************************
#************************************************************
#************************************************************

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