require_relative 'app_constants'

# Class to initialize restaurant object
class Restaurant
  attr_reader :id, :name, :price, :type_of_cuisine, :address, :rating

  include AppConstants

  # Instance attributes for initialization. (More variables can be added given they are available from API)
  def initialize(id, name, price, type_of_cuisine, address, rating)
    @id = id.to_i
    @name = name
    @price = price.to_i
    @type_of_cuisine = type_of_cuisine
    @address = address
    # Changed rating data type to float to fit sorting method on sorting.rb
    @rating = rating.to_f
  end

  # Method to convert object into an array of array to fit terminal table format
  def to_a
    [@id, @name, @price, @type_of_cuisine, @address, @rating]
  end

  def self.restaurant_input
    restaurants = {}
    INPUTS.each do |prompt|
      puts "Input the #{prompt}?".colorize(:green)
      puts 'Enter range from 0.0 to 5.0'.colorize(:green) if prompt == 'rating'
      puts 'Example: 2 Elizabeth Street, Melbourne'.colorize(:green) if prompt == 'location'
      puts 'Example: Asian, Japanese'.colorize(:green) if prompt == 'cuisine'
      print '> '.colorize(:green)
      restaurants[prompt] = gets.chomp
    end
    restaurants
  end
end
