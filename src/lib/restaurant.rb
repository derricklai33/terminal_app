class Restaurant
  attr_reader :id, :name, :price, :type_of_cuisine, :address, :rating

  # Class to initialize restaurant object
  def initialize(id, name, price, type_of_cuisine, address, rating)
    @id = id
    @name = name
    @price = price
    @type_of_cuisine = type_of_cuisine
    @address = address
    @rating = rating
  end

  def to_a
    [@id, @name, @price, @type_of_cuisine, @address, @rating]
  end
end
