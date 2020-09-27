class Restaurant
  attr_reader :name, :price, :type_of_cuisine, :address

  def initialize(name, price, type_of_cuisine, address)
    @name = name
    @price = price
    @type_of_cuisine = type_of_cuisine
    @address = address
  end

  def to_a
    [@name, @price, @type_of_cuisine, @address]
  end
end
