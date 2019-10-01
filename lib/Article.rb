class Article
  
  @@all = []
  
  attr_accessor :title, :authors, :posted_date, :url, :city
  
  def initialize(article_hash)
    article_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", "#{attribute_value}")
    end
  end
  
  def self.all
    @@all
  end
  
end

  