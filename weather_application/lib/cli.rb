class CLI
    def run
       menu
       goodbye 
    end     
   
    def menu
        puts "Welocome to the City weather application App!"
        puts "Enter the City you would like info about or press exit."
        city = gets.strip 
        self.get_weather_for_city(city)
    end   
    
    def self.get_weather_for_city(city)#this makes it that if user already asked for certain
       if City.find_by_name(city)#city then it would be stored and we wouldnt have
          current_city = City.find_by_name(city)#to look up API data again
       else 
          response = API.new.get_city_weather(city)
         if valid?#Find out what would make this valid or not
            current_city = City.new(response)
         else 
            puts "Please enter a valid City name"   
         end 
       end 
       self.prompt_user   
    end     
    
    def self.prompt_user
        puts "Enter w to see the weather details for your selected city "
        input = gets.strip 
        if input = "w"
            self.show_attributes
        else 
           self.prompt_user
        end    
    end
    
    def self.show_attributes
        
    end   

    def goodbye
        puts "Come back for more weather updates."
    end    
    
end  