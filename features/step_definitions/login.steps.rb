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

Then('Hago click en {string}') do |button_proyectos|
    #click_on(button_proyectos)
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/section/div[1]/div/div[2]/button[2]').click
end

Then('muestra para iniciar sesion con el mensaje de Star {string}') do |message|
    #page.has_content?(message)
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[1]/h2')
end

When('Hago click en mi perfil') do
    find(:xpath,'//*[@id="root"]/div[2]/header/div[1]/div[3]/div/div').click
    sleep 2
end
When('Cerrar sesion con el boton {string}') do |button_logout|
    click_on (button_logout)
    sleep 2
end
Then('se muestra un un mensaje de la pagina principal {string}') do |message|
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/section/div[1]/div/div[1]/p')
    sleep 2
end

When("Hago click en proyectos") do 
    find(:xpath,'/html/body/div/div[2]/header/div[2]/div/button[2]').click
    sleep 2
end

When("Entro a la categoria {string}") do |nameCategoria|
    find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div/div/a/button').click
    sleep 2
end
When("Entro al primer proyecto") do 
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div[1]/div[2]/div[2]/a').click
    sleep 2

end