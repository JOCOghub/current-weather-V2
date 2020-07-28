class Location
    attr_accessor :name, :main, :description, :temperature, :feels_like, :high, :low

    @@all = []

    def initialize(hash)
      hash.each do |k, v|
        self.send("#{k}=", v)
        end    
      @@all << self 
    end 

   def find_by_name(name)
      @@all.find{&:name}
   end   

end   