class API
    @@api_key = "afabb8e5d2cb9bf2ff8f9db8da6bb07a"
    def self.get_city_weather(input)
        url = "https://api.openweathermap.org/data/2.5/weather?q=#{input}&appid=#{@@api_key}"
        response = HTTParty.get(url)
        if !response["message"]
            current_city = City.new({weather: response["main"]})
            return current_city
        else 
            nil       
        end      
    end                 
end  