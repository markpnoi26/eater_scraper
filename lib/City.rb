class City
  
  @@all = []
  
  attr_accessor :name, :url
  
  def initialize(city_hash)
    city_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", "#{attribute_value}")
    end
  end
  
  def add_articles(articles_oi_array)
    articles_oi_array.each do |article|
      article.city = self
    end
  end
  
  def view_articles
    Article.all.collect {|article| article.city == self} #returns array of the articles by this city
  end
  
end
