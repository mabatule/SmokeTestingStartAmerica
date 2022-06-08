class Cuenta
    def initialize(page)
        @page = page
    end

    def exist_the_tittle(name)
        request = @page.has_content?(name)
        return request
    end
end