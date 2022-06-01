#Dado que estoy en la pagina de iniciar sesion en la pagina de internet Start testing
Given("Estoy en la pagina de iniciar sesion de Start") do 
    page.driver.browser.manage.window.maximize
    visit 'https://testing-start.web.app/login' 
end

#Ingreso el correo electronico de "coreteam@gmail.com" para iniciar sesion
When('Ingreso {string} en el campo de correo para iniciar sesion') do  |email|
    fill_in 'email', :with =>email
end

#Ingreso la contraseña de "123456" para iniciar sesion
When("Ingreso {string} en el campo de contraseña para iniciar sesion") do  |contrasenia|
    fill_in 'password', :with =>contrasenia
end

#Y presiono el boton de Iniciar sesion
When("Presiono el boton de Iniciar sesión") do 
    find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div[2]/div/form/div/button/span[1]').click
end

#Entonces deberia ver la barra de opciones y la seccion de tus proximos eventos
Then('Deberia ver una barra de opciones y seccion de eventos proximos en la pagina principal') do 
  find(:xpath,'/html/body/div/div[2]/header/div[2]/div')
  find(:xpath,'/html/body/div/div[2]/div[1]/section/div[1]/div[1]/h2')
end


#Dado que estoy en la pagina principal de start deberia ingresar a la seccion de proyectos
Given("Estoy en la seccion de proyectos de start") do 
    page.driver.browser.manage.window.maximize
    find(:xpath,'/html/body/div/div[2]/header/div[2]/div/button[2]/span[1]').click
end

#Entonces deberia ver una lista de las categorias de proyectos 
When ('Ingreso deberia ver una lista de la categoria de proyectos') do 
    find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div')
end

#Entonces selecciono cualquier categoria de las existentes
When ('Selecciono la categoria de {string} de los proyectos existentes') do |categoria|
    case categoria.downcase
    when "medio ambiente"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div/div/a/button/div').click
    when "desarrollo sostenible"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/a/button/div').click
    when "trabajo social"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[3]/div/div/a/button/div').click
    when "empoderamiento"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[4]/div/div/a/button/div').click
    when "animales"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[5]/div/div/a/button/div').click
    when "comunidad"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[6]/div/div/a/button/div').click
    when "educacion"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[7]/div/div/a/button/div').click
    when "otros"
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[8]/div/div/a/button/div').click
    end
end

#Entonces deberia mostrarme los proyectos pertenencientes a esa categoria
When ('Me muestra los proyectos pertenencientes a la categoria de {string}') do |categoria|
    begin
        find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div')
    rescue 
        raise "No existe proyectos en esta categoria"
    end
end

#Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente
When('Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente')do 
    find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div[2]/div[2]/a').click
end

#Selecciono unirme en el primer proyecto de la categoria Medio Ambiente
When('Selecciono unirme en el primer proyecto de la categoria Medio Ambiente')do 
    find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div[2]/div[2]/div/div/button').click
    sleep(20)
end

#Entonces deberia mostrarme la lista de participantes de un proyecto
Then('Deberia mostrarme la lista de participantes de un proyecto')do 
    find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[3]').click
end

#Entonces deberia ver los eventos de un proyecto en especifico
Then('Deberia mostrarme los eventos relacionados a un proyecto')do 
    find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[2]')
    sleep(3)
end

#Deberia mostrarme en el card un mensaje de que estoy participando en el proyecto
Then('Deberia mostrarme en el card un mensaje de que estoy participando en el proyecto') do	
    mensaje=find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div[2]/div[3]').text
    if(mensaje=!"PARTICIPANDO")
        raise "No se pudo registrar la participacion"
    end
end


#Deberia mostrarme los detalles relacionados a un proyecto
Then('Deberia mostrarme los detalles relacionados a un proyecto') do 
    nombreProyecto=find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]/b/h1').text
    if(nombreProyecto=="Proyecto de prueba editado")
        bodyInfo=find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]')
        if(bodyInfo.length<=0)
            raise "No muestra ningun detalle del proyecto"
        end
    end
    sleep(3)
end

#Hago click en el boton de eliminar
And('Hago click en el boton de eliminar') do
  sleep(3)
  find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/button').click
end

#Deberia mostrarme una ventana de confirmacion para eliminar proyectp
Then('Deberia mostrar una ventana de confirmacion para eliminar proyecto') do
  sleep(5)
  find(:xpath,'/html/body/div[2]/div[3]/div')
end

And('Hago click en eliminar') do
  sleep(2)
  find(:xpath,'/html/body/div[2]/div[3]/div/div[3]/button[1]').click
end

#Then Devuelve categorias de proyectos 
Then('Devuelve categorias de proyectos') do
  sleep(1)
  find(:xpath,'/html/body/div/div[2]/div[1]/div')
end

#And Selecciono el boton de editar el primer proyecto
And ('Selecciono el boton de editar el primer proyecto')do
  sleep(1)
  find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div[2]/div[2]/button').click
end

Then('Deberia mostrarme un modal formulario')do
    sleep(1)
    find(:css,'body > div:nth-child(6) > div.paper-crear')
end

And('Edito los datos existentes del proyecto que estan en los campos del modal') do |table|
    data=table.rows_hash
    data.each_pair do |key, value|
    case key
    when "titulo"
        fill_in 'titulo',:with=>value
    when "objetivo"
        fill_in 'objetivo',:with=>value
    when "descripcion"
        fill_in 'descripcion',:with=>value
    when "fecha_inicio"
        fill_in 'fecha_inicio',:with=>value
    when "fecha_fin"
        fill_in 'fecha_fin',:with=>value
    when "url_imagen"
        fill 'url_imagen',:with=>value
    end
    sleep(2)
end
end

#And presiono el boton de guardar cambios
And('presiono el boton de guardar cambios')do 
    find(:css,'body > div:nth-child(6) > div.paper-crear > form > div:nth-child(3) > div.btn-crear-container').click
    sleep(2)
end

#Then Compruebo que minimamente el titulo "Proyecto Editado" este en el proyecto modificado
Then('Compruebo que minimamente el titulo {string} este en el proyecto modificado')do |nombre_proyecto|
    nombre_proyecto_editado=find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.MuiBox-root.jss258 > div > div:nth-child(1) > div.MuiBox-root.jss264 > div.MuiCardContent-root.card-container-box > p.MuiTypography-root.content-title.MuiTypography-body1.MuiTypography-gutterBottom').text
    if(nombre_proyecto_editado!=nombre_proyecto)
        raise "No se edito el proyecto correctamente"
    end
end

#Then Deberia mostrarme los detalles del proyecto
Then('Deberia mostrarme los detalles del proyecto')do  |table|
    data=table.rows_hash
    data.each_pair do  |key,value|
    case value
	when "2022-12-05"
        fecha_inicio=find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[1]').text
        if(fecha_inicio!="Fecha de Inicio: 2022-12-05")
            raise "Fecha de inicio no coincide"
        end
    end
    end
end 
	
#And Selecciono el boton de crear proyecto
And('Selecciono el boton de crear proyecto')do
    sleep(2)
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.MuiBox-root.jss31 > div > div.MuiGrid-root.jss30.MuiGrid-item.MuiGrid-grid-xs-7.MuiGrid-grid-md-5 > button').click
end

 #When Me muestra un formulario modal donde me pide ingresar datos
When('Me muestra un formulario modal donde me pide ingresar datos')do
    sleep(2)
    find(:css,'body > div:nth-child(6) > div.paper-crear')
end

 #And lleno los datos del nuevo proyecto
     #   |fecha_inicio   |31-05-2022 |
      #  |fecha_fin      |31-06-2022 |
       # |titulo         |El agua es oro|
       # |descripcion    |Proyecto que fortalece conocimientos para ahorrar agua |
       # |objetivo       |Crear conciencia del uso del agua |
       # |image_url      |https://adictec.com/media/2018/10/Mejores-herramientas-para-pruebas-testing-de-software.jpg |
And('lleno los datos del nuevo proyecto')do |table|
    data=table.rows_hash
    data.each_pair do |key, value|
    case key
    when 'fecha_inicio'
        fill_in 'fecha_inicio',:with=>value
    when 'fecha_fin'
        fill_in 'fecha_fin',:with=>value
    when 'titulo'
        fill_in 'titulo',:with=>value
    when 'descripcion'
        fill_in 'descripcion',:with=>value
    when 'objetivo'
        fill_in 'objetivo',:with=>value
    when 'image_url'
        fill_in 'image_url',:with=>value
    end
    sleep(2)
end
end

#And presiono el boton de guardar cambios
And("presiono el boton de guardar cambios crear proyecto")do
    find(:css,"body > div:nth-child(6) > div.paper-crear > form > div:nth-child(3) > div.btn-crear-container").click
    find(:xpath,"/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div").click
    sleep(10)
end

#And Selecciono boton de dejar de participar en proyecto
And("Selecciono boton de dejar de participar en proyecto")do
    sleep(3)
    find(:xpath,"/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[1]/button").click
    sleep(4)
end

# Deberia mostrarme un boton de Participar en proyecto
Then("Deberia mostrarme un boton de Participar en proyecto")do
    sleep(3)
    unirme=find(:xpath,"/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div[1]/div/button").text
    if(unirme!="UNIRME")
        raise "El boton no se actualizo"
    end
end


#setkills(f5)
#sleep(10)
#puts:Imprime