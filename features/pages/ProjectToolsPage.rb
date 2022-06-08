$elements
class ProjectToolsPage
    def initialize(page)
        @page=page
    end
    def addData(list)
        $elements=list
    end
    def cleanData()
        $elements=[]
    end
    def exist_the_content_xpath()
        $elements.each do |elemento|
            begin
                sleep(5)
                direccion=elemento.to_s
                puts direccion
                @page.find(:xpath,direccion)
                sleep(2)
            rescue
                raise 'El elemento no existe'
            end
        end
        cleanData()
    end
    def exist_the_content_css()
        $elements.each do |elemento|
            begin
                sleep(5)
                direccion=elemento.to_s
                puts direccion
                @page.find(:css,direccion)
                sleep(2)
            rescue
                raise 'El elemento no existe'
            end
        end
        cleanData()
    end


    def click_the_button_xpath(dir_button)
        sleep(1)
        dir=dir_button.to_s
        begin
            @page.find(:xpath,dir).click
        rescue
            raise 'El elemento no existe :C'
        end
        sleep(2)
    end



    def click_the_button_css_maximize(dir_button)
        sleep(1)
        @page.driver.browser.manage.window.maximize
        dir=dir_button.to_s
        begin
            @page.find(:css,dir).click
        rescue
            raise 'El elemento no existe :C'
        end
        sleep(2)
    end

    def click_the_button_css(dir_button)
        sleep(1)
        @page.driver.browser.manage.window.maximize
        dir=dir_button.to_s
        begin
            @page.find(:css,dir).click
        rescue
            raise 'El elemento no existe :C'
        end
        sleep(2)
    end

    def compare_strings_xpath(dir_string,string_comparate)
        answer=false
        sleep(1)
        dir_final=dir_string.to_s
        string_comparate_final=string_comparate.to_s
        begin
            mensaje=@page.find(:xpath,dir_final).text
            if(mensaje==string_comparate_final)
                answer=true
            end
        rescue
            raise 'El elemento no existe :C'
        end
        sleep(2)
        return answer
    end






end

