require './features/pages/ProjectToolsPage.rb'
@temporalList=[]
$pageProject=-1

Given("Estoy en la pagina de iniciar sesion de Start") do 
    page.driver.browser.manage.window.maximize()
    visit 'https://testing-start.web.app/login' 
    $pageProject=ProjectToolsPage.new(page)
end

When('Ingreso {string} en el campo de correo para iniciar sesion') do  |email|
    sleep(1)
    page.fill_in 'email', :with =>email
    sleep(2)
end

When("Ingreso {string} en el campo de contraseña para iniciar sesion") do  |contrasenia|
    sleep(1)
    page.fill_in 'password', :with =>contrasenia
    sleep(2)
end

When("Presiono el boton de Iniciar sesión") do 
    $pageProject.click_the_button_css_maximize('#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > button')
end

Then('Deberia ver una barra de opciones y seccion de eventos proximos en la pagina principal') do 
  @temporalList=['/html/body/div/div[2]/header/div[2]/div','/html/body/div/div[2]/div[1]/section/div[1]/div[1]/div']
  $pageProject.addData(@temporalList)
  $pageProject.exist_the_content_xpath()
  @temporalList=[]
end

Given("Estoy en la seccion de proyectos de start") do 
    $pageProject.click_the_button_css('#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(2)')
end

When ('Ingreso deberia ver una lista de las 8 categorias principales de proyectos') do 
    @temporalList=[
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div/div/a/button',
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/a/button',
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[3]/div/div/a/button',
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[4]/div/div/a/button',
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[5]/div/div/a/button',
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[6]/div/div/a/button',
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[7]/div/div/a/button',
        '/html/body/div/div[2]/div[1]/div/div[2]/div/div[8]/div/div/a/button'
    ]
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_xpath()
    @temporalList=[]
end

When ('Selecciono la categoria de {string} de los proyectos existentes') do |categoria|
    sleep(1)
    dir=""
    case categoria.downcase
    when "medio ambiente"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div/div/a/button/div'
    when "desarrollo sostenible"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/a/button/div'
    when "trabajo social"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[3]/div/div/a/button/div'
    when "empoderamiento"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[4]/div/div/a/button/div'
    when "animales"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[5]/div/div/a/button/div'
    when "comunidad"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[6]/div/div/a/button/div'
    when "educacion"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[7]/div/div/a/button/div'
    when "otros"
        dir='/html/body/div/div[2]/div[1]/div/div[2]/div/div[8]/div/div/a/button/div'
    end
    $pageProject.click_the_button_xpath(dir)
    sleep(2)
end

When ('Me muestra los proyectos pertenencientes a la categoria de {string}') do |categoria|
    @temporalList=['/html/body/div/div[2]/div[1]/div/div[2]/div']
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_xpath()
    @temporalList=[]
end

When('Selecciono ver detalles del primer proyecto de la categoria Medio Ambiente')do 
    $pageProject.click_the_button_xpath('/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div[2]/div[2]/a')
end

And('Selecciono ver detalles de un proyecto de la categoria Medio Ambiente')do 
    $pageProject.click_the_button_xpath('/html/body/div/div[2]/div[1]/div/div[2]/div/div[118]/div[2]/div[2]/a')
end

When('Selecciono unirme en un proyecto de la categoria Medio Ambiente')do 
    $pageProject.click_the_button_xpath('/html/body/div/div[2]/div[1]/div/div[2]/div/div[118]/div[2]/div[2]/div/div/button')
end

Then('Deberia mostrarme la lista de participantes de un proyecto')do 
    @temporalList=['/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[3]']
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_xpath()
    @temporalList=[]
end

Then('Deberia mostrarme los eventos relacionados a un proyecto')do 
    @temporalList=['/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[2]']
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_xpath()
    @temporalList=[]
end

Then('Deberia mostrarme en el card un mensaje de que estoy participando en el proyecto') do	
    answer=$pageProject.compare_strings_xpath('/html/body/div/div[2]/div[1]/div/div[2]/div/div[91]/div[2]/div[3]/span[1]',"PARTICIPANDO")
    if(answer==false)
        put "No se registro la participación correctamente"
    end
end


Then('Deberia mostrarme los detalles relacionados a un proyecto') do 
    sleep(1)
    nombreProyecto=find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]/b/h1').text
    if(nombreProyecto!="")
        bodyInfo=find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]')
        if(bodyInfo.nil?)
            raise "No muestra ningun detalle del proyecto"
        else
            puts "Revisando todos los detalles del proyecto"
            @temporalList=[
                '/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[1]',
                '/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[2]',
                '/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[3]',
                '/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[4]',
                '/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[5]',
                '/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[6]'
            ]
            $pageProject.addData(@temporalList)
            $pageProject.exist_the_content_xpath()
            @temporalList=[]
        end
    end
    sleep(2)
end

And('Hago click en el boton de eliminar') do
    $pageProject.click_the_button_xpath('/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/button')
end

Then('Deberia mostrar una ventana de confirmacion para eliminar proyecto') do
    @temporalList=['/html/body/div[2]/div[3]/div']
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_xpath()
    @temporalList=[]
end

And('Hago click en eliminar') do
    $pageProject.click_the_button_xpath('/html/body/div[2]/div[3]/div/div[3]/button[1]')
end

Then('Devuelve categorias de proyectos') do
    @temporalList=['/html/body/div/div[2]/div[1]/div']
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_xpath()
    @temporalList=[]
end

And ('Selecciono el boton de editar el ultimo proyecto')do
    $pageProject.click_the_button_xpath('/html/body/div/div[2]/div[1]/div/div[2]/div/div[91]/div[2]/div[2]/button')
end

Then('Deberia mostrarme un modal formulario')do
    @temporalList=['body > div:nth-child(6) > div.paper-crear']
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_css()
    @temporalList=[]
end

And('Edito los datos existentes del proyecto que estan en los campos del modal') do |table|
    sleep(1)
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
        fill_in 'url_imagen',:with=>value
    end
    sleep(2)
end
end

And('presiono el boton de guardar cambios')do 
    $pageProject.click_the_button_css('body > div:nth-child(6) > div.paper-crear > form > div:nth-child(3) > div.btn-crear-container')
end

Then('Compruebo que minimamente el titulo {string} este en el proyecto nuevo')do |nombre_proyecto|
    answer=$pageProject.compare_strings_xpath('/html/body/div/div[2]/div[1]/div/div[2]/div/div[4]/div[2]/div[1]/p[1]',nombre_proyecto)
    if(answer==false)
        raise "No se creo el proyecto correctamente"
    end
end

Then('Deberia mostrarme los detalles del proyecto')do  |table|
    sleep(1)
    data=table.rows_hash
    data.each_pair do  |key,value|
    case value
	when "2022-12-05"
        fecha_inicio=find(:xpath,'/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[1]').text
        if(fecha_inicio!="Fecha de Inicio: 2022-05-06")
            raise "Fecha de inicio no coincide"
        end
    end
    end
    sleep(2)
end 

And('Selecciono el boton de crear proyecto')do
    $pageProject.click_the_button_css('#root > div:nth-child(2) > div:nth-child(2) > div > div.MuiBox-root.jss31 > div > div.MuiGrid-root.jss30.MuiGrid-item.MuiGrid-grid-xs-7.MuiGrid-grid-md-5 > button')
end

When('Me muestra un formulario modal donde me pide ingresar datos')do
    @temporalList=['body > div:nth-child(6) > div.paper-crear']
    $pageProject.addData(@temporalList)
    $pageProject.exist_the_content_css()
    @temporalList=[]
end

And('lleno los datos del nuevo proyecto')do |table|
    sleep(1)
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

And("presiono el boton de guardar cambios crear proyecto")do
    $pageProject.click_the_button_css("body > div:nth-child(6) > div.paper-crear > form > div:nth-child(3) > div.btn-crear-container")
    $pageProject.click_the_button_xpath("/html/body/div/div[2]/div[1]/div/div[2]/div/div[1]/div")
end

And("Selecciono boton de dejar de participar en proyecto")do
    $pageProject.click_the_button_xpath("/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[1]/button")
end

Then("Deberia mostrarme un boton de Participar en proyecto")do
    answer=$pageProject.compare_strings_xpath("/html/body/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div[1]/div/button","UNIRME")
    if(answer==false)
        raise "El boton no se actualizo"
    end
end


Then('Compruebo que minimamente la descripcion del proyecto {string} este en el proyecto modificado')do |descripcion|
    answer=$pageProject.compare_strings_xpath("/html/body/div/div[2]/div[1]/div/div/div/div[2]/p[3]",descripcion)
    if(answer==false)
        raise "No se actualizo correctamente el proyecto"
    end
end
