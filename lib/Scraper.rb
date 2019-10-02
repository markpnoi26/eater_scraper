require "nokogiri"
require "open-uri"

class Scraper
  attr_accessor :city_array, :article_array
  
  def self.cities_scraper
    
    @city_array = []
    doc = Nokogiri::HTML(open("https://www.eater.com/cities-directory"))
    cities = doc.css("div.c-directory__short-body")
    cities.each do |city|
      city_hash = {
        :name => city.search("h2").text,
        :url => city.search("h2").css("a").attribute("href").value
      }
      @city_array << city_hash
    end
    City.create_from_array(@city_array)
  end
  
  def self.article_scraper(city_oi)
    
    @article_array = []
    city_doc = Nokogiri::HTML(open(city_oi.url))
    articles = city_doc.css("div.c-entry-box--compact")
    articles.each do |article|
      article_hash = {
        :title => article.css("div.c-entry-box--compact__body").css("h2").text,
        :url => article.css("div.c-entry-box--compact__body").css("h2").css("a").attribute("href").value,
        :date_posted => article.css("span.c-byline__item").css("time").text.gsub("\n", "").strip,
        :city => city_oi.name,
        :authors => (article.css("span.c-byline__item").css("a").collect {|name| name.css("span.c-byline__author-name").text}).reject { |name| name.to_s.empty? }
      }
      @article_array << article_hash
    end
    @article_array  
  end
  
end
