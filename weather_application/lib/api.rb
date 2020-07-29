class API
    @@api_key = "afabb8e5d2cb9bf2ff8f9db8da6bb07a"

    def self.get_city_weather(input)
        url = "https://api.openweathermap.org/data/2.5/weather?q=#{input}&appid=#{@@api_key}"
        response = HTTParty.get(url)
       City.new({name: response["name"], main: response["main"], description: response["description"],
         temperature: response["temp"], feels_like: response["feels_like"], high: response["temp_min"],
        low: response["temp_max"]}) #<-this is my constructor
    end                 
   
end   #other version is just return hash with no variable