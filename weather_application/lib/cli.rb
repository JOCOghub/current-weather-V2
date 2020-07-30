class CLI
    # def run
    #    welcome
    #    API.get_city_weather(input)
    #    get_weather_for_city(input)
    #    show_attributes
    #    menu
    # end     
    attr_accessor :current_city
    def welcome
        puts "Welcome to the City weather application App!"
        puts "Enter the City you would like weather info for or press exit."
        input = gets.strip 
        get_weather_for_city(input)
    end   
    
    def get_weather_for_city(input)#this makes it that if user already asked for certain
       if City.find_by_name(input)#city then it would be stored and we wouldnt have
          @current_city = City.find_by_name(input)#to look up API data again
       else 
          @current_city = API.get_city_weather(input)#might need API.new.get_city_weather
       end  
    end

    def self.invalid_city_name
        puts "Please enter a valid City's name"  
        input = gets.strip
        API.get_city_weather(input)    
    end       

    def self.show_attributes(current_city)
        print current_city#how
        self.menu 
    end   

    def self.menu
        puts "Enter 1 to go to main menu or press `exit`"
        input = gets.strip 
        if input == "1"
           self.welcome #breaking code
        elsif input == "exit"   
           abort("Come back for more weather updates")
        else 
           puts "invalid input"
           self.menu   
        end
    end       
    #MAKE SURE YOU CHECK ALL COMMENTS AT THE END
end  