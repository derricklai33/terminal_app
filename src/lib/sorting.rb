# Class to sort restaurants according to price, cuisine type and rating
class SortingRestaurant
  attr_reader :sorted

  def initialize
    @sorted = CallApi.new
  end

  # Method to sort by price in hash and convert to an array of arrays to fit terminal table format
  def sorting_price
    price = @sorted.restaurants.sort_by(&:price).reverse.map(&:to_a)
    reset_counter(price)
  end

  # Method to sort by cuisine type in hash and convert to an array of arrays to fit terminal table format
  def sorting_cuisine
    cuisine = @sorted.restaurants.sort_by(&:type_of_cuisine).map(&:to_a)
    reset_counter(cuisine)
  end

  # Method to sort by rating in hash and convert to an array of arrays to fit terminal table format
  def sorting_rating
    rating = @sorted.restaurants.sort_by(&:rating).reverse.map(&:to_a)
    reset_counter(rating)
  end

  # Method to reset counters in ascending order of 1 to 100 after sorting
  def reset_counter(arr)
    counter = 1
    arr.map do |id|
      id[0] = counter
      counter += 1
    end
    arr
  end
end
