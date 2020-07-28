class Location
    attr_accessor :name, :main, :description, :temperature, :feels_like, :high, :low

    def initialize(hash)
      hash.each do |k, v|
        self.send("#{k}=", v)
    end    
end   