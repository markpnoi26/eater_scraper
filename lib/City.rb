class City
  
  @@all = []
  
  attr_accessor :name, :url
  
  def initialize(city_hash)
    city_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end
    @@all << self
  end
  
  def add_articles(articles_array)
    articles_array.each {|article| article.city = self}
  end
  
  def self.create_from_array(city_array)
    city_array.each do |city_hash|
      newCity_oi = City.new(city_hash)
    end
  end
  
  def self.all
    if @@all.count == 0
      Scraper.cities_scraper
      @@all
    else
      @@all
    end
  end
  
  def self.clear_all
    @@all = []
  end
  
end
