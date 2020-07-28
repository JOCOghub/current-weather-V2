class CLI
    # def run
    #     menu
    #     goodbye
        
    # end     
   
    def run
       #city = nil
        #while city != "exit"
            puts "Enter the City you would like info about or press exit."
           city = gets.strip #make it not a city id!!!
           self.get_weather_for_city(city)
        #     case city 
        #     when "city a"
        #         puts "city a info"
        #     when "city b"   
        #         puts "city b info"
        #     else 
        #         puts "Please enter a valid city code" 
        #     end 
        # end         
    end   
    
    def get_weather_for_city(city_id)
        API.get_city_weather(city_id)
    end     

    def goodbye
        puts "Come back for more weather updates."
    end    
    
end  