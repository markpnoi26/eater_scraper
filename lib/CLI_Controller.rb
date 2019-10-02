require_relative "Scraper.rb"
require_relative "Article.rb"
require_relative "City.rb"
require 'colorize'

class CommandLineInterfaceControls
  
  def welcome
    puts "Hello, Welcome to Eater Webscraper"
  end
  
  def display_cities
    puts "Here are the cities you can explore the food scene."
    # Scraper.cities_scraper
    City.all.each.with_index(1) do |city, index|
      puts "#{index}. #{city.name}."
    end
  end
  
  def display_articles_by_city
    puts "Please select the number of the city you wish to explore more about. "
    user_input = gets.strip.to_i
    if user_input.between?(1, 24)
      puts "Here are the latest from #{City.all[user_input - 1].name}: "
      articles_array = Scraper.article_scraper(City.all[user_input - 1].url)
      Article.create_from_array(articles_array)
      Article.all.each do |article|
        puts "==============================================================================".colorize(:green)
        puts "#{article.title}".upcase
        puts "by: #{(article.authors.count == 2)? article.authors.join(" and "): article.authors[0]}"
        puts "posted on #{article.date_posted} 2019"
        puts "read at : " + "#{article.url}".colorize(:light_blue)
        puts "==============================================================================".colorize(:green)
      end
      Article.clear_all
    else
      puts "Please enter a valid input"
      display_articles_by_city
    end
  end

  def run
    welcome
    display_cities
    display_articles_by_city
    puts "Would you like to visit another city? (Y/N)"
    user_input = gets.strip
    if user_input.downcase == "y"
      City.clear_all
      run
    else
      puts "Thank you for visiting us today!"
    end
  end
  
end