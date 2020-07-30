class API
    @@api_key = "afabb8e5d2cb9bf2ff8f9db8da6bb07a"
    #attr_reader :current_city
    def self.get_city_weather(input)
        url = "https://api.openweathermap.org/data/2.5/weather?q=#{input}&appid=#{@@api_key}"
        response = HTTParty.get(url)
        if !response["message"]
            current_city = City.new({name: response["name"], main: response["main"], description: response["description"],
            temperature: response["temp"], feels_like: response["feels_like"], high: response["temp_min"],
            low: response["temp_max"]}) #<-this is my constructor
            return current_city
        else 
            nil                    #CLI.invalid_city_name
        end
                                #CLI.get_weather_for_city(input)
                            #CLI.show_attributes(@current_city) 
    end                 
   
end  