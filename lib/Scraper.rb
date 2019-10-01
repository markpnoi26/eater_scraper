require "nokogiri"
require "open-uri"

class Scraper
  
  def self.cities_scraper(url)
    #returns an array of city hashes. 
    array = [
      {
        :name => "New York",
        :url => "url.newyork.eater"
      },
      {
        :name => "Seattle"
        :url => "url.seattle.eater"
      }
      ]
  end
  
  def self.latest_scraper(url)
    #returns a hash of each latest news for the given city
    article_array = [{
      :title => "Best food in Seattle",
      :authors => ["Joe Dane", "Roe Wade"],
      :url => "url.bestfoodinseattle.eater"
    }, {
      :title => "Best food in Atlanta",
      :authors => ["One Roe"]
      :url => "url.bestfoodinatlanta.eater"
    }]
  end
  
end
