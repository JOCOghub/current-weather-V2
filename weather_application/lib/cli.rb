class CLI
    def welcome
        puts "Welcome to the City Weather App!"
        puts "Enter the city you would like weather info for or press exit."
        input = gets.strip 
        if input == "exit"
          abort("Come back for more weather updates!")
        else  
          get_weather_for_city(input)
        end   
    end   
    
    def get_weather_for_city(input)
       if City.find(input)
          current_city = City.find(input)
          show_attributes(current_city, input)
       else
          current_city = API.get_city_weather(input)
          show_attributes(current_city, input) if current_city
       end  
        invalid_city_name
    end
   
    def invalid_city_name
        puts "Please enter a valid city's name or press `exit`"  
        input = gets.strip
        if input == "exit"
           abort("Come back for more weather updates!")
        else   
           get_weather_for_city(input)
        end  
    end       

    def show_attributes(current_city,input)
        puts "Weather for #{input.capitalize}:"
        current_city.weather.each { |k,v| puts " #{k}: #{v} "} 
        self.menu 
    end   

    def menu
        puts "Enter 1 to go to main menu or press `exit`"
        input = gets.strip 
        if input == "1"
           self.welcome
        elsif input == "exit"   
           abort("Come back for more weather updates")
        else 
           puts "invalid input"
           self.menu   
        end
    end       
    
end  