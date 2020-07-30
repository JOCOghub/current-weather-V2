class City
    attr_accessor :weather
    @@all = []

    def initialize(hash)
      hash.each do |k, v|
        self.send("#{k}=", v)
      end    
      @@all << self 
    end 

   def self.find_by_name(name) 
      @@all.detect(&:name) 
   end   

   def self.all 
      @@all
   end 
end   