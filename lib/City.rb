class City
  
  @@all = []
  
  attr_accessor :name, :url, :articles
  
  def initialize(city_hash)
    city_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end
    @articles = []
    @@all << self
  end
  
  def add_articles
    Article.all.each do |article|
      @articles << article if article.city.name == self.name
    end
  end
  
  def self.create_from_array(city_array)
    city_array.each do |city_hash|
      newCity_oi = City.new(city_hash)
    end
  end
  
  def self.all
    @@all.count == 0? Scraper.cities_scraper : @@all
  end
  
  def self.clear_all
    @@all = []
  end
  
end
