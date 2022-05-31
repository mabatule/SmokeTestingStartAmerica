Given('estoy en la pagina de inicio de Start') do
    page.driver.browser.manage.window.maximize
     visit('https://testing-start.web.app/login')
  end
  
  When('ingreso los campos necesarios para iniciar sesion') do |table|
    fill_in 'email', :with => ENV['USER']
    fill_in 'password', :with => ENV['PSW']
end
  
  Then('voy a presionar el boton {string}') do |string|
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div[2]/div/form/div/button').click
  end
  Then('se muestra en la pantalla un texto de {string}') do |string|
    titleText=find(:xpath,'//*[@id="root"]/div[2]/div[1]/section/div[1]/div[1]/h2')
    if titleText.text != string
    	raise "deberia haber un titulo de tus proximos eventos"	
    end
  end
  Then('se muestra en la pantalla un titulo de {string}') do |string|
    titleText=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[1]/div[1]/div[2]/h1[1]/h3')
    if titleText.text != string
    	raise "deberia haber un titulo de eventos vigentes"	
    end
  end
  Given('que se inicio sesion como lider') do
    visit('https://testing-start.web.app/login')
    fill_in 'email', :with => ENV['USER']
    fill_in 'password', :with => ENV['PSW']
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div[2]/div/form/div/button').click
  end
  Then('voy a presionar en la cabecera el boton eventos') do 
    find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)').click
  end
  When('voy a presionar el boton de Eventos Pasados') do
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div:nth-child(1) > div.Menu-Bar-Evento > div.header-botones-eventos > button:nth-child(2)').click
  end
  Then('muestra un titulo de {string}') do |string|
    titleText=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div:nth-child(1) > div.Titulo-Eventos > h1:nth-child(2) > h3')
    if titleText.text != string
    	raise "deberia haber un titulo de eventos pasados"	
    end
  end
  When('presiono el boton de participar en el evento {string}') do |string|
    click_button('participar_'+string)
  end
  Then('el boton de participar  en el evento {string} cambia a dejar de participar') do |string|
    find_by_id('DejarParticipar_'+string)
  end
  When('presiono el boton de dejar de participar en el evento {string}') do |string|
    click_button('DejarParticipar_'+string)
  end
  
  Then('el boton de participar  en el evento {string} cambia a participar') do |string|
    find_by_id('participar_'+string)
  end
  When('presiono el boton de detalles en el evento {string}') do |string|
    click_button('Detalles_'+string)
  end
  When('presiono el boton de crear evento') do
    click_button('crear_evento')
  end
  
  When('lleno los campos necesarios para crear un evento') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
    case key
    when "nombre"
      fill_in 'nombre_evento', :with => value
    when "fecha"
      fill_in 'fecha_evento', :with => value
    end
    end
  end
  
  When('presiono el boton para guardar el evento') do
    click_button('GuardarEvento')
    sleep(3)
  end
  
  Then('deberia poder ver la tarjeta {string}') do |name|
    find("div[name='#{name}']")
  end
  Then('deberia ver') do |table|
    data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "horaIn"
    horaIni=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div/div[3]/div/div[1]/div/p[1]').text
    puts value
    if (horaIni!=value)
      raise value 
    end
	when "fecha"
    fecha=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div/div[3]/div/div[1]/div/p[2]').text
    if (fecha!=value)
      raise "Hora inicial incorrecta" 
    end
  when "proyecto"
     proyecto=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div/div[3]/div/div[1]/div/p[3]').text
     if (proyecto!=value)
       raise "Hora inicial incorrecta" 
    end
  when "horaFin"
    horaFin=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/p[1]').text
    if (horaFin!=value)
      raise "Hora inicial incorrecta" 
    end
  when "lugar"
    lugar=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/p[2]]').text
    if (lugar!=value)
      raise "Hora inicial incorrecta" 
    end
  when "categoria"
    categoria=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/p[3]').text
    if (categoria!=value)
      raise "Hora inicial incorrecta" 
    end
  when "descripcion"
    descripcion=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/p[5]]').text
    if (descripcion!=value)
      raise value 
    end
    end
  end
end
Then('deberia poder ver una alerta') do
  alerta=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div')
  if(alerta.text!='Nombre del Evento o Fecha del Evento vacía')
    raise "deberia mostrar una alerta"	
  end
end
Given('voy a presionar el boton eliminar de la tarjeta {string}') do |tarjeta|
  click_button('Eliminar_'+tarjeta)
end

Given('presiono el boton de confirmar para eliminar {string}') do |tarjeta|
  click_button('eliminarevento'+tarjeta)
end

Then('no deberia poder ver la tarjeta {string}') do |tarjeta|
  sleep(2)
  page.should_not have_css("div[name='#{tarjeta}']")
end
Then('se muestra en la pantalla en la parte derecha {string} indicando mis iniciales') do |iniciales|
inicialesPagina=find(:css,'#root > div:nth-child(2) > header > div.header-logo > div:nth-child(3) > div > div > span.MuiChip-label').text
if(inicialesPagina!=iniciales)
  raise "Deberia mostrarse"+iniciales
end
end

  