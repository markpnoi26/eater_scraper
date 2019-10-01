require_relative "Scraper.rb"

class CommandLineInterfaceControls
  
  def welcome
    puts "Hello, Welcome to Eater Webscraper"
  end
  
  def city
    puts "Here are the list of City you can take a look at:"
    range(1..10).each {|number| puts "#{number}. City Object #{number}."
  end
  
  def articles
    puts "Here are the list of articles in this city"
    range(1..10).each {|number| puts "#{number}. Title, by Author(s) #{number}."
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
