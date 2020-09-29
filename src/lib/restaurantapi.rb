require 'byebug'

# Class to use read HTTP request from Zomato API
class CallApi
  attr_reader :restaurants

  def initialize
    @restaurants = output_restaurant
  end

  # Multiple API HTTP requests done using HTTParty
  def read_api
    url = ['https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=0&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=20&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=40&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=60&count=100&sort=cost&order=desc', 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&start=80&count=100&sort=cost&order=desc']
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
  def output_restaurant
    count = 0
    arr = read_api
    byebug
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

  def generate_random
    rand = @restaurants
    new_arr = rand.map do |value|
      value.to_a
    end
    new_arr.sample
  end

end
