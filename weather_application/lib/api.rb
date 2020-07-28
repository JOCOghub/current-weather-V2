class API
  
    @@api_key = "afabb8e5d2cb9bf2ff8f9db8da6bb07a"

    def self.get_city_weather(city)
        url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{@@api_key}"
        response = HTTParty.get(url)
        binding.pry
    end                 
   
end   