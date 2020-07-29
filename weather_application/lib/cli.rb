class CLI
    # def run
    #    welcome
        
    # end     
   
    def welcome
        puts "Welcome to the City weather application App!"
        puts "Enter the City you would like weather info for or press exit."
        input = gets.strip 
        self.get_weather_for_city(input)
    end   
    
    def self.get_weather_for_city(input)#this makes it that if user already asked for certain
       if City.find_by_name(input)#city then it would be stored and we wouldnt have
          current_city = City.find_by_name(input)#to look up API data again
       else 
          response = API.new.get_city_weather(input)
         if valid?#Find out what would make this valid or not
            current_city = City.new(response)
         else 
            puts "Please enter a valid City name" 
            self.get_weather_for_city  
         end 
       end 
       self.show_attributes
    #    self.prompt_user   
    end     
    
    # def self.prompt_user
    #     puts "Enter w to see the weather details for your selected city "
    #     input = gets.strip 
    #     if input = "w"
    #         self.show_attributes
    #     else 
    #        self.prompt_user
    #     end    
    # end
    
    def self.show_attributes
        

        self.menu #need self? ask govgov
    end   

    def menu
       puts "Enter 1 to go to main menu or press `exit`"
       input = gets.strip 
       if input = "1"
          self.welcome 
       elsif input = "exit"   
          abort("Come back for more weather updates")
       else 
        puts "invalid input"
        menu   
       end
    end       
    
end  