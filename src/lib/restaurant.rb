class Restaurant
  attr_reader :name, :price, :type_of_cuisine, :location
  
  def initialize(name, price, type_of_cuisine, location)
    @name = name
    @price = price
    @type_of_cuisine = type_of_cuisine
    @location = location
  end
  
end
