class City
    attr_accessor :weather, :city
    @@all = []

    def initialize(hash)
      hash.each do |k, v|
        self.send("#{k}=", v)
      end    
      @@all << self 
    end 

   def self.find(city)
      @@all.detect(&:city) 
   end   

   def self.all 
      @@all
   end 
end   