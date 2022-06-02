
  
  When('ingreso los campos necesarios para iniciar sesion') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
    case key
    when "Correo:"
      fill_in 'email', :with => value
    when "Contraseña:"
      fill_in 'password', :with => value
    end
    end
end
  


  Given('que se inicio sesion como lider') do
    visit('https://testing-start.web.app/login')
    fill_in 'email', :with => ENV['USER']
    fill_in 'password', :with => ENV['PSW']
    find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div[2]/div/form/div/button').click
  end

  


Then('deberia poder ver una alerta') do
  alerta=find(:xpath,'//*[@id="root"]/div[2]/div[1]/div/div[2]/div/div')
  if(alerta.text!='Nombre del Evento o Fecha del Evento vacía')
    raise "deberia mostrar una alerta"	
  end
end




  