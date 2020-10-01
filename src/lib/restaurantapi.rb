require 'byebug'
require 'json'
require_relative 'app_constants'

# Class to use read HTTP request from Zomato API
class CallApi
  attr_reader :restaurants, :user_restaurants
  attr_accessor :counter

  include AppConstants

  def initialize
    @restaurants = read_saved_restaurants
    @user_restaurants = []
    @counter = 1
  end

  # Multiple API HTTP requests done using HTTParty
  def read_api
    url = ['https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=20&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=40&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=0&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=80&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=60&count=100&sort=cost&order=desc']
    headers = {
      'user-key': '12cdc130154a9ed0c6004a4e01680fd4',
      'content-type': 'application/json'
    }

    response = []
    url.each do |value|
      restaurants = JSON.parse(HTTParty.get(value, headers: headers).response.body)['restaurants']
      restaurants.each do |restaurant|
        response << restaurant['restaurant']
      end
    end
    response
  end

  # Picking out required information from generated hash using HTTParty
  def api_restaurant
    count = 0
    arr = read_api
    arr.map do |value|
      Restaurant.new(
        count += 1,
        value['name'],
        value['average_cost_for_two'],
        value['cuisines'],
        value['location']['address'],
        value['user_rating']['aggregate_rating']
      )
    end
  end

  def generate_restaurants
    new_restaurants = Restaurant.restaurant_input
    @user_restaurants << Restaurant.new(
      new_restaurants['id'] = @counter,
      new_restaurants['name'],
      new_restaurants['price'],
      new_restaurants['cuisine'],
      new_restaurants['location'],
      new_restaurants['rating']
    )
    @counter += 1
    @user_restaurants
  end

  def save_restaurants
    data = @user_restaurants
    ret = data.map do |value|
      {
        id: value.id,
        name: value.name,
        price: value.price,
        cuisine: value.type_of_cuisine,
        address: value.address,
        rating: value.rating
      }
    end
    File.write("#{Dir.home}/Desktop/terminal_app/src/public/restaurants.json", JSON.pretty_generate(ret))
  end

  def read_saved_restaurants
    data = File.read("#{Dir.home}/Desktop/terminal_app/src/public/restaurants.json")
    JSON.parse(data).map do |value|
      Restaurant.new(
        value['id'],
        value['name'],
        value['price'],
        value['cuisine'],
        value['address'],
        value['rating']
      )
    end
  end

  # Generate a random restaurant array containing name, price for 2, cuisine, location and rating
  def generate_random
    rand = @restaurants
    new_arr = rand.map(&:to_a)
    new_arr.sample
  end
end
