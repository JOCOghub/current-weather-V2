class CLI
    def welcome
        puts "Welcome to the City weather App!"
        puts "Enter the City you would like weather info for or press exit."
        input = gets.strip 
        if input == "exit"
          abort("Come back for more weather updates.")
        else  
          get_weather_for_city(input)
        end   
    end   
    
    def get_weather_for_city(input)
       if City.find_by_name(input)
          current_city = City.find_by_name(input)
          show_attributes(current_city)
       else
          current_city = API.get_city_weather(input)
          show_attributes(current_city) if current_city
       end  
        invalid_city_name
    end
   
    def invalid_city_name
        puts "Please enter a valid City's name or press `exit`"  
        input = gets.strip
        if input == "exit"
            abort("Come back for more weather updates.")
        else   
            get_weather_for_city(input)
        end  
    end       

    def show_attributes(current_city)
        puts "Weather for your city:"
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
    #MAKE SURE YOU CHECK ALL COMMENTS AT THE END
end  