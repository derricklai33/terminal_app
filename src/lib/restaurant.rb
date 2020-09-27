class Restaurant
  attr_reader :id, :name, :price, :type_of_cuisine, :address

  def initialize(id, name, price, type_of_cuisine, address)
    @id = id
    @name = name
    @price = price
    @type_of_cuisine = type_of_cuisine
    @address = address
  end

  def to_a
    [@id, @name, @price, @type_of_cuisine, @address]
  end
end
