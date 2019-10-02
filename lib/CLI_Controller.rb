require_relative "Scraper.rb"
require_relative "Article.rb"
require_relative "City.rb"

class CommandLineInterfaceControls
  
  def welcome
    puts "Hello, Welcome to Eater Webscraper"
    
  end
  
  def display_cities
    puts "Here are the cities you can explore the food scene."
    city_array = Scraper.cities_scraper
    City.create_from_array(city_array)
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}."
    end
  end
  
  def display_articles_by_city
    puts "Please select the number of the city you wish to explore more about. "
    user_input = gets.strip.to_i
    if user_input.class == Integer
      puts "Here are the latest from #{City.all[user_input - 1].name}: "
      articles_array = Scraper.article_scraper(City.all[user_input - 1].url)
      Article.create_from_array(articles_array)
      Article.all.each do |article|
        puts "========================"
        puts "#{article.title}"
        puts "#{article.authors.join("and")}"
        puts "posted on #{article.date_posted} 2019"
      end
    end
  end
  
end