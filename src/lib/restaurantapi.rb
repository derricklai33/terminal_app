# Class to use read HTTP request from Zomato API
class CallApi
  attr_reader :restaurants

  def initialize
    @restaurants = output_restaurant
  end

  # API key required from Zomato and parse through HTTParty to generate hash of list of restaurants
  def read_api
    url = 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&count=100&sort=cost&order=asc
    '
    headers = {
      'user-key': '12cdc130154a9ed0c6004a4e01680fd4',
      'content-type': 'application/json'
    }

    response = HTTParty.get(url, headers: headers)
    example = JSON.parse(response.body)
    example['restaurants']
  end

  # Picking out required information from generated hash using HTTParty
  def output_restaurant
    count = 0
    hash = read_api
    hash.map do |value|
      Restaurant.new(
        count += 1,
        value['restaurant']['name'],
        value['restaurant']['average_cost_for_two'],
        value['restaurant']['cuisines'],
        value['restaurant']['location']['address']
      )
    end
  end
end
