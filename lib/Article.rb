class Article
  
  @@all = []
  
  attr_accessor :title, :authors, :date_posted, :url, :city
  
  def initialize(article_hash)
    article_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end
    @@all << self
  end
  
  def self.create_from_array(article_array)
    article_array.each do |article_hash|
      newArticle_oi = Article.new(article_hash)
    end
  end
  
  def self.all
    @@all
  end
  
  def self.clear_all
    @@all = []
  end
  
end

  