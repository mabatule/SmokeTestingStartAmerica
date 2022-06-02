
After do 
    Capybara.current_session.driver.quit
end

After '@eliminarEvento' do 
  iniciarSesion
  find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)').click
  click_button('Eliminar_EventoPrueba')
  sleep(2)
  click_button('eliminareventoEventoPrueba')
  sleep(2)
  Capybara.current_session.driver.quit
end
After '@eliminarEventoPasado' do 
  iniciarSesion
  find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)').click
  find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div:nth-child(1) > div.Menu-Bar-Evento > div.header-botones-eventos > button:nth-child(2)').click
  click_button('Eliminar_EventoPasadoHook')
  sleep(2)
  click_button('eliminareventoEventoPasadoHook')
  sleep(2)
  Capybara.current_session.driver.quit
end
Before '@maximize' do
  page.driver.browser.manage.window.maximize
end
Before '@crearEventoFuturo' do
  iniciarSesion
  find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)').click
  crearEvento('12/12/2023','EventoPrueba')
  sleep(2)
  Capybara.current_session.driver.quit
end
Before '@crearEventoConCategoria' do
  iniciarSesion
  find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)').click
  crearEvento('12/12/2023','EventoPrueba','Empoderamiento')
  sleep(2)
  Capybara.current_session.driver.quit
end
Before '@crearEventoPasado' do
  iniciarSesion
  find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)').click
  crearEvento('10/10/2020','EventoPasadoHook')
  sleep(2)
  Capybara.current_session.driver.quit
end
def crearEvento(fecha,nombre,categoria="Todas")
  click_button('crear_evento')
  fill_in 'nombre_evento', :with => nombre
  fill_in 'fecha_evento', :with => fecha
  fill_in 'hora_inicio', :with => '13:30'
  fill_in 'hora_fin', :with => '16:30'
  fill_in 'descripcion_evento', :with => 'descripcion prueba'
  fill_in 'lugar_evento', :with => 'CBBA'
  find(:css,'#ModalFormCrearEvento > div > form > div:nth-child(8) > div:nth-child(2) > select').find(:option, categoria).select_option
  click_button('GuardarEvento')
end
def iniciarSesion
  visit('https://testing-start.web.app/login')
  fill_in 'email', :with => 'lider@gmail.com'
  fill_in 'password', :with => '123456'
  find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div[2]/div/form/div/button').click
end 

