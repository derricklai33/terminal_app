require_relative 'restaurantapi'
require_relative 'restaurant'

class RandomChoice
  attr_reader :random

  def initialize
    @random = generate_random
  end

  def generate_random
    rand = CallApi.new
    new_arr = rand.restaurants.map(&:to_a)

    new_arr.sample
  end
end
