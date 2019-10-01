require_relative "Scraper.rb"
require_relative "Article.rb"
require_relative "City.rb"

class CommandLineInterfaceControls
  
  def welcome
    puts "Hello, Welcome to Eater Webscraper"
  end
  
  def city_selection
    puts "Here are the list of City you can take a look at:"
    # Scraper.cities_scraper.each do |name, url|
  end
  
  def city_articles_selection
    puts "Here are the list of articles in this city"
    (1..10).each {|number| puts "#{number}. Title, by Author(s) #{number}."}
  end
  
  def input
    puts "Please type in the number of what you would like to check out."
    input = gets.strip
  end
  
  def run
    welcome
    city
    input
    articles
    input
  end
  
end
