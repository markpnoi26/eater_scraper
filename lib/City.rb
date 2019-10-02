class City
  
  @@all = []
  
  attr_accessor :name, :url
  
  def initialize(city_hash)
    city_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end
    @@all << self
  end
  
  def self.create_from_array(city_array)
    city_array.each do |city_hash|
      newCity_oi = City.new(city_hash)
    end
  end
  
  def self.all
    @@all
  end
  
end
