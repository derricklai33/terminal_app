require 'httparty'
require 'json'

class CallApi

  attr_reader :restaurants

  def initialize
    @restaurants = read_api
  end

  def read_api
    url = 'https://developers.zomato.com/api/v2.1/search?entity_id=259&entity_type=city&count=2'
    headers = {
      'user-key': '12cdc130154a9ed0c6004a4e01680fd4',
      'content-type': 'application/json'
    }

    response = HTTParty.get(url, headers: headers)
    example = JSON.parse(response.body)

    hash = {}
    hash = example["restaurants"]

    hash.map do |value|
      Restaurant.new(
        value["restaurant"]["name"],
        value["restaurant"]["average_cost_for_two"],
        value["restaurant"]["cuisines"],
        value["restaurant"]["location"]['address']
      )
    end
  end
end