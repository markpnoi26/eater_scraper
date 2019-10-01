require "nokogiri"
require "open-uri"

# url = "https://www.eater.com/cities-directory"
# doc = Nokogiri::HTML(open(url))

# cities = doc.css("div.c-directory__short-body")
# cities.search("h2").text #city names array
# cities.search("h2").css("a").attribute("href").value #city urls

class Scraper
  attr_accessor :city_array
  
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
  
  # def self.latest_scraper(url)
  #   #return array
  #   article_array = [{
  #     :title => "Best food in Seattle",
  #     :authors => ["Joe Dane", "Roe Quade"],
  #     :url => "url.bestfoodinseattle.eater"
  #   }, {
  #     :title => "Best food in Atlanta",
  #     :authors => ["One Roe"]
  #     :url => "url.bestfoodinatlanta.eater"
  #   }]
  # end
  
end
