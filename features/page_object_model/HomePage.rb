
class HomePage
    def initialize(page)
        @page = page
    end
    def exist_the_tittle(name)
        request = @page.has_content?(name)
        return request
    end
    def headerExist()
        request = @page.find(:css,'#root > div:nth-child(2) > header > div.header-menu > div').text == ""
        return true
    end
end