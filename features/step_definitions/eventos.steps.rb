

  Given('estoy en la pagina de inicio de Start') do
    page.driver.browser.manage.window.maximize
     visit('https://testing-start.web.app/login')
  end
  When('ingreso el correo {string}') do |correo|
    fill_in 'email', :with => correo
  end
  When('ingreso la contraseña {int}') do |int|
    fill_in 'password', :with => int
  end
  Then('se muestra en la pantalla en la parte derecha {string} indicando mis iniciales') do |iniciales|
    sleep(2)
    inicialesPagina=find(:css,'#root > div:nth-child(2) > header > div.header-logo > div:nth-child(3) > div > div > span.MuiChip-label').text
    if(inicialesPagina!=iniciales)
      raise "Deberia mostrarse"+iniciales
    end
    end
  Then('deberia poder ver la tarjeta {string}') do |name|
    find("div[name='#{name}']")
  end
  Then('no deberia poder ver la tarjeta {string}') do |tarjeta|
    sleep(2)
    page.should_not have_css("div[name='#{tarjeta}']")
  end
  When('presiono el boton de participar en el evento {string}') do |evento|
    click_button('participar_'+evento)
    sleep(2)
  end
  Then('el boton de participar  en el evento {string} cambia a dejar de participar') do |evento|
    click_button('DejarParticipar_'+evento)
  end
  When('presiono el boton de dejar de participar en el evento {string}') do |evento|
    click_button('DejarParticipar_'+evento)
    sleep(2)
  end
  Then('el boton de dejar de participar en el evento {string} cambia a participar') do |evento|
    click_button('participar_'+evento)
  end

  When('lleno los campos necesarios para crear un evento') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
    case key
    when "nombre"
      fill_in 'nombre_evento', :with => value
    when "fecha"
      fill_in 'fecha_evento', :with => value
    when "horaIn"
      fill_in 'hora_inicio', :with => value
    when "horaFin"
      fill_in 'hora_fin', :with => value
    when "descripcion"
      fill_in 'descripcion_evento', :with => value
    end
    end
  end
  Given('voy a presionar el boton eliminar de la tarjeta {string}') do |tarjeta|
    click_button('Eliminar_'+tarjeta)
  end
  
  Given('presiono el boton de confirmar para eliminar {string}') do |tarjeta|
    click_button('eliminarevento'+tarjeta)
  end

  When('elijo la categoria {string} en el dropdown') do |categoria|
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div:nth-child(1) > div.Menu-Bar-Evento > div.header-filtro-eventos > select:nth-child(2)').find(:option, categoria).select_option
  end
  When('presiono el boton de detalles en el evento Prueba') do
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div.Container-Body > div:nth-child(19) > div > div.CardBody-Eventos.card-body > div > button:nth-child(2)').click
  end
  Then('muestra un titulo de {string}') do |string|
    titleText=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div:nth-child(1) > div.Titulo-Eventos > h1:nth-child(2) > h3')
    if titleText.text != string
    	raise "deberia haber un titulo de eventos pasados"	
    end
  end

  When('presiono el boton de detalles en el evento {string}') do |string|
    click_button('Detalles_'+string)
  end
  When('presiono el boton de crear evento') do
    click_button('crear_evento')
  end
  

  
  Then('deberia ver') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
    case key
    when "horaIn"
        hora=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.card > div > div > div.col > div > div.col.text-1 > div > p:nth-child(1)').text
        if(hora==value)
          puts "Hora de inicio validada"    
        else
          raise "Se esperaba  "+hora   
        end
      when "fecha"
        fecha=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.card > div > div > div.col > div > div.col.text-1 > div > p:nth-child(2)').text
        if(fecha==value)
          puts "Fecha validada"    
        else
          raise "Se esperaba "+fecha
        end
      when "proyecto"
        proyecto=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.card > div > div > div.col > div > div.col.text-1 > div > p:nth-child(3)').text
        if(proyecto==value)
          puts "proyecto validada"    
        else
          raise "Se esperaba "+proyecto
        end
      when "horaFin"
        horaFin=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.card > div > div > div.col > div > div:nth-child(2) > div > p:nth-child(1)').text
        if(horaFin==value)
          puts "hora finalizacion validada"    
        else
          raise "Se esperaba "+horaFin
        end
      when "lugar"
        lugar=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.card > div > div > div.col > div > div:nth-child(2) > div > p:nth-child(2)').text
        if(lugar==value)
          puts "lugar validado"    
        else
          raise "Se esperaba "+lugar
        end
      when "categoria"
        categoria=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.card > div > div > div.col > div > div:nth-child(2) > div > p:nth-child(3)').text
        if(categoria==value)
          puts "categoria validada"    
        else
          raise "Se esperaba "+categoria
        end
      when "descripcion"
        descripcion=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.card > div > div > div.col > div > div:nth-child(2) > div > p:nth-child(5)').text
        if(descripcion==value)
          puts "descripcion validada"    
        else
          raise "Se esperaba "+descripcion
        end
    end
    end
  end
  When('presiono el boton para guardar el evento') do
    click_button('GuardarEvento')
    sleep(3)
  end
  Then('voy a presionar en la cabecera el boton eventos') do 
    find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)').click
  end
  When('voy a presionar el boton de Eventos Pasados') do
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div:nth-child(1) > div.Menu-Bar-Evento > div.header-botones-eventos > button:nth-child(2)').click
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
  Then('voy a presionar el boton {string}') do |string|
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div[2]/div/form/div/button').click
  end