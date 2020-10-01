# Class to initialize restaurant object
class Restaurant
  attr_reader :id, :name, :price, :type_of_cuisine, :address, :rating

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
    inputs = %w[name price cuisine location rating]
    restaurants = {}
    inputs.each do |prompt|
      puts "Input the #{prompt}?"
      print '> '
      restaurants[prompt] = gets.chomp
    end
    restaurants
  end
end
