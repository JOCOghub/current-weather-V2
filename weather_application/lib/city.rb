class City
    attr_accessor :name, :main, :description, :temperature, :feels_like, :high, :low

    @@all = []

    def initialize(hash)
      hash.each do |k, v|
        self.send("#{k}=", v)
        end    #might need to connect this method to show attributes
      @@all << self 
    end 

   def self.find_by_name(name) #make sure you know how to call this
      @@all.detect{|city| city.name == name} #&:
   end   

   def self.all 
      @@all
   end 
end   