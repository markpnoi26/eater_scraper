require "nokogiri"
require "open-uri"


city_url = "https://seattle.eater.com/"
city_doc = Nokogiri::HTML(open(city_url))

city_doc.css("div.c-entry-box--compact__body").css("h2").text #latest title
city_doc.css("div.c-entry-box--compact__body").css("h2").css("a").attribute("href").value #latest url
city_doc.css("span.c-byline__item").css("a").text #authors
city_doc.css("span.c-byline__item").css("time").text.gsub("\n", "").strip



class Scraper
  attr_accessor :city_array, :latest_array
  
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
    puts @city_array
  end
  
  def self.latest_scraper(city_url)
    city_doc = Nokogiri::HTML(open(city_url))
    @latest_array = []
    city_doc.each do |latest|
      
      
    city_doc.css("div.c-entry-box--compact__body").css("h2").text #latest title
    city_doc.css("div.c-entry-box--compact__body").css("h2").css("a").attribute("href").value #latest url
    city_doc.css("span.c-byline__item").css("a").text #authors
    city_doc.css("span.c-byline__item").css("time").text.gsub("\n", "").strip
    
    #return array
    article_array = [{
      :title => "Best food in Seattle",
      :authors => ["Joe Dane", "Roe Quade"],
      :url => "url.bestfoodinseattle.eater"
    }, {
      :title => "Best food in Atlanta",
      :authors => ["One Roe"]
      :url => "url.bestfoodinatlanta.eater"
    }]
  end
  
end
